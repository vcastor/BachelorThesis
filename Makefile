#Makefile de la tesis del Bachelor

TEX=$(wildcard *.tex */*.tex bibl/*.bib)
PYPLOT=$(wildcard 3/img/*py 4/graf/*py 4/plots/img/*py)
MAIN=tesis.tex
LATEX=pdflatex
PYTHON=python3

all: plots tex

plots:                            ## Build python plots
	$(PYTHON) $(PYPLOT)

tex:                              ## Build tex thesis (LaTeX)
	$(LATEX) $(MAIN)                # main run
	bibtex $(MAIN:.tex=)            # bibliography
	#makeglossaries $(MAIN:.tex=)   # list of abbreviations, nomenclature
	$(LATEX) $(MAIN)
	$(LATEX) $(MAIN)

clean:
	@rm -rf */*.aux *.aux *.bbl *.blg *.glg *.glo *.gls *.ist *.log *.not *.ntt *.out *.sbl *.sym *.tld *.toc
