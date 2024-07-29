""" Practicing python 
a variety of problems """

# Adding numbers

variable_one = 5
variable_two = 17

print(variable_one + variable_two + 17)


# Creating strings

string_one = "Rolling pin"
string_two = "whisk"

print(string_one + "asdf " + string_two)


# Working with types

cast_string = str(52)
cast_integer = int(32)

print(cast_string + " test")

print(type(cast_integer))


float_value = float(68.9912)
integer_value = int(22.6)

print(float_value * integer_value)


# Creating variables 

var_one, var_two, var_three, var_four = 43, 234, 33, 56
car_name = "Fiat"

print(var_three + var_one)

# Printing multiple types:

print(var_one, string_two, float_value, "End of multi-type print")


# Scopes

def some_function():
    global inner_variable
    inner_variable = "inside some_function()"

    print(float_value)

some_function()
print(inner_variable)




# Strings

single_quoted = "Ball Hammer"
double_quoted = 'ripe capsule'

nested_singlequote = "Ball 'Hammer'"
nested_doublequote = '"ripe" capsule'

print(nested_singlequote)
print(nested_doublequote)


long_string = """ The quick sly fox
jumped over 
the lazy brown dog"""

print(long_string)

long_singlequote = '''Lorem Ipsum 
dolor sit amet
consectetur adipiscing elit'''

print(long_singlequote)


# Type Hierarchy

print(type(long_singlequote).__mro__)



# Booleans

print(var_one > var_two)
print(bool(""))

# Operators

print(5 -19)
if "23" in ["22", "23", "24"]:
	print("exists")
else:
	print("does not exist")

if str("blanket") is str("blanket"):
	print("same object")
else:
	print("different object")


# Lists

list_one = [23, 22, 65, 45, 92, 100, 159, 1376]

print(list_one)
print(type(list_one))
print(list_one[4])
print(list_one[-1])
print(list_one[3:5])
print(list_one[:2])

if 100 in list_one:
	print("membership operator works")

print(type(list_one).__mro__)

list_one[0:5] = [3]
print(list_one)

list_one[0:1] = [3, 5, 98]
print(list_one)


# Loops

i = len(list_one)
while i > 3:
    print("greater")
    i-=1
else:
    print("loop complete")

for number in list_one:
    print(number)


# Functions

def print_message():
    print("Hello World!")

print_message()

def space_filler():
    pass

space_filler()



# Dreaded recursion

def recursion_sum(number):
    sum = 0
    next_arg = number - 1
    if next_arg >= 0:
        sum = number + recursion_sum(next_arg)
        return sum
    else:
        return sum

print(recursion_sum(10))


# Dictionaries

new_dictionary = { "carbohydrate": "wheat", "protein": "beans", "fat": "oils", "grams": 250 }

print(new_dictionary)
print(new_dictionary.keys())

# Tuples

horizon_characters = ( "Aloy", "Alva", "Sylens", "Varl", "Zo", "Erend", "Beta", "Kotallo")
print(horizon_characters)


# Sets

set_A = { 'a', 'b', 'c', 1, 2, 3 }
set_B = { 'c', 1, 34, 98, 'z', 'x' }

print(set_A.union(set_B))
print(set_A.intersection(set_B))



# Observations

print(__name__)

print(list(range(5,20)))
n = input("Enter number:")
if n in range(5,20):
    print("In Range")
else:
    print("Out of range")

print('testing commits')
