from flask import Flask
import boto3
from datetime import datetime

app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello, World!'

@app.route('/company')
def get_company():
    return { 'company': 'Experient Group' }

@app.route('/timestamp')
def get_timestamp():
    # get current time as string
    datetime_string = datetime.now().strftime("%d-%m-%Y %H:%M")
    encoded_string = datetime_string.encode("utf-8")

    bucket_name = "youngvz-python-code"
    file_name = f'{datetime_string}.txt'
    s3_path = "timestamp-lambda/output/" + file_name
    
    s3 = boto3.resource("s3")
    s3.Bucket(bucket_name).put_object(Key=s3_path, Body=encoded_string)
    
    return {'s3_path': s3_path }