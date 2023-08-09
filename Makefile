DOCKERIMG=texlive
DOCKERCMD=podman run --permissive -v "$(PWD)":/usr/src/project -w /usr/src/project $(DOCKERIMG)
LATEXC=latexmk --pdf
TEXFILE=main.tex
#LATEXC=tectonic

docker:
	podman build -t $(DOCKERIMG) .

pdf:
	$(DOCKERCMD) $(LATEXC) 

no-notes:
	$(DOCKERCMD) $(LATEXC) -jobname=no-notes $(TEXFILE)
	

clear:
	$(DOCKERCMD) $(LATEXC) -C
