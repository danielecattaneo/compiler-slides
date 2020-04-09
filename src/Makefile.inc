LATEX = pdflatex
DESTDIR ?= .
OUTPUT := $(DESTDIR)/$(NAME).pdf

DATE = `git log -1 --date=short --pretty=format:%cd`

ifeq ($(shell uname -s),Darwin)
PDF_READER=open
else
PDF_READER=atril
endif

VERSION := $(shell \
  TAGNAME=`git describe --match $(NAME)\* 2> /dev/null`; \
  if [ $$? -eq 0 ]; then \
    printf %s "$$TAGNAME" | sed -E 's/$(NAME)-(.*)/\1/'; \
  else \
    printf '?'; \
  fi)

LATEXPARAM := -jobname $(NAME) -output-directory $(DESTDIR) \
              "\def\VERSION{$(VERSION)} \def\DATE{$(DATE)} \input{$(MAIN)}"


all: $(OUTPUT)
.PHONY: all

$(OUTPUT)
	@rm -f *.aux *.bbl *.blg
	$(LATEX) $(LATEXPARAM)
	@if [[ ( -f $(NAME).aux ) && ( `grep citation $(NAME).aux | wc -l` -ge 1 ) ]]; then \
	  bibtex $(NAME); \
	fi
	$(LATEX) $(LATEXPARAM)
	$(LATEX) $(LATEXPARAM)
	@if [ -f $(NAME).log ] && grep undefined\ references $(NAME).log ; then \
	  for XREF in $(XREFS); do \
	    echo '\033[33mRecompiling XREF ' $$XREF; \
	    make -C $$XREF; \
	    echo '\033[39m'; \
	  done; \
	  $(LATEX) $(LATEXPARAM); \
	else \
	  echo '\033[32mXRefs are satisfied\033[39m'; \
	fi

view:	$(OUTPUT)
	@$(PDF_READER) $(DESTDIR)/$(NAME).pdf &
.PHONY: view

clean:
	rm -f $(DESTDIR)/$(NAME).aux $(DESTDIR)/$(NAME).bbl
	rm -f $(DESTDIR)/$(NAME).blg $(DESTDIR)/$(NAME).dvi
	rm -f $(DESTDIR)/$(NAME).log $(DESTDIR)/$(NAME).toc 
	rm -f $(DESTDIR)/$(NAME).fls $(DESTDIR)/$(NAME).lof
	rm -f $(DESTDIR)/$(NAME).idx $(DESTDIR)/$(NAME).loa 
	rm -f $(DESTDIR)/$(NAME).lot $(DESTDIR)/$(NAME).lolisting 
	rm -f $(DESTDIR)/$(NAME).synctex.gz $(DESTDIR)/$(NAME).nav
	rm -f $(DESTDIR)/$(NAME).out $(DESTDIR)/$(NAME).snm
	rm -f $(DESTDIR)/$(NAME).pdf
.PHONY: clean

