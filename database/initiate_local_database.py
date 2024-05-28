import psycopg2

# Connect to the PostgreSQL database
conn = psycopg2.connect(
    host="localhost",
    port=5432,
    user="postgres",
    password="example",
    database="postgres"
)

# Create a new database called "Q"
cur = conn.cursor()
conn.autocommit = True
cur.execute("DROP DATABASE IF EXISTS Q;")
cur.execute("CREATE DATABASE Q;")
cur.close()

conn = psycopg2.connect(
    host="localhost",
    port=5432,
    user="postgres",
    password="example",
    database="Q"
)
conn.autocommit = True
cur = conn.cursor()
# Create a table called "Owner" in the "Q" database
cur.execute("DROP TABLE IF EXISTS Item;")
cur.execute("DROP TABLE IF EXISTS Owner;")
cur.execute("DROP TABLE IF EXISTS ItemCategory;")
cur.execute("DROP TABLE IF EXISTS Condition;")
cur.execute("DROP TABLE IF EXISTS Location;")
cur.execute("DROP TABLE IF EXISTS ItemQuantityType;")

cur.execute("CREATE TABLE Owner (Id SERIAL PRIMARY KEY, Description TEXT);")
cur.execute("CREATE TABLE ItemCategory (Id SERIAL PRIMARY KEY, Description TEXT);")
cur.execute("CREATE TABLE Condition (Id SERIAL PRIMARY KEY, Description TEXT);")
cur.execute("CREATE TABLE Location (Id SERIAL PRIMARY KEY, Description TEXT, Road TEXT, Town TEXT, County TEXT, Postcode TEXT);")
cur.execute("CREATE TABLE ItemQuantityType (Id SERIAL PRIMARY KEY, Description TEXT);")
cur.execute("CREATE TABLE Item (Id SERIAL PRIMARY KEY, description TEXT, quantity INTEGER, notes TEXT, estimated_unit_value DECIMAL, estimated_life_span INTEGER, Category INTEGER REFERENCES ItemCategory(Id), purchase_date DATE, estimated_replacement_date DATE);")
cur.execute("CREATE VIEW ItemView AS SELECT * FROM Item I;")

cur.close()
conn.close()
print("Database initiated successfully!")