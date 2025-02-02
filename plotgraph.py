import pandas as pd
import matplotlib.pyplot as plt
import numpy as np

'''
x = np.arange(0, 10)  
y = np.random.random(10) 

plt.plot(x, y)

plt.xlabel('X-Axis')
plt.ylabel('Y-Axis')
plt.title('Random Line Chart')

plt.show()
'''

# To "plot" means to draw/mark points on a graph
df = pd.read_csv('Secret Directory')
print(df.head())


df['Duration'] = pd.to_timedelta(df['Duration'])
df['decimal_hours'] = df['Duration'].dt.total_seconds() / 3600
df['decimal_hours'] = df['decimal_hours'].round(2)
df['Start'] = pd.to_datetime(df['Start'])

print(df)
print(df.dtypes)


plt.figure(figsize=(10, 6))

# Group by 'category' and plot each category as a separate line
for category, group in df.groupby('Work Item'):
    plt.plot(group['Start'], group['decimal_hours'], label=category)

# Add labels and title
plt.xlabel('Day')
plt.ylabel('Hours')
plt.title('Hours by Day and Category')
plt.legend(title='Category')

# Show the plot
plt.xticks(rotation=45)
plt.tight_layout()
plt.show()