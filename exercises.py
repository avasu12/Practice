import math

''' Clock problem

Inputs: Current time, wait hours
Outputs: Alarm time



current_time = int(input("What time is it now? Enter an integer, and assume a 24 hour clock"))
wait_hours = int(input("How long should you wait? Enter an integer representing hours of waiting time"))

alarm_time = (current_time + wait_hours)%24

print("The alarm rings at ", alarm_time)


# Math functions

print(math.sqrt(9))
print((10*2/1))

# Strings

num_chars = len("rv")
print(num_chars)

'''

'''
Count vowels in a string
'''

vowels = ['a', 'e', 'i', 'o', 'u']

def count_vowels(user_string: str) -> int:
    count = 0
    for character in user_input:
        if character in vowels:
            count+=1
    return count

user_input = input("Enter a string: ")
count = count_vowels(user_input)
print("There are ", count, " vowels in your string.")