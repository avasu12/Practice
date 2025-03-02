import psycopg2

conn = psycopg2.connect("dbname=Test1 user=ptest1")

print(conn)

cur = conn.cursor("SELECT * FROM test2;")

print(cur)

