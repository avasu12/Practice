import pandas as pd
import matplotlib.pyplot as plt
import numpy as np

# Figure
# Axes

'''
figure, axes = plt.subplots()
axes.plot([1,2,3,4,5], [5,7,8,9,1])
plt.show()
'''

x = [1,2,3,4,5]
y = [5,7,8,9,1]
# scatterplot = plt.scatter(x, y)
# bargraph = plt.bar(x, y)
# stemgraph = plt.stem(x, y)
# stackgraph = plt.stackplot(x, y)

piegraph = plt.pie(y)
plt.show()
