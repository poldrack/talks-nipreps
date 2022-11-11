VERSION = "NiPreps_BRAIN_Nov2022"


all: render pdf

render-talk:
	-rm -rf docs/talk/*
	cd talk && quarto render NiPreps.qmd
	# fix quarto bug
	# need to use sed inline mode
	sed -i.bak 's-LICENSE-NiPreps-' docs/talk/index.html
	git commit -a -m"updating changed files"
	git push origin main

render-site:
	quarto render 
pdf:
	-mkdir docs/pdfs
	decktape reveal docs/talk/NiPreps.html docs/pdfs/$(VERSION).pdf
	git add docs/pdfs/$(VERSION).pdf
	git commit -m"adding pdf [skip ci]"
	git push origin main

