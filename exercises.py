''' Clock problem

Inputs: Current time, wait hours
Outputs: Alarm time

'''

current_time = int(input("What time is it now? Enter an integer, and assume a 24 hour clock"))
wait_hours = int(input("How long should you wait? Enter an integer representing hours of waiting time"))

alarm_time = (current_time + wait_hours)%24

print("The alarm rings at ", alarm_time)
