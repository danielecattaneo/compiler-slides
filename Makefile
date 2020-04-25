DESTDIR ?= .
objects := $(shell ls src | grep -E '\d\d.*')

all: $(objects)
.PHONY: all

$(objects):
	$(MAKE) pub DESTDIR=../../$(DESTDIR) -C src/$@
	
clean:
	for object in $(objects); do \
	  $(MAKE) clean DESTDIR=../../$(DESTDIR) -C src/$$object; \
	done

