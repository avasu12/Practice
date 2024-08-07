'''
Input: Principal amount, number of compound times, Interest rate, number of years
Output: Maturity/final amount

'''

principal_amount = 10000
compound_number = 12
interest_rate = float(0.08)
year_count = int(input("For how many years should the principal gain interest? Enter an integer. \n"))

final_amount = principal_amount * ((1 + (interest_rate/compound_number))**(compound_number * year_count))

print("The final amount is: ", final_amount)


