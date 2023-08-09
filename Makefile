DOCKERIMG=texlive
DOCKERCMD=podman run --privileged -v "$(PWD)":/usr/src/project -w /usr/src/project $(DOCKERIMG)
LATEXC=latexmk --pdf
TEXFILE=main.tex

docker:
	docker build -t $(DOCKERIMG) .

pdf:
	$(DOCKERCMD) $(LATEXC) $(TEXFILE)

no-notes:
	$(DOCKERCMD) $(LATEXC) -jobname=no-notes $(TEXFILE)
	

clear:
	$(DOCKERCMD) $(LATEXC) -C
