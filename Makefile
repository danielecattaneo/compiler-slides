DESTDIR ?= .
objects := $(shell find -s src -d 2 -name "Makefile" | sed -E -e 's/src\///g' -e 's/\/Makefile//g')

all: $(objects)
.PHONY: all

$(objects):
	$(MAKE) pub DESTDIR=../../$(DESTDIR) -C src/$@
	
clean:
	for object in $(objects); do \
	  $(MAKE) clean DESTDIR=../../$(DESTDIR) -C src/$$object; \
	done

