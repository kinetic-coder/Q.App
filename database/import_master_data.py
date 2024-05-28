import psycopg2
import os

def get_database_connection():
    try:
        # Connect to the PostgreSQL database
        connection = psycopg2.connect(
            host="localhost",
            port="5432",
            database="Q",
            user="postgres",
            password="example"
        )
        
        # Create a cursor object to interact with the database
        cursor = connection.cursor()
        print("Connection to the database was successful!")        
        return connection, cursor

        
    except (Exception, psycopg2.Error) as error:
        print("Error while connecting to PostgreSQL database:", error)

def close_database_connection(connection, cursor):
    if connection:
        cursor.close()
        connection.close()
        print("PostgreSQL connection is closed")

def import_owner_data(cursor, path, table_name):
    try:
        # Open the owner.csv file for reading
        # Get the absolute path of the owner.csv file
        file_path = os.path.abspath(path)

        # Open the owner.csv file for reading
        with open(file_path, 'r') as file:
            # Read the contents of the file
            data = file.read()

            # Split the data into rows
            rows = data.split('\n')

            # Iterate over the rows
            for row in rows:
                # Split each row into columns
                columns = row.split(',')

                # Extract the description value
                description = columns[0]

                # Insert the description into the Owner table
                cursor.execute(f"INSERT INTO {table_name} (Description) VALUES (%s)", (description,))

            # Commit the changes to the database
            cursor.connection.commit()

            print(f"{table_name} data imported successfully!")
            
    except (Exception, psycopg2.Error) as error:
        print("Error while importing owner data:", error)

conn, cursor = get_database_connection()

# Call the import_owner_data method
import_owner_data(cursor, "./import/owner.csv", "Owner")
import_owner_data(cursor, "./import/category.csv", "ItemCategory")
import_owner_data(cursor, "./import/condition.csv", "Condition")
import_owner_data(cursor, "./import/quantity_units.csv", "ItemQuantityType")
import_owner_data(cursor, "./import/locations.csv", "Location")