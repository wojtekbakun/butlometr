import csv
from fastapi import FastAPI
from fastapi.responses import JSONResponse
import os
import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore
import json
import threading
import subprocess

app = FastAPI()
lock = threading.Lock()

cred = credentials.Certificate("firebase_admin_sdk.json")
firebase_admin.initialize_app(cred)
db = firestore.client()

file_name = "boat_logs.json"

@app.on_event("startup")
def read_data_from_sensors():
    threading.Thread(target=run_reading_data).start()

def run_reading_data():
    subprocess.run(["python", "randomData.py"])

@app.get("/getLocalData")
def read_root():
    with lock, open(file_name, "r") as file:
        data = json.load(file)
        latest_data = data[-1] 
        return JSONResponse(content=latest_data)

@app.get("/sendDataToFirebase")
def send_data_to_firebase():
    current_dir = os.getcwd()
    file_path = os.path.join(current_dir, file_name)
    with lock, open(file_path) as file:
        data = json.load(file)
        for json_data in data:
            doc_ref = db.collection("boats_logs").document()
            doc_ref.set(json_data)
        return {"message": "Przesłano dane do chmury i wyczyszczono lokalne dane"}

@app.get("/getDataFromFirebase")
def get_data():
    with lock:
        # Pobranie wszystkich dokumentów z kolekcji "boats_logs"
        collection_ref = db.collection("boats_logs")
        docs = collection_ref.get()
        # Przetworzenie dokumentów na listę słowników
        data = [doc.to_dict() for doc in docs]
        return data

@app.get("/deleteLocalData")
def delete_local_data():
    if os.path.exists(file_name):
        with lock:
            os.truncate(file_name, 0)
        return {"message": "Usunięto lokalne dane"}
    else:
        return {"message": "Wystąpił błąd podczas usuwania lokalnych danych."}
