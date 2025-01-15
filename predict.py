# Predictive Analytics


import pandas as pd # Data Analysis Library
import numpy as np # Scientific Computing Library
import seaborn as sb # Visualization Library
import matplotlib.pyplot as plt # Visualization Library

# Dataset
data = {
    'Age': [22, 25, 47, 52, 46, 56, 55, 23, 24, 43],
    'Income': [25000, 30000, 50000, 60000, 55000, 70000, 80000, 28000, 32000, 45000],
    'Purchased': [0, 0, 1, 1, 1, 1, 1, 0, 0, 1]
}

df = pd.DataFrame(data)

print(df.head())

# What is this?
Features = df[['Age', 'Income']]
Target = df['Purchased']

print(Features)
print(Target)