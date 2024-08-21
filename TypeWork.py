
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