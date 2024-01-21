import os
import json
import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore

# Inicjalizacja aplikacji Firebase
cred = credentials.Certificate("firebase_admin_sdk.json")
firebase_admin.initialize_app(cred)

# Utworzenie instancji klienta Firestore
db = firestore.client()

# Pobranie ścieżki do pliku newData.json
current_dir = os.getcwd()
file_path = os.path.join(current_dir, "newData.json")

# Otwarcie pliku i przesłanie każdego JSON-a jako osobny dokument do Firestore
with open(file_path) as file:
    data = json.load(file)
    for json_data in data:
        # Przesłanie JSON-a jako dokumentu do Firestore
        doc_ref = db.collection("nazwa_kolekcji").document()
        doc_ref.set(json_data)

print("Przesłano dane do Firestore.")
