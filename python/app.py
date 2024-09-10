import warnings
import os
import json
from fastapi import FastAPI, HTTPException, Query
from fastapi.responses import JSONResponse
from pydantic import BaseModel
from libs.summary import generatesummary_and_dbinsertion
from libs.chatbot import query_response
from fastapi.middleware.cors import CORSMiddleware
from fastapi import FastAPI, File, UploadFile,Form,BackgroundTasks
from loguru import logger


app = FastAPI()

# origins = [
#     "https://sales-ai-y98wlc.flutterflow.app/"
#     "*",  # Allow all origins
# ]

app.add_middleware(
    CORSMiddleware,
    allow_origins=["https://sales-ai-y98wlc.flutterflow.app","*"],  # Specific origin
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


warnings.filterwarnings(
    "ignore",
    category=UserWarning,
    message="Default grid_sample and affine_grid behavior has changed*",
)

class SummaryRequest(BaseModel):
    meeting_id: str
    optiontype: str

class ChatbotRequest(BaseModel):
    meeting_id:str
    usertext: str

class Meeting(BaseModel):
    meeting_id: str
    meeting_description: str

class Summary(BaseModel):
    meeting_id:str


@app.post("/uploadaudio/")
async def upload_audio(
    background_tasks: BackgroundTasks,
    meeting_id: str = Form(...),
    meeting_description: str = Form(...),
    optiontype: str = Form(...),
    file: UploadFile = File(...)
):
    try:

        meeting_folder_path = os.path.join(
            os.path.dirname(os.path.abspath(__file__)),
            "meetings"
        )

        meeting_list = []
        for file_meet in os.listdir(meeting_folder_path):
            if file_meet.endswith('.json'):
                meeting_list.append(os.path.splitext(file_meet)[0])


        if meeting_id in meeting_list:
            return {"message": "File not Uploaded. Meeting Id already exists.Please change meeting id",
                    "isSuccess":False}
        else:
            audio_folder_path = os.path.join(
                os.path.dirname(os.path.abspath(__file__)),
                "audios"
            )
            audio_file_location = os.path.join(audio_folder_path, f"{meeting_id}.wav")
            with open(audio_file_location, "wb") as f:
                f.write(await file.read())

            logger.info("Audio File uploaded successfully")


            meeting_file_location = os.path.join(meeting_folder_path, f"{meeting_id}.json")
            meeting_data = {
            "meeting_id":meeting_id,
            "description":meeting_description,
            }
            with open(meeting_file_location, 'w') as file:
                json.dump(meeting_data, file, indent=4)

            logger.info("Meeting details saved successfully")

            
            # Run the generatesummary_and_dbinsertion function in the background
            background_tasks.add_task(generatesummary_and_dbinsertion, meeting_id, meeting_description, optiontype)

            return {"message": "File uploaded successfully, Summary generation in progress",
                    "isSuccess":True}
    except Exception as e:
        logger.error(f"Error in file uploading: {e}")
        raise HTTPException(status_code=500, detail="Error uploading file")
    

@app.post("/chatbot")
async def chatbot_response(request: ChatbotRequest):
    try:
        response = query_response(request.meeting_id,request.usertext)
        logger.info(f"Response for the query: {response}")
        return {"response": response}
    except Exception as e:
        logger.error(f"Error in generating response for the query, Error: {e}")
        raise HTTPException(status_code=500, detail=f"Error generating chatbot response: {e}")
    


@app.post("/meeting")
async def available_meeting():
    try:
        meetings_info = []

        meetings_folder_path = os.path.join(
            os.path.dirname(os.path.abspath(__file__)),
            "meetings"
        )
        
        files = [file for file in os.listdir(meetings_folder_path) if file.endswith(".json")]
        files.sort(key=lambda f: os.path.getmtime(os.path.join(meetings_folder_path, f)), reverse=True)

        for file_name in files:
            file_path = os.path.join(meetings_folder_path, file_name)
            
            with open(file_path, 'r') as f:
                data = json.load(f)
                
                meeting_id = data['meeting_id']
                meeting_description = data['description']
                
                meetings_info.append({
                    "meeting_id": meeting_id,
                    "meeting_description": meeting_description
                })

        return JSONResponse(content={"meetings":meetings_info})
    except Exception as e:
        logger.error(f"Error in fetching existing meeting id filenames , Error: {e}")
        raise HTTPException(status_code=500, detail=f"Error fetching meeting id filenames: {e}")


@app.post("/summary")
async def fetch_summary(request: Summary):

    folder_path = os.path.join(
        os.path.dirname(os.path.abspath(__file__)),
        "summaries"
    )
    
    file_path = os.path.join(folder_path, f"{request.meeting_id}.json")
    
    if not os.path.exists(file_path):
        raise HTTPException(status_code=404, detail="Summary not found")

    with open(file_path, "r") as f:
        summary_data = json.load(f)
    return JSONResponse(content = summary_data)

    
    
