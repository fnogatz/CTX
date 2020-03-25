# CTX - Chess Tournament Exchange

The <b>C</b>hess <b>T</b>ournament E<b>x</b>change (CTX) format is an application of XML for describing chess tournaments. It aims to include all relevant data of a chess tournament, i.e. all information about participating players and teams, their results and rankings, as well as general tournament information like round times, names of all arbiters, etc. It shall be a source format for rating calculations (Elo, DWZ, ...), easy to parse and exchange. Its filename extension is `.ctx`.

## Validation

CTX is defined by an XML Schema (XSD) of version 1.1. CTX files can be validated with any validator that supports XSD 1.1.

### Using Apache Xerces

For instance, you can validate your CTX file with [Apache Xerces](http://xerces.apache.org/) by the following command:

```sh
java jaxp.SourceValidator -xsd11 -fx -a CTX.xsd -i tournament.ctx
```

Apache Xerces requires Java. By calling `make xerces`, Apache Xerces gets downloaded into the directory `xerces`. As part of this repository, we provide a small bash script to validate a CTX file using this local Xerces instance. Additional information can be found in the [Readme-file in this project's `bin` directory](bin/README.md).

## Related Tools

*This section has not been updated since 2013. Some information might be outdated.*

### Convert Swiss-Chess Tournament (SWT) files

[Swiss-Chess](http://swiss-chess.de) (sometimes called WinSwiss) is the most popular chess tournament management software in Germany. It saves its tournament data in binary SWT-files. There already exists a [converter to CTX](https://github.com/fnogatz/swt2ctx), written for [node.js](http://nodejs.org).

## Todo

- Split the big XSD file into parts, e.g. one for each first-child-element.
- Add english `xs:annotation`.
- Provide a more relaxed, XSD 1.0 compatible Schema without the `xs:assert`, `xs:assertion` and `xs:alternative` sugar.

## FAQ

### How is it different to FIDE's TRF?

First the obvious one: it's XML!

CTX is more expressive than FIDE's CSV-based [TRF file format](http://ratings.fide.com/download/fidexchg.txt). Though you can extend TRF by adding new columns, we want to provide a standardized format that can be used for both simple and complex tournaments.

### Is it intended for manual creation?

No. Although XML is easily human-readable, the CTX schema is very hard-constrained and therefore better suited for computer-computer-interaction. The order of elements is well-defined, for example you have to specify all players and teams in a very specific order - unlike FIDE's TRF file format, where you can change the order of the given players as you like.

### What are the main targets?

- Expressiveness: Avoid text fields, provide highly structured elements.
- One-to-one correspondence: Every tournament state is defined by one and only one CTX file and vice-versa. This allows to make a `diff` over two tournaments (states), given a previously defined way of XML indentation.
