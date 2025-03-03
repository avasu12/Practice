import psycopg2
from psycopg2 import sql

# Database connection parameters
hostname = 'localhost'  
port = 'SecretSecret'
dbname = 'SecretSecret'
user = 'SecretSecret'
password = 'SecretSecret'

# Establish connection
try:
    connection = psycopg2.connect(
        host=hostname,
        port=port,
        dbname=dbname,
        user=user,
        password=password
    )
    print("Connection successful!")
    cursor = connection.cursor()

    query = "SELECT * FROM test3;"
    cursor.execute(query)

    # Fetch results
    rows = cursor.fetchall()
    print("Data from your_table_name:")
    for row in rows:
        print(row)

    connection.commit()

except Exception as error:
    print(f"Error: {error}")

finally:
    # Close the cursor and connection
    if cursor:
        cursor.close()
    if connection:
        connection.close()
    print("Connection closed.")

