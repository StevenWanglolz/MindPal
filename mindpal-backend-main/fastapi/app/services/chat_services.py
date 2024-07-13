import json
import secrets

import pytz
from langchain_openai import ChatOpenAI
from mindpal_llm import ai_consult
from redis import StrictRedis
from schemas import chat_schemas
from services import chat_helpers, user_helpers
from sqlalchemy.exc import IntegrityError
from sqlalchemy.orm import Session

from fastapi import HTTPException, status

# 獲取台灣時區
taiwan_tz = pytz.timezone('Asia/Taipei')

def add_new_chat(request: chat_schemas.NewChatRequest, db: Session, user_login_redis: StrictRedis):
    login_user = user_login_redis.get(request.login_token)
    if not login_user:
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="請重新登入")
    json_login_user = json.loads(login_user)
    if chat_helpers.check_active_chat(user_id=json_login_user["id"], db=db):
        raise HTTPException(status_code=status.HTTP_409_CONFLICT, detail="會員存在進行中的AI諮商")
    chat_token = secrets.token_hex(16) 
    chat_helpers.create_chat_record(user_id=json_login_user["id"], chat_token=chat_token, db=db)
    try:
        return chat_schemas.NewChatResponse(status=True, chat_token=chat_token, detail="會員建立AI諮商紀錄成功")
    except IntegrityError:
        raise HTTPException(status_code=status.HTTP_409_CONFLICT, detail="會員存在進行中的AI諮商")

def end_chat(request: chat_schemas.EndChatRequest, db: Session, chat_model: ChatOpenAI, user_login_redis: StrictRedis):
    login_user = user_login_redis.get(request.login_token)
    if not login_user:
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="請重新登入")
    json_login_user = json.loads(login_user)
    chat = chat_helpers.get_active_chat_by_user_id(user_id=json_login_user["id"], db=db)
    summary = ai_consult.generate_chat_summary(messages=chat.chat_content["messages"], chat_model=chat_model)
    chat_emotion_rate = ai_consult.generate_chat_emotion_rate(summary=summary, chat_model=chat_model)
    user_helpers.update_user_emotion_rate(user_id=json_login_user["id"], emotion_rate=chat_emotion_rate, db=db)
    chat_helpers.update_chat_emotion_rate(user_id=json_login_user["id"], emotion_rate=chat_emotion_rate, db=db)
    chat_helpers.update_chat_summary(user_id=json_login_user["id"], summary=summary, db=db)
    chat_helpers.update_chat_record_processing(user_id=json_login_user["id"], processing=False, db=db)
    
    return chat_schemas.EndChatResponse(status=True, detail="會員結束AI諮商成功")
    
def get_chat_response(request: chat_schemas.ChatRequest, db: Session, chat_model: ChatOpenAI, user_login_redis: StrictRedis):
    login_user = user_login_redis.get(request.login_token)
    if not login_user:
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="請重新登入")
    json_login_user = json.loads(login_user)
    assistant_message = ai_consult.chat_with_llm(user_message=request.message, chat_model=chat_model)
    
    chat_helpers.update_chat_messages(user_id=json_login_user["id"], user_message=request.message, assistant_message=assistant_message, db=db)
    
    return chat_schemas.ChatResponse(status=True, assistant_message=assistant_message, detail="對話成功")

def user_read_chats(login_token: str, db: Session, user_login_redis: StrictRedis):
    login_user = user_login_redis.get(login_token)
    if not login_user:
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="請重新登入")
    json_login_user = json.loads(login_user)
    user = user_helpers.get_user_by_email(email=json_login_user["email"], db=db)
    return user.chat
    
def user_read_chat_detail(chat_token: str, login_token: str, db: Session, user_login_redis: StrictRedis):
    login_user = user_login_redis.get(login_token)
    if not login_user:
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="請重新登入")    
    chat = chat_helpers.get_chat_by_token(chat_token=chat_token, db=db)
    return chat
    