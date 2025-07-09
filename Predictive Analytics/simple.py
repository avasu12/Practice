import pandas as pd
from sklearn.linear_model import LinearRegression

rev_dataframe = pd.read_csv("filepath")
print(rev_dataframe)
print(rev_dataframe.dtypes)
print("Sum: ", rev_dataframe['Revenue'].sum())