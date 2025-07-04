import pandas as pd
from sklearn.linear_model import LinearRegression

d1 = 5
d2 = 'string'
d3 = True
d4 = {
    'a': [7, 8, 9],
    'b': [17,18,19],
    'c': ['seven', 'eight', 'nine']
}
d5 = ['phrase', 3.14, False]

data_frame = pd.DataFrame(d4)
'''
X = data_frame[['a']['b']]
y = data_frame['c']

model = LinearRegression()
test = model.fit(X, y)
'''
print(data_frame['c'])

'''
data = {
    'TV Advertising': [230, 44, 17, 151, 180, 89, 200],
    'Sales': [22, 10, 9, 18, 20, 14, 21]
}

df = pd.DataFrame(data)
print(df)

X = df[['TV Advertising']]
y = df['Sales']

model = LinearRegression()
model.fit(X, y)

print("Slope: ", model.coef_[0])
print("Intercept: ", model.intercept_)

new_adspend = [[250]]
prediction = model.predict(new_adspend)

print("Predicted Sales for new adspend ", prediction[0])

'''