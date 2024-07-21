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


