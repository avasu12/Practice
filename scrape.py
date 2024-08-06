import requests
from bs4 import BeautifulSoup as bs

r = requests.get("https://keithgalli.github.io/web-scraping/example.html")

print(r)
print(r.content)

print("\n\n")

soup = bs(r.content)
print(soup.prettify())

first_paragraph = soup.find("p")
print(first_paragraph)
