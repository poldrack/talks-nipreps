VERSION = "NiPreps_BRAIN_Nov2022"


all: render pdf

render:
	quarto render NiPreps.qmd
	git commit -a -m"updating changed files"
	git push origin main

pdf:
	-mkdir pdfs
	decktape reveal docs/NiPreps.html pdfs/$(VERSION).pdf
	git add pdfs/$(VERSION).pdf
	git commit -m"adding pdf [skip ci]"
	git push origin main

