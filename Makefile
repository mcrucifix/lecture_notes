JOBNAME = lecture_notes

${JOBNAME}.pdf : ${JOBNAME}.tex
	latexmk -e '$$pdflatex=q/pdflatex %O -shell-escape %S/' -pdf

#pdf : lecture_notes.tex Xp/figure15.xp
#	pdflatex lecture_notes.tex

%.pdf: $(JOBNAME).tex %.tex 
	pdflatex -jobname $(basename $@)  "\includeonly{$(basename $@)} \input{$(JOBNAME).tex}" 

all: ${JOBNAME}.pdf
