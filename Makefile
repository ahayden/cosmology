.PHONY = all clean

TEX = docker compose run texbox

SPELLCHECK = docker compose run spellcheck

IN := $(wildcard *.tex)
OUT := $(SRCS:%.tex=%.pdf)

all: ${OUT}

%.pdf: %.tex
	${SPELLCHECK} $<
	${TEX} $(basename $< .tex)

clean:
	rm -rvf *.log *.aux *.bbl *.blg *.run.xml *.bcf *.out ${OUT}

distclean: clean
	rm -rvf *.pdf
