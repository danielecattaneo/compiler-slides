LATEX = xelatex
DESTDIR ?= .
OUTPUT := $(DESTDIR)/$(NAME).pdf

DATE = `git log -1 --date=short --pretty=format:%cd`

ifeq ($(shell uname -s),Darwin)
PDF_READER=open
else
PDF_READER=atril
endif

VERSION := $(shell \
  TAGNAME=`git describe --match $(MAIN)\* 2> /dev/null`; \
  if [ $$? -eq 0 ]; then \
    printf %s "$$TAGNAME" | sed -E 's/$(MAIN)-(.*)/\1/'; \
  else \
    printf '?'; \
  fi)

LATEXPARAM := "\def\VERSION{$(VERSION)} \def\DATE{$(DATE)} \input{$(MAIN)}"


.PHONY: all
all: $(OUTPUT)

.PHONY: $(MAIN).pdf
$(MAIN).pdf:
	@rm -f *.aux *.bbl *.blg
	$(LATEX) $(LATEXPARAM)
	@if [[ ( -f $(MAIN).aux ) && ( `grep citation $(MAIN).aux | wc -l` -ge 1 ) ]]; then \
	  bibtex $(MAIN); \
	fi
	$(LATEX) $(LATEXPARAM)
	$(LATEX) $(LATEXPARAM)
	@if [ -f $(MAIN).log ] && grep undefined\ references $(MAIN).log ; then \
	  for XREF in $(XREFS); do \
	    echo '\033[33mRecompiling XREF ' $$XREF; \
	    make -C $$XREF; \
	    echo '\033[39m'; \
	  done; \
	  $(LATEX) $(LATEXPARAM); \
	else \
	  echo '\033[32mXRefs are satisfied\033[39m'; \
	fi

pub:	$(MAIN).pdf
	cp -f $(MAIN).pdf $(OUTPUT)

.PHONY: view
view:	$(MAIN).pdf
	@$(PDF_READER) $(MAIN).pdf &

.PHONY: clean
clean:
	rm -f $(MAIN).aux $(MAIN).bbl $(MAIN).blg $(MAIN).dvi
	rm -f $(MAIN).log $(MAIN).toc $(MAIN).fls $(MAIN).lof
	rm -f $(MAIN).idx $(MAIN).loa $(MAIN).lot $(MAIN).lolisting 
	rm -f $(MAIN).synctex.gz $(MAIN).nav $(MAIN).out $(MAIN).snm
	rm -f $(MAIN).pdf $(OUTPUT) 


