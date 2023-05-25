
default:
	rm -rf build
	mkdir build

	# adding nema latex package
	cp ../../../code-extensions/nema-latex-package/src/nema.sty build/nema.sty

	# adding nema-latex-cli executable
	cp ../../../code-extensions/nema-latex-cli/executables/nema-latex-cli-linux-arm64 build/nema-latex-cli

	docker build -t nema-flp-latex:latest  .

linux:
	rm -rf build
	mkdir build
	
	# adding nema latex package
	cp ../../../code-extensions/nema-latex-package/src/nema.sty build/nema.sty

	# adding nema-latex-cli executable
	cp ../../../code-extensions/nema-latex-cli/executables/nema-latex-cli-linux-amd64 build/nema-latex-cli

	docker buildx build --platform=linux/amd64 -t nema-flp-latex-linux .