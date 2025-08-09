#!/usr/bin/env python3
"""
Enhanced Schema Validator for SPARC Research Swarm
Validates both standard research artifacts and SPARC autonomous development artifacts
"""

import json
import os
import sys
from glob import glob
from pathlib import Path

try:
    import jsonschema
except ImportError:
    print("❌ Missing dependency: pip install jsonschema")
    sys.exit(1)

# ANSI color codes for better output
RED = '\033[0;31m'
GREEN = '\033[0;32m'
YELLOW = '\033[1;33m'
BLUE = '\033[0;34m'
NC = '\033[0m'  # No Color

def print_status(message):
    print(f"{BLUE}[SPARC VALIDATOR]{NC} {message}")

def print_success(message):
    print(f"{GREEN}✅ {message}{NC}")

def print_warning(message):
    print(f"{YELLOW}⚠️  {message}{NC}")

def print_error(message):
    print(f"{RED}❌ {message}{NC}")

SCHEMAS_DIR = "schemas"
PROJECT_DIR = "project"

def load_json(path):
    """Load JSON file with error handling"""
    try:
        with open(path, "r", encoding="utf-8") as f:
            return json.load(f)
    except json.JSONDecodeError as e:
        print_error(f"Invalid JSON in {path}: {e}")
        return None
    except Exception as e:
        print_error(f"Error reading {path}: {e}")
        return None

def load_schemas():
    """Load all available schemas"""
    schemas = {}
    schema_files = glob(os.path.join(SCHEMAS_DIR, "*.json"))
    
    for schema_path in schema_files:
        schema_name = os.path.basename(schema_path)
        schema_data = load_json(schema_path)
        if schema_data:
            schemas[schema_name] = schema_data
            print_status(f"Loaded schema: {schema_name}")
    
    return schemas

def create_validators(schemas):
    """Create validators for all schemas"""
    validators = {}
    
    # Standard research validators
    if "section_state.schema.json" in schemas:
        validators["state"] = jsonschema.Draft202012Validator(schemas["section_state.schema.json"])
    
    if "handoff.schema.json" in schemas:
        validators["handoff"] = jsonschema.Draft202012Validator(schemas["handoff.schema.json"])
    
    if "claims.schema.json" in schemas:
        validators["claims"] = jsonschema.Draft202012Validator(schemas["claims.schema.json"])
    
    if "verification.schema.json" in schemas:
        validators["verification"] = jsonschema.Draft202012Validator(schemas["verification.schema.json"])
    
    if "adversarial.schema.json" in schemas:
        validators["adversarial"] = jsonschema.Draft202012Validator(schemas["adversarial.schema.json"])
    
    if "paths.schema.json" in schemas:
        validators["paths"] = jsonschema.Draft202012Validator(schemas["paths.schema.json"])
    
    # SPARC autonomous development validators
    if "sparc_section_state.schema.json" in schemas:
        validators["sparc_state"] = jsonschema.Draft202012Validator(schemas["sparc_section_state.schema.json"])
    
    if "sparc_claims.schema.json" in schemas:
        validators["sparc_claims"] = jsonschema.Draft202012Validator(schemas["sparc_claims.schema.json"])
    
    if "sparc_verification.schema.json" in schemas:
        validators["sparc_verification"] = jsonschema.Draft202012Validator(schemas["sparc_verification.schema.json"])
    
    if "autonomous_synthesis.schema.json" in schemas:
        validators["autonomous_synthesis"] = jsonschema.Draft202012Validator(schemas["autonomous_synthesis.schema.json"])
    
    return validators

def validate_file(validator_key, path, validators):
    """Validate a single file against its schema"""
    if validator_key not in validators:
        print_warning(f"No validator available for {validator_key}")
        return False
    
    data = load_json(path)
    if data is None:
        return False
    
    try:
        validators[validator_key].validate(data)
        return True
    except jsonschema.ValidationError as e:
        print_error(f"VALIDATION FAILED: {path}")
        print_error(f"  Error: {e.message}")
        if e.absolute_path:
            print_error(f"  Path: {' -> '.join(str(p) for p in e.absolute_path)}")
        return False
    except Exception as e:
        print_error(f"VALIDATION ERROR: {path} - {e}")
        return False

def detect_file_type(file_path):
    """Detect whether a file is standard research or SPARC autonomous development"""
    data = load_json(file_path)
    if not data:
        return None
    
    # Check for SPARC autonomous development indicators
    if isinstance(data, dict):
        # Check for SPARC section state
        if "sparc_context" in data:
            return "sparc"
        
        # Check for SPARC claims
        if "autonomous_development_context" in data:
            return "sparc"
        
        # Check for autonomous synthesis
        if "autonomous_development_readiness" in data:
            return "sparc"
    
    return "standard"

