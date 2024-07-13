import json
import os
import random
import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
from smtplib import SMTP

from dotenv import load_dotenv
from redis import StrictRedis

load_dotenv()

# Send Email Function
# Type: Function
# 使用情境: 當需要發送郵件時
# 參數:
#   smtp_connection: SMTP, 用於發送郵件的SMTP連接
#   subject: str, 郵件的主題
#   body: str, 郵件的內容
#   to_email: str, 收件人的電子郵件地址
# 回傳: None
def send_email(subject: str, body: str, to_email: str): 
    smtp_connection = smtplib.SMTP(os.getenv('SMTP_SERVER'), int(os.getenv('SMTP_PORT')))
    smtp_connection.ehlo()
    smtp_connection.starttls()
    smtp_connection.login(os.getenv('SMTP_USER'), os.getenv('SMTP_PASSWORD'))    
    msg = MIMEMultipart()
    msg['From'] = 'MindPal <support@mindpal.life>'
    msg['To'] = to_email
    msg['Subject'] = subject
    
    # 使用UTF-8編碼的MIMEText
    msg.attach(MIMEText(body, 'plain', 'utf-8'))
    
    # 需要指定郵件的編碼方式
    msg_str = msg.as_string()

    status = smtp_connection.sendmail(os.getenv('SMTP_USER'), to_email, msg_str)  # 加密文件，避免私密信息被截取
    if status == {}:
        print("郵件傳送成功!")
    else:
        print("郵件傳送失敗!")
    smtp_connection.quit()
        
def generate_verification_code():
    code = ''.join([str(random.randint(0, 9)) for _ in range(6)])
    return code

def delete_login_redis_by_email(email: str, r: StrictRedis):
    cursor = '0'
    while cursor != 0:
        cursor, keys = r.scan(cursor=cursor, match='*', count=1000)
        for key in keys:
            try:
                value = r.get(key).decode('utf-8')
                if json.loads(value)["email"] == email:
                    r.delete(key)
                    print(f'Deleted key: {key}')
            except Exception as e:
                print(f'Error retrieving value for key {key}: {e}')