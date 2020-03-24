APACHE_MIRROR ?= https://downloads.apache.org/
XERCES_DOWNLOAD_FILE ?= xerces/j/binaries/Xerces-J-bin.2.12.1-xml-schema-1.1.tar.gz

.PHONY: xerces clean

xerces:
	mkdir -p download
	wget -O download/xerces.tar.gz "${APACHE_MIRROR}/${XERCES_DOWNLOAD_FILE}"
	tar -zxvf download/xerces.tar.gz -C download
	rm download/xerces.tar.gz
	mv download/xerces* xerces

clean:
	rm -rf xerces
	rm -rf download
