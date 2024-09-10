import assemblyai as aai
import os 
from dotenv import load_dotenv
from loguru import logger

load_dotenv()
aai.settings.api_key = os.getenv("ASSEMBLY_API_KEY")

def transcriptgenerator(meeting_id):
    extensions = ".wav"
    audio_url = os.path.join(".", "audios", f"{meeting_id}{extensions}")  
    if audio_url is None:
        raise FileNotFoundError(f"No audio file found for meeting ID {meeting_id} with .wav or .mp3 extension.")

    config = aai.TranscriptionConfig(
        speaker_labels=True,
    )
    transcript = aai.Transcriber().transcribe(audio_url, config)
    transcript_path = os.path.join(".", "transcripts", f"{meeting_id}.txt")
    with open(transcript_path, "w") as file:
        for utterance in transcript.utterances:
            file.write(f"Speaker {utterance.speaker}: {utterance.text}\n")
    
    return transcript_path
