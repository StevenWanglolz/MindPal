from pydantic import BaseModel


class CreateDiaryRequest(BaseModel):
    token: str
    diary_mood: int
    diary_event: list
    diary_content: str
    
class CreateDiaryResponse(BaseModel):
    status: bool
    detail: str

class UpdateDiaryRequest(BaseModel):
    token: str
    diary_id: int
    diary_mood: int
    diary_events: list
    diary_content: str

class UpdateDiaryResponse(BaseModel):
    status: bool
    detail: str
    
class DeleteDiaryResponse(BaseModel):
    status: bool
    detail: str