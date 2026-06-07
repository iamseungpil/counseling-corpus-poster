.PHONY: main clean FORCE

main: poster.pdf

poster.pdf: FORCE
	latexmk -pdfxe -xelatex='xelatex -interaction nonstopmode' poster.tex

clean:
	latexmk -C
