import pandas as pd
from io import StringIO

data = """
transaction_id,customer_id,transaction_date,product,amount
1,101,2023-01-01,Widget A,100
2,102,2023-01-01,Widget B,150
3,101,2023-01-02,Widget A,200
4,103,2023-01-03,Widget C,120
5,102,2023-01-03,Widget B,170
6,101,2023-01-04,Widget C,250
7,104,2023-01-05,Widget A,90
"""


df = pd.read_csv(StringIO(data))
print(df)

# Access maximum transaction date

df['transaction_date'] = pd.to_datetime(df['transaction_date'])
max_date = df['transaction_date'].max()
print(max_date)

df['day'] = df['transaction_date'].dt.day
df['day_type'] = ['even' if day % 2 == 0 else 'odd' for day in df['day']]

group_sum = df.groupby('day_type')['amount'].sum()

print(group_sum)


