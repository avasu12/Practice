'''
Inputs: Day of week, duration of stay
Outputs: Final day of holiday
'''
weekdays = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]

current_day = 999

current_day = int(input("What day of the week is it? Please enter an integer; 0 represents Sunday, and 6 represents Saturday\n"))
holiday_duration = int(input("How long will your holiday be? Please enter an integer denoting the number of days.\n"))

final_day = (current_day + holiday_duration) % 7



print("The final day of your holiday will be a ", weekdays[final_day])

