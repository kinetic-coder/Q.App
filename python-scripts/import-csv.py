import csv
import entities.KitItem as KI
import mysql.connector

def read_csv_to_kit_items(filename):
    kit_items = []
    with open(filename, mode='r', newline='') as csvfile:
        reader = csv.DictReader(csvfile)
        for row in reader:
            print (f"Item: {row['Item']}, Quantity: {row['Quantity']}")
            
            tenant_id = 1
            item = row["Item"]
            quantity = row["Quantity"]
            quantity_unit = row["Quantity unit"]
            condition = row["Condition"]
            notes = row["Notes"]
            
            if(row["Est Ins Unit Value"] == ""):
                estimated_unit_insurance_value = 0
            else:
                estimated_unit_insurance_value = row["Est Ins Unit Value"].replace('£', '').replace(',','')
            
            if row["Purchase Date (approx)"] == "?":
                purchase_date = None
            else:    
                day, month, year = row["Purchase Date (approx)"].split('/')
                purchase_date = f"{year}-{month}-{day}"
            
            purchase_price = row["Purchase Price"].replace('£', '').replace(',', '')
            location = row["Current Location"]
            
            if row["Est Lifespan (years) for retained equip"]  == "":
                estimated_life_span = 0
            else:
                estimated_life_span = row["Est Lifespan (years) for retained equip"]
                
            if row["Est Replacement Date"] == "":
                estimated_replacement_date = "2030-01-01"
            else:
                estimated_replacement_date = row["Est Replacement Date"]
                day, month, year = estimated_replacement_date.split('/')
                estimated_replacement_date = f"{year}-{month}-{day}"
            
            category = row["Category"]
                        
            kit_item = KI.KitItem(tenant_id, item, category, quantity, quantity_unit, condition, notes, estimated_unit_insurance_value, purchase_date, purchase_price, location, estimated_life_span, estimated_replacement_date)
            kit_items.append(kit_item)
            
    return kit_items   

def insert_kit_items_to_db(kit_items, connection_string):
    cursor = None
    try:
        conn = mysql.connector.connect(
            host=connection_string['host'],
            user=connection_string['user'],
            password=connection_string['password'],
            port=connection_string['port'],
            database=connection_string['database'])
        
        cursor = conn.cursor()
        
        for kit_item in kit_items:
            cursor.callproc('sp_add_kit', (
                kit_item.tenant_id,
                kit_item.nickname,
                kit_item.name,
                kit_item.description,
                kit_item.purchase_date,
                kit_item.purchase_price,
                kit_item.estimated_list_span,
                kit_item.estimated_insurance_value,
                kit_item.estimated_replacement_date,
                kit_item.category,
                kit_item.condition,
                kit_item.notes,
                kit_item.kit_code
            ))
        
            conn.commit()
            
    except mysql.connector.Error as err:
        print(f"Error: {err}")
    except Exception as err:
        print(f"Error: {err}")
    finally:
        if cursor is not None:
            cursor.close()
            conn.close()
        else:
            print("No cursor to close")

import_filename = "/home/oliver/Downloads/EMSG Inventory 23-04-23 v7.csv"
kit_items = read_csv_to_kit_items(import_filename)

connection_string = {
    'user': 'root',
    'password': 'ChangeMeAtDeploymentTime',
    'host': 'localhost',
    'port': '3306',
    'database': 'QApp'
}

insert_kit_items_to_db(kit_items, connection_string)

