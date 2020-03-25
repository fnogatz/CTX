# CTX Validator

Bash script to validate CTX files using Apache Xerces.

## Usage

Please ensure to call `bin/validate.sh` from the project's root directory.

```
./bin/validate.sh [-hqn] [-x schema.xsd] file.ctx -- program to validate a CTX file

where:
    -h  show this help text
    -x  set the schema file (default: XSD for CTX)
    -q  quiet, do not print validation errors
    -n  negative, validation should fail
```
