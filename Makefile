VERSION = "NiPreps_BRAIN_Nov2022"

render:
	quarto render NiPreps.qmd

pdf:
	-mkdir pdfs
	decktape reveal docs/NiPreps.html pdfs/$(VERSION).pdf
