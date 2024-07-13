from pydantic import BaseModel


class CreateConnectionRequest(BaseModel):
    token: str
    therapist_id: int
    
class CreateConnectionResponse(BaseModel):
    status: bool
    detail: str

class TherapistUpdateConnectionRequest(BaseModel):
    login_token: str
    user_id: int
    connection_status: int
    
class TherapistUpdateConnectionResponse(BaseModel):
    status: bool
    detail: str
    
class TherapistDisconnectRequest(BaseModel):
    login_token: str
    user_id: int
    
class TherapistDisconnectResponse(BaseModel):
    status: bool
    detail: str
    
class AdminDisconnetionRequest(BaseModel):
    login_token: str
    therapist_id: int
    user_id: int
    
class AdminDisconnetionResponse(BaseModel):
    status: bool
    detail: str