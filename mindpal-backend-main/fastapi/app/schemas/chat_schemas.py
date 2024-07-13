from pydantic import BaseModel


class ChatRequest(BaseModel):
    login_token: str
    message: str

class ChatResponse(BaseModel):
    status: bool
    assistant_message: str
    detail: str
    
class NewChatRequest(BaseModel):
    login_token: str
    
class NewChatResponse(BaseModel):
    status: bool
    chat_token: str
    detail: str
    
class EndChatRequest(BaseModel):
    login_token: str
    
class EndChatResponse(BaseModel):
    status: bool
    detail: str