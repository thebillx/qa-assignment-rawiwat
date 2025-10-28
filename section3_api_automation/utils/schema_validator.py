import json
from jsonschema import validate

def validate_schema(instance, schema_path):
    with open(schema_path, "r") as f:
        schema = json.load(f)
    validate(instance=instance, schema=schema)
