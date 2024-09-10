import os
from dotenv import load_dotenv
from langchain.embeddings import OpenAIEmbeddings
from langchain.vectorstores import Chroma
from langchain.schema import Document

load_dotenv()

# Initialize OpenAI Embeddings
os.environ['OPENAI_API_KEY'] = os.getenv("OPEN_API_KEY")
embedding_model = OpenAIEmbeddings()

# Set up Chroma vectorstore
CHROMADB_PATH = os.getenv('CHROMADB_PATH', './chroma_db')  # Path to store ChromaDB data
vectorstore = Chroma(persist_directory=CHROMADB_PATH, embedding_function=embedding_model)

def insert_transcript(transcript_chunk, meeting_id):
    # Generate embeddings explicitly
    document = Document(
        page_content=transcript_chunk,
        metadata={"meeting_id": meeting_id},
    )
    vectorstore.add_documents([document])

def insert_summary(text_output, meeting_id):
    document = Document(
        page_content=text_output,
        metadata={"meeting_id": meeting_id}
    )
    vectorstore.add_documents([document])

def insert_json(key, value, meeting_id):
    chunk = f"{key}: {value}"
    document = Document(
        page_content=chunk,
        metadata={"meeting_id": meeting_id},
    )
    vectorstore.add_documents([document])

def embedding_query(meeting_id,query):
    # Perform similarity search using the vectorstore
    docs = vectorstore.similarity_search(query, k=10,filter = {"meeting_id":meeting_id})
    context = "\n".join([doc.page_content for doc in docs])
    return context