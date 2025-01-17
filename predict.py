# Predictive Analytics

import pandas as pd # Data Analysis Library
import numpy as np # Scientific Computing Library
import seaborn as sb # Visualization Library
import matplotlib.pyplot as plt # Visualization Library

'''
To make a prediction:
1. Get some data
2. Get a model
3. Use some data to train the model, and some to test the accuracy of the model
4. Make predictions with the model
'''


# Dataset
data = {
    'Age': [22, 25, 47, 52, 46, 56, 55, 23, 24, 43],
    'Income': [25000, 30000, 50000, 60000, 55000, 70000, 80000, 28000, 32000, 45000],
    'Purchased': [0, 0, 1, 1, 1, 1, 1, 0, 0, 1]
}

df = pd.DataFrame(data)

print(df.head())

''' What is this?
Features = df[['Age', 'Income']]
Target = df['Purchased']

print(Features)
print(Target)

'''

# Numpy trial

numpy_array = np.array([0,1,2,3,4,5])
print(numpy_array)
doubled_array = numpy_array * 2
print(doubled_array)
translated_array = numpy_array + 17
print(translated_array)

interval_range = np.arange(10, 50, 17)
print(interval_range)
mean = np.mean(doubled_array)
print(mean)
standard_deviation = np.std(doubled_array)
print(standard_deviation)

# Simple visualization

random_data = np.random.randn(1000)

sb.histplot(random_data, kde = True)
plt.show()