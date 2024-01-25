from faker import Faker
import random
import time
import csv
import os
import json
import threading

fake = Faker()
lock = threading.Lock()

# Add headers on the first loop iteration
first_iteration = True

while True:
    num_panels = 5
    num_tanks = 8

    data = {
        "id_city": fake.city(),
        "id_boat": fake.word(),
        "timestamp": fake.date_time_this_year().strftime("%m-%d-%Y %H:%M:%S"),
        "panels": {}
    }

    for panel_num in range(1, num_panels + 1):
        panel_name = f"panel_{panel_num}"
        data["panels"][panel_name] = {}
        
        for tank_num in range(1, num_tanks + 1):
            tank_name = f"tank_{tank_num}"
            data["panels"][panel_name][tank_name] = {
                "id_rfid": fake.uuid4(),
                "isActive": random.choice([True, False]),
                "isInPlace": random.choice([True, False]),
                "isInWater": random.choice([True, False])
            }

    json_file = "boat_logs.json"

    if not os.path.isfile(json_file) or os.stat(json_file).st_size == 0:
        with open(json_file, 'w') as jsonfile:
            json.dump([], jsonfile)

    with lock:
        with open(json_file, 'r+') as jsonfile:
            data_list = json.load(jsonfile)
            data_list.append(data)
            jsonfile.seek(0)
            json.dump(data_list, jsonfile, indent=4)
        

    print("Dodano nowe dane")

    time.sleep(10)


