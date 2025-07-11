import pandas as pd
import matplotlib.pyplot as plt

rev_df = pd.read_csv("filepath")
print(rev_df)

print(rev_df.dtypes)

rev_df['Date'] = pd.to_datetime(rev_df['Date'])

print(rev_df.dtypes)

plt.plot(rev_df['Date'], rev_df['Revenue'])
plt.title = "Revenue trend"
plt.xlabel = "Date"
plt.ylabel = "Revenue"
plt.grid(True)
plt.show()