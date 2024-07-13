import copy
from datetime import datetime

import pytz
from models import ChatTable
from psycopg2 import IntegrityError
from sqlalchemy.orm import Session

from fastapi import HTTPException, status

# 獲取台灣時區
taiwan_tz = pytz.timezone('Asia/Taipei')

def create_chat_record(user_id: int, chat_token:str, db: Session):
    new_chat = ChatTable(
        chat_start_date = datetime.now(taiwan_tz),
        chat_content = {"messages":[]},
        chat_processing = True,
        chat_token = chat_token,
        user_id = user_id
    )
    try:
        db.add(new_chat)
        db.commit()
        db.refresh(new_chat)
    except IntegrityError:
        db.rollback()
        
def update_chat_messages(user_id: int, user_message: str, assistant_message: str, db: Session):
    chat = db.query(ChatTable).filter(ChatTable.user_id == user_id, ChatTable.chat_processing == True).first()
    if not chat:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="AI諮商對話不存在")
    chat_content = copy.deepcopy(chat.chat_content)
    chat_content["messages"].append({"role": "user", "message": user_message})
    chat_content["messages"].append({"role": "assistant", "message": assistant_message})
    chat.chat_content = chat_content
    db.commit()
    db.refresh(chat, attribute_names=["chat_content"])

def update_chat_summary(user_id: str, summary: str, db: Session):
    chat = db.query(ChatTable).filter(ChatTable.user_id == user_id, ChatTable.chat_processing == True).first()    
    if not chat:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="沒有進行中的對話")
    chat_summary = copy.deepcopy(chat.chat_summary)
    chat_summary["summary"] = summary
    chat.chat_summary = chat_summary
    db.commit()
    db.refresh(chat)
    
def update_chat_emotion_rate(user_id: str, emotion_rate: float, db: Session):
    chat = db.query(ChatTable).filter(ChatTable.user_id == user_id, ChatTable.chat_processing == True).first()    
    if not chat:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="沒有進行中的對話")
    chat.chat_emotion_rate = emotion_rate
    db.commit()
    db.refresh(chat)

def update_chat_record_processing(user_id: str, processing: bool ,db: Session):
    chat = db.query(ChatTable).filter(ChatTable.user_id == user_id, ChatTable.chat_processing == True).first()    
    if not chat:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="沒有進行中的對話")
    chat.chat_end_date = datetime.now(taiwan_tz)
    chat.chat_processing = processing
    db.commit()
    db.refresh(chat)
    
def get_chat_by_chat_token(chat_token: str, db: Session):
    chat = db.query(ChatTable).filter(ChatTable.chat_token == chat_token).first() 
    if not chat:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="AI諮商紀錄不存在")
    return chat

def get_active_chat_by_user_id(user_id: int, db: Session):
    chat = db.query(ChatTable).filter(ChatTable.user_id == user_id, ChatTable.chat_processing == True).first()
    if not chat:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="沒有進行中的對話")
    return chat

def check_active_chat(user_id: int, db: Session):
    # 查找是否存在 connection_status 為 0 或 2 的連接
    chat = db.query(ChatTable).filter(
        ChatTable.user_id == user_id,
        ChatTable.chat_processing == True
    ).first()
    
    if chat:
        return True
    else:
        return False