#!/bin/bash

usage="$(basename "$0") [-hqn] [-x schema.xsd] file.ctx -- program to validate a CTX file

where:
    -h  show this help text
    -x  set the schema file (default: XSD for CTX)
    -q  quiet, do not print validation errors
    -n  negative, validation should fail"

schema="../schema/CTX.xsd"
print_errors=1
should_fail=0
while getopts ':hqnx:' option; do
  case "$option" in
    h) echo "$usage"
       exit
       ;;
    x) schema=$OPTARG
       ;;
    q) print_errors=0
       ;;
    n) should_fail=1
       ;;
    :) printf "missing argument for -%s\n" "$OPTARG" >&2
       echo "$usage" >&2
       exit 1
       ;;
   \?) printf "illegal option: -%s\n" "$OPTARG" >&2
       echo "$usage" >&2
       exit 1
       ;;
  esac
done
shift $((OPTIND - 1))
file="$1"

# run XSD 1.1 validation using local Xerces instance
{ error=$(java -classpath xerces/xercesImpl.jar:xerces/xercesSamples.jar:xerces/xml-apis.jar:xerces/icu4j.jar:xerces/org.eclipse.wst.xml.xpath2.processor_1.2.0.jar:xerces/cupv10k-runtime.jar jaxp.SourceValidator -xsd11 -fx -a "$schema" -i "$file" 2>&1 1>&$out); } {out}>&1

if [[ -z "$error" ]]; then
    # no error
    if [[ "$should_fail" -eq 1 ]]; then
        exit 1
    else
        exit 0
    fi
else
    if [[ "$print_errors" -eq 1 ]]; then
        echo "$error"
    fi
    if [[ "$should_fail" -eq 1 ]]; then
        exit 0
    else
        exit 1
    fi
fi
