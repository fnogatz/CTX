APACHE_MIRROR ?= https://downloads.apache.org/
XERCES_DOWNLOAD_FILE ?= xerces/j/binaries/Xerces-J-bin.2.12.1-xml-schema-1.1.tar.gz

.PHONY: xerces clean test

xerces:
	mkdir -p xerces
	wget -qO- "${APACHE_MIRROR}/${XERCES_DOWNLOAD_FILE}" | tar xvfz - --strip 1 -C xerces

clean:
	rm -rf xerces

test:
	$(MAKE) -C test all
