import os
from pymongo import MongoClient
from langchain_mongodb import MongoDBAtlasVectorSearch
from langchain_openai import OpenAIEmbeddings
from dotenv import load_dotenv


load_dotenv()

MONGO_STRING = os.getenv('MONGO_CONNECTIONSTRING')
MONGO_CLIENT = MongoClient(MONGO_STRING)
DATABASE = os.getenv('DATABASE')
DB = MONGO_CLIENT[DATABASE]
EMBEDDING_COLLECTION = DB['transcript_embedding']

os.environ['OPENAI_API_KEY'] = os.getenv("OPEN_API_KEY")
EMBEDDINGS_MODEL = OpenAIEmbeddings()

VS = MongoDBAtlasVectorSearch(EMBEDDING_COLLECTION,EMBEDDINGS_MODEL,index_name="embedding_index",text_key= 'transcript_chunk')

def insert_transcript(transcript_chunk,meeting_id):
    collection = DB['transcript_embedding']
    embeddings = EMBEDDINGS_MODEL.embed_query(transcript_chunk)
    document = {
        "transcript_chunk":transcript_chunk,
        "embeddings":embeddings,
        "meeting_id":meeting_id
    }
    collection.insert_one(document)


def insert_summary(text_output, meeting_id):
    collection = DB['summary_data']
    document = {
        "summary": text_output,
        "meeting_id": meeting_id
    }
    collection.insert_one(document)


def insert_json(key,value,meeting_id):
    collection = DB['json_embeddings']
    chunk = f"{key}: {value}"
    embedding = EMBEDDINGS_MODEL.embed_query(chunk)
    document = {
        "chunk": chunk,
        "embedding": embedding,
        "meeting_id": meeting_id
    }
    collection.insert_one(document)


def embedding_query(meeting_id,query):
    docs=VS.similarity_search(query,k=10,filter = {"meeting_id":meeting_id})
    context = "\n".join(doc.page_content for doc in docs)
    return context