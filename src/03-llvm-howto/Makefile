NAME = $(shell basename `pwd`)
MAIN = main
XREFS = 

.PHONY: all
all: com-all

.PHONY: pub
pub: pdf-pub example-pub

include ../Makefile.inc

CODE_EXAMPLE := $(realpath $(DESTDIR))/$(NAME)-code.zip

.PHONY: example-pub
example-pub: example
	cd example;\
	git archive -o $(CODE_EXAMPLE) --prefix $(NAME)-code/ HEAD .
