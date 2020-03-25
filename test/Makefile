.PHONY: types

VALIDATE ?= cd .. && ./bin/validate.sh

DIR = $(shell pwd)

all: types

types:
	@$(foreach file, $(wildcard $(DIR)/types/*/*.xml), ($(VALIDATE) -x $(DIR)/types.xsd $(file));)
	@$(foreach file, $(wildcard $(DIR)/types/*/failing/*.xml), ($(VALIDATE) -q -n -x $(DIR)/types.xsd $(file));)
