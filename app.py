"""
Simple app to upload an image via a web form 
and view the inference results on the image in the browser.
"""
import argparse
import io
from itertools import count
import os
from unicodedata import name
from PIL import Image, ImageDraw, ImageFont
import cv2
import flask
import numpy as np
import time
import pandas
import pymysql

import torch

from flask import Flask, render_template, request, redirect, Response




app = Flask(__name__)



#'''
# Load Pre-trained Model
# model = torch.hub.load(
#         "ultralytics/yolov5", "yolov5s", pretrained=True, force_reload=True
#         )#.autoshape()  # force_reload = recache latest code
#'''
# Load Custom Model
# model = torch.hub.load("ultralytics/yolov5", "custom", path = "./yolov5s.pt", force_reload=True)
model = torch.hub.load("ultralytics/yolov5", "custom", path = "./best.pt", force_reload=True)

# Set Model Settings
model.eval()
model.conf = 0.6  # confidence threshold (0-1)
model.iou = 0.45  # NMS IoU threshold (0-1) 

from io import BytesIO

def cv2ImgAddText(img, text, left, top, textColor=(0, 255, 0), textSize=20):
    if (isinstance(img, np.ndarray)):  #判斷是否OpenCV圖片型別
        img = Image.fromarray(cv2.cvtColor(img, cv2.COLOR_BGR2RGB))
    draw = ImageDraw.Draw(img)
    fontText = ImageFont.truetype(
        "msjhbd.ttc", textSize, encoding="utf-8")
    draw.text((left, top), text, textColor, font=fontText)
    return cv2.cvtColor(np.asarray(img), cv2.COLOR_RGB2BGR)

def gen():
    cap=cv2.VideoCapture(0)
    # Read until video is completed
    while(cap.isOpened()):
        
        # Capture frame-by-fram ## read the camera frame
        success, frame = cap.read()
        if success == True:

            ret,buffer=cv2.imencode('.jpg',frame)
            
            frame=buffer.tobytes()
            
            #print(type(frame))

            img = Image.open(io.BytesIO(frame))
            results = model(img, size=640)
            

            # print(results)            
            # print(results.pandas().xyxy[0])
            df=results.pandas().xyxy[0]
            # print(df.name)
            # print(type(df.name))
            # print(type(names))    
                    
            #convert remove single-dimensional entries from the shape of an array
            img = np.squeeze(results.render()) #RGB
            # read image as BGR
            img_BGR = cv2.cvtColor(img, cv2.COLOR_RGB2BGR) #BGR        

            for names in df.name:
                
                if(df.name.count()>0):
                # print(df.name.count())
              
                    connection = pymysql.connect(host='localhost',
                             user='user',
                             password='password',
                             database='ai_retail',
                             charset='utf8mb4',
                             cursorclass=pymysql.cursors.DictCursor)

                    with connection:
                        with connection.cursor() as cursor:
        # Read a single record            
                
                            sql = "SELECT `product_name`, `price` FROM `products1` WHERE `product_id`=%s" 
                            cursor.execute(sql % names)
                            result = cursor.fetchone()
                            # time.sleep(1)
                            print(result)

                img_BGR=cv2ImgAddText(img_BGR, f'{result}', 10, 10, (255, 0, 0), 20)

        else:
            break

        frame = cv2.imencode('.jpg', img_BGR)[1].tobytes()

        
        yield(b'--frame\r\n'b'Content-Type: image/jpeg\r\n\r\n' + frame + b'\r\n')
     



@app.route('/')
def index():
    
    return render_template('index.html')

@app.route('/video')
def video():
    """Video streaming route. Put this in the src attribute of an img tag."""

    return Response(gen(),mimetype='multipart/x-mixed-replace; boundary=frame')
 
if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Flask app exposing yolov5 models")
    parser.add_argument("--port", default=5000, type=int, help="port number")
    args = parser.parse_args()

    app.run(host="0.0.0.0", port=args.port)  # debug=True causes Restarting with stat


