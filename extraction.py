import requests

xero_headers = {'Authorization': 'ThisIsASecret'}
new_request = requests.get('https://identity.xero.com/connect/token?grant_type=client_credentials&scope=profile', headers=xero_headers)

print(new_request)
