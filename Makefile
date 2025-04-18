# partly autogenerated, that's why it's so ugly!

# say 'make V=1' to see the full build output
ifndef V
Q = @
Q_LATEX = sh -c 'echo -e "   " `echo $$(basename "$$0") | tr a-z A-Z`"\t$${!\#/..\/..\//}"; ! "$$0" "$$@" | grep -A5 -E "^[^ ]+:[0-9]+:"'
Q_OTHER = sh -c 'echo -e "   " `echo $$(basename "$$0") | tr a-z A-Z`"\t$${!\#/..\/..\//}"; "$$0" "$$@" >/dev/null'
endif

LATEX = latex
PDFLATEX = pdflatex
BIBTEX = bibtex
DVIPS = dvips
DVIPDF = dvipdf
PDFTOEPS = pdftops -eps
PDFTOPS = pdf2ps
EPSTOPDF = epstopdf
FIGTODEV = fig2dev
MPOST = mpost
COMPILE_WITH_FINAL_FLAG = "\def\thesisfinal{}\input{../../thesis}"

.PHONY: all clean archive

all:  thesis

texfiles = $(wildcard *.tex) $(wildcard **/*.tex)

.PHONY: thesis
thesis: thesis.pdf

thesis.pdf: $(texfiles) thesis.bbl
	$(Q) rm -rf build/pdf/; mkdir -p build/pdf/
	$(Q) cd build/pdf/ && TEXINPUTS="../../:$$TEXINPUTS" $(Q_LATEX) $(PDFLATEX) -interaction=nonstopmode -file-line-error ../../thesis.tex
	$(Q) cd build/pdf/ && TEXINPUTS="../../:$$TEXINPUTS" $(Q_LATEX) $(PDFLATEX) -interaction=nonstopmode -file-line-error ../../thesis.tex
	$(Q) ln -f build/pdf/thesis.pdf thesis.pdf

thesis.bbl: thesis.aux
	$(Q)$(Q_OTHER) $(BIBTEX) thesis
	-$(Q) $(Q_LATEX) $(LATEX) -interaction=nonstopmode -file-line-error thesis.tex

thesis.aux: $(texfiles)
	-$(Q) $(Q_LATEX) $(LATEX) -interaction=nonstopmode -file-line-error thesis.tex


final: $(texfiles) thesis.bbl
	$(Q) rm -rf build/pdf/; mkdir -p build/pdf/
	$(Q) cd build/pdf/ && TEXINPUTS="../../:$$TEXINPUTS" $(Q_LATEX) $(PDFLATEX) -interaction=nonstopmode -file-line-error $(COMPILE_WITH_FINAL_FLAG)
	$(Q) cd build/pdf/ && TEXINPUTS="../../:$$TEXINPUTS" $(Q_LATEX) $(PDFLATEX) -interaction=nonstopmode -file-line-error $(COMPILE_WITH_FINAL_FLAG)
	$(Q) ln -f build/pdf/thesis.pdf thesis.pdf

clean:
	rm -rf build/
	rm -f *.aux
	rm -f thesis.dvi thesis.idx thesis.ind thesis.ilg thesis.out thesis.toc thesis.pdf thesis.log

archive: thesis-template.zip

thesis-template.zip: **.tex Makefile **/ETHlogo.* refs.bib
	mkdir -p thesis
	cp `git ls-files "**.tex" Makefile "**/ETHlogo.*" refs.bib` thesis/
	perl -i -pe 's/\$$VERSION\$$/'"$$(git describe)/" thesis/*.tex
	rm -f thesis-template.zip
	zip -r thesis-template.zip thesis/
