.PHONY: textbook workbook slides docker-image test clean all

DOCKER_IMG = cahaya-tauhid-build
DOCKER_RUN = docker run --rm -v "$(CURDIR):/data" $(DOCKER_IMG)

PANDOC_FLAGS = \
	--pdf-engine=xelatex \
	--include-in-header=_build/header.tex \
	-V papersize=b5 \
	-V geometry:margin=2cm \
	-V mainfont="TeX Gyre Pagella" \
	-V lang=id

TEXTBOOK_SRCS = $(wildcard textbook/pelajaran-*/index.md)
TEXTBOOK_PDFS = $(TEXTBOOK_SRCS:.md=.pdf)

WORKBOOK_SRCS = $(wildcard workbook/pelajaran-*/index.md)
WORKBOOK_PDFS = $(WORKBOOK_SRCS:.md=.pdf)

textbook: $(TEXTBOOK_PDFS)

workbook: $(WORKBOOK_PDFS)

textbook/%/index.pdf: textbook/%/index.md _build/header.tex
	$(DOCKER_RUN) pandoc $(PANDOC_FLAGS) $< -o $@

workbook/%/index.pdf: workbook/%/index.md _build/header.tex
	$(DOCKER_RUN) pandoc $(PANDOC_FLAGS) $< -o $@

slides:
	@echo "Slides are HTML — open slides/pelajaran-NN/index.html in a browser"

docker-image:
	docker build -t $(DOCKER_IMG) .

test: docker-image textbook/pelajaran-01/index.pdf
	@echo "Test build complete: textbook/pelajaran-01/index.pdf"

clean:
	find textbook -name "*.pdf" -delete 2>/dev/null || true
	find workbook -name "*.pdf" -delete 2>/dev/null || true

all: docker-image textbook workbook
