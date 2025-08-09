#!/usr/bin/env python3
import json, os, sys
from glob import glob

try:
    import jsonschema
except ImportError:
    print("Install dependency: pip install jsonschema")
    sys.exit(1)

SCHEMAS_DIR = "schemas"
PROJECT_DIR = "project"

def load_json(path):
    with open(path, "r", encoding="utf-8") as f:
        return json.load(f)

schemas = {}
for sp in glob(os.path.join(SCHEMAS_DIR, "*.json")):
    schemas[os.path.basename(sp)] = load_json(sp)

validators = {
    "state": jsonschema.Draft202012Validator(schemas["section_state.schema.json"]),
    "handoff": jsonschema.Draft202012Validator(schemas["handoff.schema.json"]),
    "claims": jsonschema.Draft202012Validator(schemas["claims.schema.json"]),
    "verification": jsonschema.Draft202012Validator(schemas["verification.schema.json"]),
    "adversarial": jsonschema.Draft202012Validator(schemas["adversarial.schema.json"]),
    "paths": jsonschema.Draft202012Validator(schemas["paths.schema.json"]),
}

def validate_file(vkey, path):
    data = load_json(path)
    validators[vkey].validate(data)

errors = 0
for path in glob(os.path.join(PROJECT_DIR, "**", "state.json"), recursive=True):
    try: validate_file("state", path)
    except Exception as e: print("STATE FAIL:", path, e); errors += 1

for path in glob(os.path.join(PROJECT_DIR, "**", "handoff.json"), recursive=True):
    try: validate_file("handoff", path)
    except Exception as e: print("HANDOFF FAIL:", path, e); errors += 1

for path in glob(os.path.join(PROJECT_DIR, "**", "claims*.json"), recursive=True):
    try: validate_file("claims", path)
    except Exception as e: print("CLAIMS FAIL:", path, e); errors += 1

for path in glob(os.path.join(PROJECT_DIR, "**", "verification*.json"), recursive=True):
    try: validate_file("verification", path)
    except Exception as e: print("VERIFICATION FAIL:", path, e); errors += 1

for path in glob(os.path.join(PROJECT_DIR, "**", "adversarial*.json"), recursive=True):
    try: validate_file("adversarial", path)
    except Exception as e: print("ADVERSARIAL FAIL:", path, e); errors += 1

for path in glob(os.path.join(PROJECT_DIR, "**", "paths.json"), recursive=True):
    try: validate_file("paths", path)
    except Exception as e: print("PATHS FAIL:", path, e); errors += 1

if errors:
    print(f"Validation completed with {errors} error(s).")
    sys.exit(1)
else:
    print("All JSON files are schema-valid.")
