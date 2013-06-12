# CTX - Chess Tournament Exchange Format

The __Chess T__ournament E<b>x</b>change Format is an application of XML for describing chess tournaments. It aims to include all relevant data of a chess tournament, i.e. all information about participating players and teams, their results and rankings as well as general tournament information like round times, names of all arbiters etc. It shall be a source format for rating calculations (Elo, DWZ, ...), easy to parse and exchange. Its official filename extension is `.ctx`.

# Validation

The Chess Tournament Exchange Format is defined by a large XML Schema (XSD). As it's a XSD of version 1.1, the number of tools to validate a CTX file against the CTX-Schema is limited. With [Apache Xerces](http://xerces.apache.org/) you can validate your CTX file by the following command:

	java jaxp.SourceValidator -xsd11 -a /path/to/CTX.xsd -i /your/tournament.ctx

An installation introduction in German can be found on [ioexception.de](http://www.ioexception.de/2012/08/20/xml-dokumente-per-xsd-1-1-mit-apache-xerces-j-validieren/).

# Related Tools

### Convert Swiss-Chess Tournament (SWT) files

[Swiss-Chess](http://swiss-chess.de) is the most popular chess tournament management software in Germany. It saves its tournament data in binary SWT-files. There already exists a [converter to CTX](https://github.com/fnogatz/swt2ctx), written for [node.js](http://nodejs.org).

# Todo

* Split the big XSD file into parts, e.g. one for each first-child-element.
* Add english `xs:annotation`.
* Provide a more relaxed, XSD 1.0 compatible Schema without the `xs:assert`, `xs:assertion` and `xs:alternative` sugar.

# Licence

	Copyright (c) 2012-2013 Falco Nogatz (fnogatz@gmail.com)

	Permission is hereby granted, free of charge, to any person obtaining a copy
	of this software and associated documentation files (the "Software"), to deal
	in the Software without restriction, including without limitation the rights
	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
	copies of the Software, and to permit persons to whom the Software is
	furnished to do so, subject to the following conditions:

	The above copyright notice and this permission notice shall be included in
	all copies or substantial portions of the Software.

	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
	THE SOFTWARE.