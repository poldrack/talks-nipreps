VERSION = "NiPreps_BRAIN_Nov2022"


all: render pdf

render:
	quarto render NiPreps.qmd
	# fix quarto bug
	cat docs/talk/index.html| sed 's-LICENSE-talk/NiPreps-' > docs/talk/index.html
	git commit -a -m"updating changed files"
	git push origin main


pdf:
	-mkdir docs/pdfs
	decktape reveal docs/talk/NiPreps.html docs/pdfs/$(VERSION).pdf
	git add docs/pdfs/$(VERSION).pdf
	git commit -m"adding pdf [skip ci]"
	git push origin main

