import pandas as pd
from typing import List, Dict, Optional


data_frame = pd.DataFrame({'test': [1,4,6,7,9], 'test2': [2,3,5, 0,1]})
print(data_frame)
print(data_frame['test2'])
print(data_frame.describe())
print(data_frame['test2'].sum())


class Node:
    def __init__(self):
        print('Object Initialized')

    def test(self):
        print('Inside class Node')

n = Node()

# print(n)
n.test()

x = memoryview(bytes(10))
# print(x)
# print("test commit")

# type hints

def database_connect(username: str):
    print("In Database Connect")

database_connect('string123')

def complex_hint(parameter: List[Dict[str, Optional[int]]]):
    print("In Compelx Hint")

complex_hint([{"data": 3}])

# "With" keyword

with open('file.txt', 'r') as x:
    text_collection = x.readlines()

for sentence in text_collection:
    print(sentence)
