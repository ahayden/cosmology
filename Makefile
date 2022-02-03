.PHONY = all clean

TEX = docker compose run texbox

IN := $(wildcard *.tex)
OUT := $(SRCS:%.tex=%.pdf)

all: ${OUT}

%.pdf: %.tex
	${TEX} $(basename $< .tex)

clean:
	rm -rvf *.log *.aux *.bbl *.blg *.run.xml *.bcf *.out ${OUT}

distclean: clean
	rm -rvf *.pdf
