all:
	asciidoctor-pdf -D hasil/ -a pdf-themesdir=sumber-daya/tema -a pdf-theme=neo-x -r asciidoctor-diagram,asciidoctor-lists judul-buku.adoc

view:
	mupdf hasil/judul-buku.pdf
