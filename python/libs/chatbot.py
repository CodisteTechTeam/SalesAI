from openai import OpenAI
import os
from dotenv import load_dotenv
from libs.chromadb import embedding_query

load_dotenv()
os.environ['OPENAI_API_KEY'] = os.getenv("OPEN_API_KEY")


def openai_output(system_text, user_text):
    # Modify the system text with detailed instructions
    client = OpenAI()
    modify_systemtext = f"""
    Provided Content: {system_text}
    
    You are Information Provider AI chatbot.
    Immerse yourself fully in the following task. Analyze the user's question and choose the best response type from the following options:

    1. Straightforward Answer: Provide factual information concisely and clearly. 
    
    2. Descriptive Answer: Offer a detailed and elaborative response. Use paragraphs and visual elements (like bullet points or numbered lists) to enhance readability and engagement.
    
    3. Advice: Provide actionable advice or recommendations. Structure the response in a clear, visually appealing manner with appropriate formatting to guide the user effectively.
    
    4. No Relevant Answer: If the user's question doesn't relate to the provided content, state: 'I couldn't find a direct answer in the provided information. Can you rephrase the question or ask about another topic?'

    When crafting your response, adhere strictly to the following formatting rules:
    
    - Visual Engagement: Use bullet points, numbered lists, tables, or other visual formats to make the information clear and easy to digest.
    - Accuracy: Ensure that all information, including numbers, is accurate and drawn from the provided content. Do not invent or assume information.
    - Tone: Match the emotional tone of the user's question to ensure your response feels personal and relevant.

    5. Please provide the key points from the following response, excluding any introductory phrases such as 'Based on the information provided,' 'According to the details,' or similar phrases. Focus on delivering the core information directly.

    6. Make the output clear and concise , not exceeding output from 200 words.

    7. You can answer yourself for simple greetings, always end output with followup questions.
    
    Your task is to deliver given provided content in the most engaging, clear, and user-focused manner possible.
    """

    # Initialize the OpenAI client and create a chat completion
    completion = client.chat.completions.create(
    model="gpt-4o-mini",
    messages=[
        {"role": "system", "content":modify_systemtext},
        {
            "role": "user",
            "content": user_text
        }
        ]
    )
    return completion.choices[0].message.content


def query_response(meeting_id,usertext):
    system_text = embedding_query(meeting_id, usertext)
    final_response = openai_output(system_text,usertext)
    json_response = {
    "query": usertext,
    "answer": final_response,
    "image_url": ""
    }
    return json_response