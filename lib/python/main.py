import csv
from fastapi import FastAPI
from fastapi.responses import JSONResponse
import json
import os
import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore

app = FastAPI()
file_name = "boat_logs.json"

@app.get("/getLocalData")
def read_root():
    with open(file_name, "r") as file:
        data = json.load(file)
        latest_data = data[-1] 
        return JSONResponse(content=latest_data)

cred = credentials.Certificate("firebase_admin_sdk.json")
firebase_admin.initialize_app(cred)

db = firestore.client()

@app.get("/sendDataToFirebase")
def send_data_to_firebase():
    current_dir = os.getcwd()
    file_path = os.path.join(current_dir, file_name)
    with open(file_path) as file:
        data = json.load(file)
        for json_data in data:
            doc_ref = db.collection("boats_logs").document()
            doc_ref.set(json_data)
        return {"message": "Przesłano dane do chmury i wyczyszczono lokalne dane"}
        
@app.get("/deleteLocalData")
def delete_local_data():
    if os.path.exists(file_name):
        os.truncate(file_name, 0)
        return {"message": "Usunięto lokalne dane"}
    else:
        return {"message": "Wystąpił błąd podczas usuwania lokalnych danych."}

@app.get("/getDataFromFirebase")
def get_data():
    # Pobranie wszystkich dokumentów z kolekcji "boats_logs"
    collection_ref = db.collection("boats_logs")
    docs = collection_ref.get()
    # Przetworzenie dokumentów na listę słowników
    data = [doc.to_dict() for doc in docs]
    return data

