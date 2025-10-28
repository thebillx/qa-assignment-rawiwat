import requests
import pytest 

BASE_URL = "https://bookcart.azurewebsites.net/api"
FAKE_TOKEN = "ey.fake.jwt.token"

def get_books():
    url = f"{BASE_URL}/Book"
    response = requests.get(url)
    print(f"GET {url} → {response.status_code}")

    if response.status_code != 200:
        pytest.skip("BookCart API is currently unavailable or restricted.")

    return response

def create_book(payload, use_auth=False):
    url = f"{BASE_URL}/Book"
    headers = {"accept": "application/json"}
    if use_auth and FAKE_TOKEN:
        headers["Authorization"] = f"Bearer {FAKE_TOKEN}"
    response = requests.post(url, json=payload, headers=headers)
    print(f"POST {url} -> {response.status_code}")
    return response
