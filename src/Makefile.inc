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
  TAGNAME=`git describe --match $(NAME)\* 2> /dev/null`; \
  if [ $$? -eq 0 ]; then \
    printf %s "$$TAGNAME" | sed -E 's/$(NAME)-(.*)/\1/'; \
  else \
    printf '?'; \
  fi)

LATEXPARAM := -jobname $(NAME) \
              "\def\VERSION{$(VERSION)} \def\DATE{$(DATE)} \input{$(MAIN)}"


.PHONY: all
all: $(OUTPUT)

.PHONY: $(OUTPUT)
$(OUTPUT):
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
	mv -f $(NAME).pdf $(OUTPUT)

.PHONY: view
view:	$(OUTPUT)
	@$(PDF_READER) $(OUTPUT) &

.PHONY: clean
clean:
	rm -f $(NAME).aux $(NAME).bbl $(NAME).blg $(NAME).dvi
	rm -f $(NAME).log $(NAME).toc $(NAME).fls $(NAME).lof
	rm -f $(NAME).idx $(NAME).loa $(NAME).lot $(NAME).lolisting 
	rm -f $(NAME).synctex.gz $(NAME).nav $(NAME).out $(NAME).snm
	rm -f $(OUTPUT)


