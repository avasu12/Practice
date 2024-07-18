import requests

response = requests.get('https://api.restful-api.dev/objects')

print(response.text)

