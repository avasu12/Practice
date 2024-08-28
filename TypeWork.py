
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
