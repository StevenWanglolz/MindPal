import os
from contextlib import asynccontextmanager

import database
import models
import redis
from dotenv import load_dotenv
from fastapi.responses import FileResponse
from langchain_openai import ChatOpenAI
from schemas import (admin_schemas, chat_schemas, connection_schemas,
                     diary_schemas, therapist_schemas, user_schemas)
from services import (admin_services, chat_services, connection_services,
                      diary_services, therapist_services, user_services)
from sqlalchemy.orm import Session

from fastapi import Depends, FastAPI, HTTPException

# Loading environment variables
load_dotenv()

# Auto detect database model structure
models.Base.metadata.create_all(bind=database.engine)

# Declare global variable
admin_login_redis = None
user_login_redis = None
therapist_login_redis = None
user_forget_password_redis = None
user_reset_password_redis = None
therapist_forget_password_redis = None
therapist_reset_password_redis = None
chat_model = None

@asynccontextmanager
async def lifespan(app: FastAPI):
    global admin_login_redis, user_login_redis, therapist_login_redis, user_forget_password_redis, user_reset_password_redis, therapist_forget_password_redis, therapist_reset_password_redis, chat_model

    # Declare Redis Database
    admin_login_redis = redis.StrictRedis(host=os.getenv('REDIS_HOST'), port=int(os.getenv('REDIS_PORT')), db=0)
    user_login_redis = redis.StrictRedis(host=os.getenv('REDIS_HOST'), port=int(os.getenv('REDIS_PORT')), db=1)
    therapist_login_redis = redis.StrictRedis(host=os.getenv('REDIS_HOST'), port=int(os.getenv('REDIS_PORT')), db=2)
    user_forget_password_redis = redis.StrictRedis(host=os.getenv('REDIS_HOST'), port=int(os.getenv('REDIS_PORT')), db=3)
    user_reset_password_redis = redis.StrictRedis(host=os.getenv('REDIS_HOST'), port=int(os.getenv('REDIS_PORT')), db=4)
    therapist_forget_password_redis = redis.StrictRedis(host=os.getenv('REDIS_HOST'), port=int(os.getenv('REDIS_PORT')), db=5)
    therapist_reset_password_redis = redis.StrictRedis(host=os.getenv('REDIS_HOST'), port=int(os.getenv('REDIS_PORT')), db=6)
    
    chat_model = ChatOpenAI(model="gpt-3.5-turbo", api_key=os.getenv('OPENAI_API_KEY'))
    yield
    # Close all connection by Redis when application shut down
    user_login_redis.quit()
    therapist_login_redis.quit()
    user_forget_password_redis.quit()
    user_reset_password_redis.quit()
    therapist_forget_password_redis.quit()
    therapist_reset_password_redis.quit()
    
app = FastAPI(lifespan=lifespan)

# Test URL
@app.get("/test/")
def test():
    return {"content": "test"}

# ------ User Start ------

@app.post("/user")
def create_user(request: user_schemas.CreateUserRequest, db: Session = Depends(database.get_db)):
    response = user_services.create_user(request, db)
    return response

@app.get("/users/{login_token}")
def read_users(login_token: str, db: Session = Depends(database.get_db)):
    response = user_services.read_users(login_token, db, admin_login_redis)
    return response

@app.get("/user/{login_token}")
def get_user_info(login_token: str, db: Session = Depends(database.get_db)):
    response = user_services.user_get_info(login_token, db, user_login_redis)
    return response

@app.put("/user")
def update_user(request: user_schemas.UpdateUserRequest, db: Session = Depends(database.get_db)):
    response = user_services.update_user(request, db, user_login_redis)
    return response

@app.delete("/user/{user_id}/{login_token}")
def delete_user(user_id: int, login_token: str, db: Session = Depends(database.get_db)):
    response = user_services.delete_user(user_id, login_token, db, admin_login_redis)
    return response

@app.get("/user/salt/{user_email}")
def user_get_salt(user_email: str, db: Session = Depends(database.get_db)):
    response = user_services.user_get_salt(user_email, db)
    return response

@app.post("/user/login")
def user_login(request: user_schemas.UserLoginRequest, db: Session = Depends(database.get_db)):
    response = user_services.user_login(request, db, user_login_redis)
    return response

@app.post("/user/forget")
def user_forget_password(request: user_schemas.UserForgetPasswordRequest, db: Session = Depends(database.get_db)):
    response = user_services.user_forget_send_verification_code(request, db, user_forget_password_redis)
    return response

@app.post("/user/forget/resend")
def user_resend_verification_code(request: user_schemas.UserResendVerificationCodeRequest, db: Session = Depends(database.get_db)):
    response = user_services.user_forget_resend_verification_code(request, user_forget_password_redis)
    return response

