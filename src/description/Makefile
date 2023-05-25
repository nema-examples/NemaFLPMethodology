MAIN = main

default:
	pdflatex $(MAIN).tex

all:
	pdflatex $(MAIN).tex
	nema-latex-cli pull -j $(MAIN)
	bibtex $(MAIN)
	pdflatex $(MAIN).tex
	pdflatex $(MAIN).tex

push:
	nema-latex-cli push -j $(MAIN)
