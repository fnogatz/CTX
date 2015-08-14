# CTX - Chess Tournament Exchange Format

The <b>C</b>hess <b>T</b>ournament E<b>x</b>change (CTX) Format is an application of XML for describing chess tournaments. It aims to include all relevant data of a chess tournament, i.e. all information about participating players and teams, their results and rankings as well as general tournament information like round times, names of all arbiters etc. It shall be a source format for rating calculations (Elo, DWZ, ...), easy to parse and exchange. Its official filename extension is `.ctx`.

## Validation

The Chess Tournament Exchange Format is defined by a large XML Schema (XSD). As it's a XSD of version 1.1, the number of tools to validate a CTX file against the CTX-Schema is limited. With [Apache Xerces](http://xerces.apache.org/) you can validate your CTX file by the following command:

	java jaxp.SourceValidator -xsd11 -a CTX.xsd -i /your/tournament.ctx

An installation introduction in German can be found on [ioexception.de](http://www.ioexception.de/2012/08/20/xml-dokumente-per-xsd-1-1-mit-apache-xerces-j-validieren/).

## Related Tools

### Convert Swiss-Chess Tournament (SWT) files

[Swiss-Chess](http://swiss-chess.de) (sometimes called WinSwiss) is the most popular chess tournament management software in Germany. It saves its tournament data in binary SWT-files. There already exists a [converter to CTX](https://github.com/fnogatz/swt2ctx), written for [node.js](http://nodejs.org).

## Todo

* Split the big XSD file into parts, e.g. one for each first-child-element.
* Add english `xs:annotation`.
* Provide a more relaxed, XSD 1.0 compatible Schema without the `xs:assert`, `xs:assertion` and `xs:alternative` sugar.

## FAQ

### How is it different to FIDE's TRF?

First the obvious one: it's XML!

CTX is more expressive than FIDE's CSV-based [TRF file format](http://ratings.fide.com/download/fidexchg.txt). Though you can extend TRF by adding new columns, we want to provide a standardized format that can be used for both simple and complex tournaments.

### Is it intended for manual creation?

No. Although XML is easily human-readable, the CTX schema is very hard-constrained and therefore better suited for computer-computer-interaction. The order of elements is well-defined, for example you have to specify all players and teams in a very specific order - unlike FIDE's TRF file format, where you can change the order of the given players as you like.

### What are the main targets?

* Expressiveness: Avoid text fields, provide highly structured elements.
* One-to-one correspondence: Every tournament state is defined by one and only one CTX file and vice-versa. This allows to make a `diff` over two tournaments (states).
