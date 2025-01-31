import pandas as pd
import matplotlib.pyplot as plt
import numpy as np


x = np.arange(0, 10)  
y = np.random.random(10) 

plt.plot(x, y)

plt.xlabel('X-Axis')
plt.ylabel('Y-Axis')
plt.title('Random Line Chart')

plt.show()