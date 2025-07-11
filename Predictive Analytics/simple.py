import pandas as pd
from sklearn.linear_model import LinearRegression

rev_dataframe = pd.read_csv("filepath")
print(rev_dataframe)
print(rev_dataframe.dtypes)
print("Sum: ", rev_dataframe['Revenue'].sum())

date_series = pd.to_datetime(rev_dataframe['Date'])
number_date_series = date_series.astype(int)/ 10**9
print(number_date_series)

converted_frame = pd.DataFrame({
    'Dates': number_date_series,
    'Revenue': rev_dataframe['Revenue']
})

print(converted_frame)



