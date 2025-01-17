'''
Print numbers
sys is a standard library in python
The str() function accepts an object, and returns the string or 'text sequence' version of that object.
'''


import sys

if __name__ == '__main__':
    n = int(input())
    for i in range(1, n+1):
        sys.stdout.write(str(i))
