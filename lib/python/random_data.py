from faker import Faker
import random
import time
import csv
import os
import json

fake = Faker()

# Add headers on the first loop iteration
first_iteration = True

while True:
    data = {
        "id_city": fake.city(),
        "id_boat": fake.word(),
        "timestamp": fake.date_time_this_year().strftime("%m-%d-%Y %H:%M:%S"),
        "panels": {
            "panel_1": {
                "tank_1": {  
                    "id_rfid": fake.uuid4(),
                    "isActive": random.choice([True, False]),
                    "isInPlace": random.choice([True, False]),
                    "isInWater": random.choice([True, False])
                },
                "tank_2": {  
                    "id_rfid": fake.uuid4(),
                    "isActive": random.choice([True, False]),
                    "isInPlace": random.choice([True, False]),
                    "isInWater": random.choice([True, False])
                },
                "tank_3": {  
                    "id_rfid": fake.uuid4(),
                    "isActive": random.choice([True, False]),
                    "isInPlace": random.choice([True, False]),
                    "isInWater": random.choice([True, False])
                },
            },
            "panel_2": {
                "tank_2": {  
                    "id_rfid": fake.uuid4(),
                    "isActive": random.choice([True, False]),
                    "isInPlace": random.choice([True, False]),
                    "isInWater": random.choice([True, False])
                },
                "tank_3": {  
                    "id_rfid": fake.uuid4(),
                    "isActive": random.choice([True, False]),
                    "isInPlace": random.choice([True, False]),
                    "isInWater": random.choice([True, False])
                },
                "tank_4": {  
                    "id_rfid": fake.uuid4(),
                    "isActive": random.choice([True, False]),
                    "isInPlace": random.choice([True, False]),
                    "isInWater": random.choice([True, False])
                },
            }
        }
    }

    json_file = "newData.json"

    if not os.path.isfile(json_file) or os.stat(json_file).st_size == 0:
        with open(json_file, 'w') as jsonfile:
            json.dump([], jsonfile)

    with open(json_file, 'r+') as jsonfile:
        data_list = json.load(jsonfile)
        data_list.append(data)
        jsonfile.seek(0)
        json.dump(data_list, jsonfile, indent=4)
        

    time.sleep(10)


