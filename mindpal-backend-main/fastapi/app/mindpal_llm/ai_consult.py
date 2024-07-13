import random

from langchain_openai import ChatOpenAI


def chat_with_llm(user_message: str, chat_model: ChatOpenAI):
    response = chat_model.invoke(user_message)
    return response.content

def generate_chat_summary(messages: str, chat_model: ChatOpenAI):
    return "測試總結"

def generate_chat_emotion_rate(summary: str, chat_model: ChatOpenAI):
    #random number from -0.1 to 0.1
    emotion_rate = random.uniform(-0.1, 0.1)
    print("測試情緒分數: ", emotion_rate)
    return emotion_rate

def generate_chat_diary_rate(diary_content: str, chat_model: ChatOpenAI):
    #random number from -0.1 to 0.1
    emotion_rate = random.uniform(-0.1, 0.1)
    print("測試情緒分數: ", emotion_rate)
    return emotion_rate
    