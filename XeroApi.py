from pip._vendor import requests

# Xero API Connection

auth_url = "https://identity.xero.com/connect/token"
auth_payload = 'grant_type=client_credentials&scopes=accounting.transactions'
auth_headers = {
  'Content-Type': 'application/x-www-form-urlencoded',
  'Authorization': 'Basic thisisasecret'
}

endpoint_url = "https://api.xero.com/api.xro/2.0/BankTransactions"


# Authorization
response = requests.request("POST", auth_url, headers=auth_headers, data=auth_payload)
response_json = response.json()
access_token = response_json["access_token"]


# Request for Data

endpoint_headers = {
  'Accept': 'application/json',
  'Xero-Tenant-Id': 'anothersecretwonttell',
  'Authorization': 'Bearer ' + access_token
}
endpoint_payload = {}
response = requests.request("GET", endpoint_url, headers=endpoint_headers, data=endpoint_payload)

print(response.text)


# Process response


# Load Response


# Read Response
print("hello")