def validate_project_structure():
    """Validate overall project structure and naming conventions"""
    errors = 0
    
    # Check for project directories
    project_dirs = glob(os.path.join(PROJECT_DIR, "P-*"))
    if not project_dirs:
        print_warning("No project directories found (should match pattern P-XXX)")
        return 0
    
    for project_dir in project_dirs:
        project_id = os.path.basename(project_dir)
        
        # Validate project ID format
        if not project_id.startswith("P-") or len(project_id) != 5:
            print_error(f"Invalid project ID format: {project_id} (should be P-XXX)")
            errors += 1
            continue
        
        print_status(f"Validating project structure: {project_id}")
        
        # Check for required directories
        required_dirs = [
            "control",
            "control/planning", 
            "sections"
        ]
        
        # Check for SPARC autonomous development directories
        sparc_sections = glob(os.path.join(project_dir, "sections", "S-*-*"))
        if sparc_sections:
            print_status(f"  Found SPARC autonomous development project: {len(sparc_sections)} specialized sections")
            required_dirs.extend([
                "control/synthesis",
                "control/validation",
                "evidence",
                "evidence/domain",
                "evidence/technology", 
                "evidence/security",
                "evidence/requirements",
                "evidence/operations"
            ])
        
        for req_dir in required_dirs:
            dir_path = os.path.join(project_dir, req_dir)
            if not os.path.isdir(dir_path):
                print_warning(f"  Missing directory: {req_dir}")
    
    return errors

def main():
    """Main validation function"""
    print_status("🔍 SPARC Research Swarm Schema Validator")
    print_status("Validating both standard research and SPARC autonomous development artifacts")
    print()
    
    # Load schemas and create validators
    print_status("Loading schemas...")
    schemas = load_schemas()
    if not schemas:
        print_error("No schemas found!")
        sys.exit(1)
    
    validators = create_validators(schemas)
    print_success(f"Created {len(validators)} validators")
    print()
    
    # Validate project structure
    print_status("Validating project structure...")
    structure_errors = validate_project_structure()
    print()
    
    # Find and validate all artifact files
    total_errors = structure_errors
    total_files = 0
    sparc_files = 0
    standard_files = 0
    
    validation_patterns = [
        ("state.json", "state", "sparc_state"),
        ("handoff.json", "handoff", "handoff"), 
        ("claims*.json", "claims", "sparc_claims"),
        ("verification*.json", "verification", "sparc_verification"),
        ("adversarial*.json", "adversarial", "adversarial"),
        ("autonomous-synthesis*.json", "autonomous_synthesis", "autonomous_synthesis"),
        ("paths.json", "paths", "paths")
    ]
    
    for pattern, standard_validator, sparc_validator in validation_patterns:
        file_paths = glob(os.path.join(PROJECT_DIR, "**", pattern), recursive=True)
        
        if not file_paths:
            continue
        
        print_status(f"Validating {pattern} files...")
        
        for file_path in file_paths:
            total_files += 1
            file_type = detect_file_type(file_path)
            
            if file_type == "sparc":
                sparc_files += 1
                validator_key = sparc_validator
                print_status(f"  [SPARC] {file_path}")
            else:
                standard_files += 1
                validator_key = standard_validator
                print_status(f"  [STD]  {file_path}")
            
            success = validate_file(validator_key, file_path, validators)
            if success:
                print_success(f"    Valid")
            else:
                total_errors += 1
        
        print()
    
    # Summary
    print("=" * 60)
    print_status("VALIDATION SUMMARY")
    print(f"📁 Total files validated: {total_files}")
    print(f"🔬 Standard research files: {standard_files}")
    print(f"🎯 SPARC autonomous files: {sparc_files}")
    print(f"❌ Total errors: {total_errors}")
    
    if total_errors == 0:
        print_success("🎉 ALL VALIDATIONS PASSED!")
        print_success("✅ Standard research artifacts: Valid")
        print_success("✅ SPARC autonomous development artifacts: Valid") 
        print_success("✅ Project structure: Valid")
        print()
        print_status("Ready for both standard research and SPARC autonomous development!")
    else:
        print_error(f"💥 VALIDATION FAILED with {total_errors} error(s)")
        print_error("Fix the above issues before proceeding")
        sys.exit(1)

if __name__ == "__main__":
    main()