@app.post("/user/forget/verify")
def user_verify_code(request: user_schemas.UserVerifyCodeRequest, db: Session = Depends(database.get_db)):
    response = user_services.user_forget_verify_code(request, user_forget_password_redis, user_reset_password_redis)
    return response

@app.put("/user/forget/reset")
def user_reset_password(request: user_schemas.UserResetPasswordRequest, db: Session = Depends(database.get_db)):
    response = user_services.user_forget_reset_password(request, db, user_reset_password_redis)
    return response

@app.get("/user/verify/{user_email}")
def user_send_verification_code(user_email: str, db: Session = Depends(database.get_db)):
    response = user_services.user_send_verification_code(user_email, db, user_forget_password_redis)
    return response

@app.put("/user/verify")
def user_verify(request: user_schemas.UserVerifyRequest, db: Session = Depends(database.get_db)):
    response = user_services.user_verify_code(request, db, user_forget_password_redis)
    return response

# ------ User End ------

# ------ Mood Diary Start ------

@app.post("/diary")
def create_diary(request: diary_schemas.CreateDiaryRequest, db: Session = Depends(database.get_db)):
    response = diary_services.create_diary(request, db, chat_model, user_login_redis)
    return response

@app.get("/diaries/{login_token}")
def read_diaries(login_token: str, db: Session = Depends(database.get_db)):
    response = diary_services.read_diaries(login_token, db, user_login_redis)
    return response

@app.put("/diary")
def update_diary(request: diary_schemas.UpdateDiaryRequest, db: Session = Depends(database.get_db)):
    response = diary_services.update_diary(request, db, chat_model, user_login_redis)
    return response

@app.delete("/diary/{diary_id}/{login_token}")
def delete_diary(diary_id: int, login_token:str, db: Session = Depends(database.get_db)):
    response = diary_services.delete_diary(diary_id, login_token, db, user_login_redis)
    return response

# ------ Mood Diary End ------

# ------ User & Therapist Connection Start ------

@app.post("/connection")
def create_connection(request: connection_schemas.CreateConnectionRequest, db: Session = Depends(database.get_db)):
    response = connection_services.create_connection(request, db, user_login_redis)
    return response

@app.get("/therapist/connections/{login_token}")
def therapist_read_connections(login_token: str, db: Session = Depends(database.get_db)):
    response = connection_services.therapist_read_connections(login_token, db, therapist_login_redis)
    return response

@app.get("/user/connection/{login_token}")
def user_read_connection(login_token: str, db: Session = Depends(database.get_db)):
    response = connection_services.user_read_connection(login_token, db, user_login_redis)
    return response

@app.put("/therapist/connection")
def update_connection(request: connection_schemas.TherapistUpdateConnectionRequest, db: Session = Depends(database.get_db)):
    response = connection_services.therapist_update_connection(request, db, therapist_login_redis)
    return response

@app.put("/therapist/connection/disconnect")
def therapist_disconnect_connection(request: connection_schemas.TherapistDisconnectRequest, db: Session = Depends(database.get_db)):
    response = connection_services.therapist_disconnect_connection(request, db, therapist_login_redis)
    return response

@app.put("/admin/connection/disconnect")
def user_disconnect_connection(request: connection_schemas.AdminDisconnetionRequest, db: Session = Depends(database.get_db)):
    response = connection_services.user_disconnect_connection(request, db, admin_login_redis)
    return response

# ------ User & Therapist Connection End ------

# ------ Therapist Start ------

@app.post("/therapist")
def create_therapist(request: therapist_schemas.CreateTherapistRequest, db: Session = Depends(database.get_db)):
    response = therapist_services.create_therapist(request, db)
    return response

@app.get("/admin/therapists/{login_token}")
def admin_read_therapists(login_token: str, db: Session = Depends(database.get_db)):
    response = therapist_services.admin_read_therapists(login_token, db, admin_login_redis)
    return response

@app.get("/user/therapists/{login_token}")
def user_read_therapists(login_token: str, db: Session = Depends(database.get_db)):
    response = therapist_services.user_read_therapists(login_token, db, user_login_redis)
    return response

@app.put("/therapist")
def update_therapist(request: therapist_schemas.UpdateTherapistResponse, db: Session = Depends(database.get_db)):
    response = therapist_services.update_therapist(request, db, therapist_login_redis)
    return response

@app.delete("/therapist/{therapist_id}/{login_token}")
def delete_therapist(therapist_id: int, login_token: str, db: Session = Depends(database.get_db)):
    response = therapist_services.delete_therapist(therapist_id, login_token, db, admin_login_redis)
    return response

@app.get("/therapist/salt/{therapist_email}")
def therapist_get_salt(therapist_email: str, db: Session = Depends(database.get_db)):
    response = therapist_services.therapist_get_salt(therapist_email, db)
    return response

