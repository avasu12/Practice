import random



with open('example.txt', 'w') as file:
    file.write("Hello, World!")

grid = list(range(1, 10))
print(grid)
print(type(grid))


def row_check():
    print("row check")

def column_check():
    print('test')

def box_check():
    print('ready')

for digit in grid:
    row_check()
    column_check()
    box_check()


