DESTDIR ?= .
objects := 00 01 02 03

all: $(objects)
.PHONY: all

$(objects):
	$(MAKE) DESTDIR=../../$(DESTDIR) -C src/$@
	
clean:
	for object in $(objects); do \
	  $(MAKE) clean DESTDIR=../../$(DESTDIR) -C src/$$object; \
	done