@app.post("/therapist/login")
def therapist_login(request: therapist_schemas.TherapistLoginRequest, db: Session = Depends(database.get_db)):
    response = therapist_services.therapist_login(request, db, therapist_login_redis)
    return response

@app.post("/therapist/forget")
def therapist_forget_password(request: therapist_schemas.TherapistForgetPasswordRequest, db: Session = Depends(database.get_db)):
    response = therapist_services.therapist_forget_password(request, db, therapist_forget_password_redis)
    return response

@app.post("/therapist/forget/resend")
def therapist_resend_verification_code(request: therapist_schemas.TherapistResendVerificationCodeRequest, db: Session = Depends(database.get_db)):
    response = therapist_services.therapist_resend_verification_code(request, therapist_forget_password_redis)
    return response

@app.post("/therapist/forget/verify")
def therapist_verify_code(request: therapist_schemas.TherapistVerifyCodeRequest, db: Session = Depends(database.get_db)):
    response = therapist_services.therapist_verify_code(request, therapist_forget_password_redis, therapist_reset_password_redis)
    return response

@app.put("/therapist/forget/reset")
def therapist_reset_password(request: therapist_schemas.TherapistResetPasswordRequest, db: Session = Depends(database.get_db)):
    response = therapist_services.therapist_reset_password(request, db, therapist_reset_password_redis)
    return response

@app.get("/therapist/verify/{therapist_email}")
def therapist_send_verification_code(therapist_email: str, db: Session = Depends(database.get_db)):
    response = therapist_services.therapist_send_verification_code(therapist_email, db, therapist_forget_password_redis)
    return response

@app.put("/therapist/verify")
def therapist_verify(request: therapist_schemas.TherapistVerifyRequest, db: Session = Depends(database.get_db)):
    response = therapist_services.therapist_verify_code(request, db, therapist_forget_password_redis)
    return response

@app.put("/admin/therapist/cert")
def admin_update_therapist_cert_verified(request: therapist_schemas.AdminUpdateTherapistCertVerifiedRequest, db: Session = Depends(database.get_db)):
    response = therapist_services.admin_update_therapist_cert_verified(request, db, admin_login_redis)
    return response

@app.post("/therapist/cert")
def upload_therapist_cert(request: therapist_schemas.TherapistUploadCertPhotoRequest, db: Session = Depends(database.get_db)):
    response = therapist_services.upload_therapist_cert(request, db, therapist_login_redis)
    return response

@app.get("/media/{filename}")
async def get_image(filename: str):
    file_path = os.path.join("/app/media", filename)
    if not os.path.exists(file_path):
        raise HTTPException(status_code=404, detail="File not found")
    return FileResponse(file_path)


# ------ Therapist End ------

# ------ Chat Start ------

@app.put("/chat")
def chat(request: chat_schemas.ChatRequest, db: Session = Depends(database.get_db)):
    response = chat_services.get_chat_response(request, db, chat_model, user_login_redis)
    return response

@app.post("/chat/new")
def new_chat(request: chat_schemas.NewChatRequest, db: Session = Depends(database.get_db)):
    response = chat_services.add_new_chat(request, db, user_login_redis)
    return response

@app.put("/chat/end")
def end_chat(request: chat_schemas.EndChatRequest, db: Session = Depends(database.get_db)):
    response = chat_services.end_chat(request, db, chat_model, user_login_redis)
    return response

@app.get("/user/chats/{login_token}")
def user_read_chats(login_token: str, db: Session = Depends(database.get_db)):
    response = chat_services.user_read_chats(login_token, db, user_login_redis)
    return response

@app.get("/user/chat/{chat_token}/{login_token}")
def user_read_chat_detail(chat_token: str, login_token: str, db: Session = Depends(database.get_db)):
    response = chat_services.user_read_chat_detail(chat_token, login_token, db, user_login_redis)
    return response
# ------ Chat End ------

# ------ Admin Start ------

@app.post("/admin")
def create_admin(request: admin_schemas.CreateAdminRequest, db: Session = Depends(database.get_db)):
    response = admin_services.create_admin(request, db)
    return response

@app.get("/admins")
def read_admins():
    pass

@app.put("/admin")
def update_admin(request: admin_schemas.UpdateAdminRequest, db: Session = Depends(database.get_db)):
    response = admin_services.admin_update_info(request, db, admin_login_redis)
    return response

@app.delete("/admin")
def delete_admin():
    pass

@app.get("/admin/salt/{admin_email}")
def admin_get_salt(admin_email: str, db: Session = Depends(database.get_db)):
    response = admin_services.admin_get_salt(admin_email, db)
    return response

@app.post("/admin/login")
def admin_login(request: admin_schemas.AdminLoginRequest, db: Session = Depends(database.get_db)):
    response = admin_services.admin_login(request, db, admin_login_redis)
    return response

# ------ Admin End ------