import numpy as np

a = np.array([[3, 6, 9], [9, 36, 81]])
print(a)

print(a.shape)
print(a.ndim)
print(a.size)

zero_array = np.zeros(5)
print(zero_array)

one_array = np.ones(8)
print(one_array)

empty_array = np.empty(6)
print(empty_array)

arange_array = np.arange(4)
print(arange_array)