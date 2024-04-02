JOBNAME = LENVI2005

${JOBNAME}.pdf : ${JOBNAME}.tex
	latexmk -e '$$pdflatex=q/pdflatex %O -shell-escape %S/' -pdf

#pdf : LENVI2005.tex Xp/figure15.xp
#	pdflatex LENVI2005.tex

%.pdf: $(JOBNAME).tex %.tex 
	pdflatex -jobname $(basename $@)  "\includeonly{$(basename $@)} \input{$(JOBNAME).tex}" 

all: ${JOBNAME}.pdf
