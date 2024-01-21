from fastapi import FastAPI
from firebase_admin import credentials, firestore, initialize_app

app = FastAPI()

# Inicjalizacja aplikacji Firebase
cred = credentials.Certificate("firebase_admin_sdk.json")
initialize_app(cred)
db = firestore.client()

@app.get("/getData")
def get_data():
    # Pobranie wszystkich dokumentów z kolekcji "boats_logs"
    collection_ref = db.collection("boats_logs")
    docs = collection_ref.get()

    # Przetworzenie dokumentów na listę słowników
    data = [doc.to_dict() for doc in docs]

    return data
