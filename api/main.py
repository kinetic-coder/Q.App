# Python
from flask import Flask, jsonify, request
import psycopg2

app = Flask(__name__)

@app.route('/api/items', methods=['POST'])
def create_item():
    conn = psycopg2.connect(
        host="localhost",
        database="Q",
        user="postgres",
        password="example"
    )
    cur = conn.cursor()
    
    # Get the data from the request
    data = request.get_json()
    description = data.get('description')
    quantity = data.get('quantity')
    notes = data.get('notes')

    if quantity is None or not quantity.isdigit():
        return jsonify({'message': 'Quantity must be a number'})

    sql = f"INSERT INTO Item (description, notes, quantity) VALUES ('{description}','{notes}', {quantity});"

    # Insert the new item into the database
    cur.execute(sql)
    
    # Commit the changes and close the connection
    conn.commit()
    cur.close()
    conn.close()
    
    return jsonify({'message': 'Item created successfully'})

@app.route('/api/items', methods=['GET'])
def get_items():
    conn = psycopg2.connect(
        host="localhost",
        database="Q",
        user="postgres",
        password="example"
    )
    cur = conn.cursor()
    cur.execute("SELECT * FROM Item;")
    locations = cur.fetchall()
    cur.close()
    conn.close()
    return jsonify(locations)

@app.route('/api/owners', methods=['GET'])
def get_owners():
    conn = psycopg2.connect(
        host="localhost",
        database="Q",
        user="postgres",
        password="example"
    )
    cur = conn.cursor()
    cur.execute("SELECT * FROM Owner;")
    locations = cur.fetchall()
    cur.close()
    conn.close()
    return jsonify(locations)

@app.route('/api/categories', methods=['GET'])
def get_categories():
    conn = psycopg2.connect(
        host="localhost",
        database="Q",
        user="postgres",
        password="example"
    )
    cur = conn.cursor()
    cur.execute("SELECT * FROM ItemCategory;")
    locations = cur.fetchall()
    cur.close()
    conn.close()
    return jsonify(locations)

@app.route('/api/conditions', methods=['GET'])
def get_conditions():
    conn = psycopg2.connect(
        host="localhost",
        database="Q",
        user="postgres",
        password="example"
    )
    cur = conn.cursor()
    cur.execute("SELECT * FROM Condition;")
    locations = cur.fetchall()
    cur.close()
    conn.close()
    return jsonify(locations)

@app.route('/api/locations', methods=['GET'])
def get_locations():
    conn = psycopg2.connect(
        host="localhost",
        database="Q",
        user="postgres",
        password="example"
    )
    cur = conn.cursor()
    cur.execute("SELECT * FROM Location;")
    locations = cur.fetchall()
    cur.close()
    conn.close()
    return jsonify(locations)

@app.route('/api/unittypes', methods=['GET'])
def get_unit_type():
    conn = psycopg2.connect(
        host="localhost",
        database="Q",
        user="postgres",
        password="example"
    )
    cur = conn.cursor()
    cur.execute("SELECT * FROM ItemQuantityType;")
    locations = cur.fetchall()
    cur.close()
    conn.close()
    return jsonify(locations)

if __name__ == '__main__':
    app.run(debug=True)