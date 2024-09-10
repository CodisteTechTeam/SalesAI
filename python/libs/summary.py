import json
import os
from langchain.chat_models import ChatOpenAI
from langchain.chains.summarize import load_summarize_chain
from langchain.text_splitter import RecursiveCharacterTextSplitter
from langchain.schema import Document
from langchain.prompts.chat import (
    ChatPromptTemplate,
    SystemMessagePromptTemplate,
    AIMessagePromptTemplate,
    HumanMessagePromptTemplate
)
from langchain.schema import (
    AIMessage,
    HumanMessage,
    SystemMessage
)
from dotenv import load_dotenv
from libs.chromadb import insert_transcript,insert_summary,insert_json
from libs.audio2text import transcriptgenerator
from loguru import logger

load_dotenv()

os.environ['OPENAI_API_KEY'] = os.getenv("OPEN_API_KEY")
LLM = ChatOpenAI(temperature=0,model = "gpt-4o-mini")

SUMMARY_OUTPUT_OPTIONS = {

    'long' : """
     - A verbose summary
     - You may do a few paragraphs to describe the transcript if needed
    """,
    
    'json' : """
    {
    "Key Points": " ",

    "Personal Information": " ", 

    "Positive Feedback": " ",

    "Negative Feedback": " ",

    "Actionable Items": " ",

    "Overall Sentiment": " "
    }
    """
    
}

def transcripttype(option):
    if option == "loan":
        path = os.path.join(
        os.path.dirname(os.path.abspath(__file__)),
        "..",
        "prompts",
        "loan.txt",
        )
    elif option == "creditcard":
        path = os.path.join(
        os.path.dirname(os.path.abspath(__file__)),
        "..",
        "prompts",
        "creditcard.txt",
        )
    else:
        path = os.path.join(
        os.path.dirname(os.path.abspath(__file__)),
        "..",
        "prompts",
        "sales.txt",
        )
    
    with open(path, 'r') as file:
        content = file.read()

    return content

def prompt_chain(template):

    system_message_prompt_combine = SystemMessagePromptTemplate.from_template(template)
    human_template="{text}" # Simply just pass the text as a human message
    human_message_prompt_combine = HumanMessagePromptTemplate.from_template(human_template)

    chat_prompt_combine = ChatPromptTemplate.from_messages(messages=[system_message_prompt_combine, human_message_prompt_combine])
    chain = load_summarize_chain(LLM,
                             chain_type="map_reduce",
                             combine_prompt=chat_prompt_combine,
                             verbose=True
                            )
    return chain

def store_summaries(meeting_id,summary):

    if isinstance(summary, str):
        try:
            summary = json.loads(summary)  # Convert JSON string to dictionary
        except json.JSONDecodeError:
            raise ValueError("Provided summary is not a valid JSON string")
    elif not isinstance(summary, dict):
        raise TypeError("Summary should be a dictionary or a JSON string")
    folder_path = os.path.join(
         os.path.dirname(os.path.abspath(__file__)),
         "..",
         "summaries"
        )
    file_path = os.path.join(folder_path,f"{meeting_id}.json")
    data = {
        'meeting_id':meeting_id,
        'summary':summary
    }
    with open(file_path, "w") as f:
        json.dump(data,f,indent=4)

    
    
    
    
def generatesummary_and_dbinsertion(meeting_id,meeting_description,optiontype):
    try:
        transcript_path = transcriptgenerator(meeting_id)
        logger.info("Transcript generated successfully")
    except Exception as e:
        logger.error(f"Transcript not generated for meeting id:{meeting_id} and error:{e}")
    with open(transcript_path, 'r') as file:
        content = file.read()
    with open(transcript_path, 'r') as file:
        content = file.read()
    text_splitter = RecursiveCharacterTextSplitter(separators=["\n\n", "\n"], chunk_size=1000, chunk_overlap=100)
    texts = text_splitter.create_documents([content])
    template = transcripttype(optiontype)
    chain = prompt_chain(template)
    chain_summary = prompt_chain(SUMMARY_OUTPUT_OPTIONS['long'])
    summary_output = chain_summary.run({
        "input_documents": texts,
        "output_format": SUMMARY_OUTPUT_OPTIONS['long']
        })

    logger.info("Summary output generated")
    jsontext_output = chain.run({
        "input_documents": texts,
        "output_format": SUMMARY_OUTPUT_OPTIONS['json']
    })
    logger.info("Json output generated")
    # print(jsontext_output)
    try:
        store_summaries(meeting_id,jsontext_output)
        logger.info("Meeting details saved successfully")
    except Exception as e:
        logger.error(f"Error in saving meeting details and error:{e}")

    try:
        for idx,chunks in enumerate(texts):
            data = chunks.page_content
            insert_transcript(data,meeting_id)
        logger.info(f"Transcripts Chunk Data inserted for meeting id:{meeting_id}")
    except Exception as e:
        logger.info(f"Get errorr in inserting transcripts chunk data for meeting id:{meeting_id}")
        logger.error(f"Error:{e}")

    try:
        insert_summary(summary_output,meeting_id)
        logger.info(f"Summary inserted for meeting id:{meeting_id}")
    except Exception as e:
        logger.info(f"Get error in inserting summary in DB for meeting id:{meeting_id}")
        logger.error(f"Error:{e}")

    try:
        json_output = json.loads(jsontext_output)
        for key,value in json_output.items():
            insert_json(key,value,meeting_id)
        logger.info(f"Chunk Data inserted for meeting id:{meeting_id}")
    except Exception as e:
        logger.info(f"Get errorr in inserting chunk data for meeting id:{meeting_id}")
        logger.error(f"Error:{e}")








   

