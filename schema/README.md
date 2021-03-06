# XML Schema for CTX

CTX is defined by an XML Schema (XSD) of version 1.1.

## Style Guide

1.  Use 4 spaces for indentation.
1.  Put type definitions directly into the element. Create a named type only if needed for reference in the schema or tests.
1.  Type names are all-lowercase.
1.  Use `xs:sequence` over `xs:all`.

## Todo

- Split the big XSD file into parts, e.g. one for each first-child-element.
- Remove German `xs:annotation`.
- Provide a more relaxed, XSD 1.0 compatible Schema without the `xs:assert`, `xs:assertion` and `xs:alternative` sugar.
