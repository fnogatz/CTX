.PHONY: types examples

VALIDATE ?= cd .. && ./bin/validate.sh

DIR = $(shell pwd)
DIR_EXAMPLES = $(abspath $(DIR)/../examples)

all: types examples

types:
	@$(foreach file, $(wildcard $(DIR)/types/*/*.xml), ($(VALIDATE) -x $(DIR)/types.xsd $(file));)
	@$(foreach file, $(wildcard $(DIR)/types/*/invalid/*.xml), ($(VALIDATE) -q -n -x $(DIR)/types.xsd $(file));)

examples:
	@$(foreach file, $(wildcard $(DIR_EXAMPLES)/*.ctx), ($(VALIDATE) -x $(DIR)/../schema/CTX.xsd $(file));)
