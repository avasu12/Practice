import requests

html_doc = """<html><head><title>The Dormouse's story</title></head>
<body>
<p class="title"><b>The Dormouse's story</b></p>

<p class="story">Once upon a time there were three little sisters; and their names were
<a href="http://example.com/elsie" class="sister" id="link1">Elsie</a>,
<a href="http://example.com/lacie" class="sister" id="link2">Lacie</a> and
<a href="http://example.com/tillie" class="sister" id="link3">Tillie</a>;
and they lived at the bottom of a well.</p>

<p class="story">...</p>
"""

from bs4 import BeautifulSoup
soup = BeautifulSoup(html_doc, 'html.parser')


print(html_doc)

print(soup.prettify())
print(soup.title)
print(soup.title.name)
print(soup.title.string)
print(soup.p)
print(soup.p['class'])
print(soup.a)
print(soup.findall('a'))
print(soup.find(id="link3"))


r = requests.get('https://api.restful-api.dev/objects')
