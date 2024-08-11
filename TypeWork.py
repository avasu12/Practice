
print(b'this is a byte sequence')

import requests
from bs4 import BeautifulSoup

response = requests.get('https://waitbutwhy.com')
print(response)
# print(response.content)

soup = BeautifulSoup(response.content)
print(soup.prettify())


