def fibonacci(start_element, end_element):
    print("test message")

fibonacci(start_element=6, end_element=5)

def fibonacci_default(start_element, end_element = 9):
    print("test message")

fibonacci_default(start_element=5)

def test_function(parameter1 = 3, parameter2: int = 7) -> int:
    print("Inside test function")
    return parameter2

x = test_function()
print(x)