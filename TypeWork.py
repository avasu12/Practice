import pandas as pd

df = pd.DataFrame({"test": 5}, index=['test1'])

print(df)
print(df["test"])

scores = pd.Series([34,64,11,34,98,54,84,23], name="Score")
print(scores)



class Node:
    def __init__(self):
        print('Object Initialized')

    def test(self):
        print('Inside class Node')

n = Node()

print(n)
n.test()

x = memoryview(bytes(10))
print(x)
print("test commit")

# type hints

def database_connect(username: str):
    print("In Database Connect")

database_connect('string123')

# "With" keyword

with open('file.txt', 'r') as x:
    text_collection = x.readlines()

for sentence in text_collection:
    print(sentence)
