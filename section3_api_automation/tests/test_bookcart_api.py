import pytest
import sys, os
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))
from utils.api_client import get_books, create_book
from utils.schema_validator import validate_schema

CURRENT_DIR = os.path.dirname(os.path.abspath(__file__))
SCHEMA_PATH = os.path.join(CURRENT_DIR, "../schema/book_schema.json")

def test_get_all_books():
    response = get_books()
    assert response.status_code == 200
    data = response.json()
    assert isinstance(data, list)
    assert "bookId" in data[0]
    validate_schema(data[0], SCHEMA_PATH)

def test_create_book():
    payload = {
        "bookId": 0,
        "title": "Automation with Pytest",
        "category": "Testing",
        "price": 399,
        "author": "Rawiwat",
        "publisher": "QA Press"
    }
    response = create_book(payload)
    print(f"POST /Book -> {response.status_code}")

    if response.status_code == 401:
        pytest.skip("BookCart API requires authentication. Skipping test.")

    assert response.status_code in [200, 201], f"Unexpected: {response.status_code}"
    data = response.json()
    assert data["title"] == "Automation with Pytest"


def test_create_book_invalid_payload():
    invalid_payload = {"name": "Missing Fields"}
    response = create_book(invalid_payload)
    print(f"POST /Book (invalid payload) -> {response.status_code}")

    if response.status_code == 401:
        pytest.skip("BookCart API requires authentication. Skipping invalid payload test.")

    assert response.status_code in [400, 500], f"Unexpected: {response.status_code}"


def test_create_book_with_fake_token():
    """Verify that using a Bearer token still results in unauthorized if invalid."""
    payload = {
        "bookId": 0,
        "title": "QA Automation",
        "category": "Testing",
        "price": 300,
        "author": "Rawiwat"
    }
    response = create_book(payload, use_auth=True)
    assert response.status_code in [401, 403], f"Unexpected: {response.status_code}"
