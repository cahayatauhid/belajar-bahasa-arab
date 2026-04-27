.PHONY: textbook workbook slides docs docker-image test clean all level-1 level-1-textbook level-1-workbook

DOCKER_IMG = cahaya-tauhid-build
DOCKER_RUN = docker run --rm -v "$(CURDIR):/data" $(DOCKER_IMG)

PANDOC_FLAGS = \
	--pdf-engine=xelatex \
	--include-in-header=_build/header.tex \
	-V papersize=b5 \
	-V geometry:margin=2cm \
	-V mainfont="TeX Gyre Pagella" \
	-V lang=id

# Per-pelajaran preview build (artikel)
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

# Buku komplit per level (book class, dengan ToC dan chapter)
LEVEL1_TEXTBOOK_SRCS := $(sort $(wildcard textbook/pelajaran-*/index.md))
LEVEL1_WORKBOOK_SRCS := $(sort $(wildcard workbook/pelajaran-*/index.md))

level-1-textbook: textbook/level-1.pdf
level-1-workbook: workbook/level-1.pdf
level-1: level-1-textbook

textbook/level-1.pdf: $(LEVEL1_TEXTBOOK_SRCS) _build/header.tex _build/level-1-frontmatter.md _build/level-1-references.md
	@mkdir -p _build/cache
	@cat _build/level-1-frontmatter.md > _build/cache/level-1-textbook.md
	@for f in $(LEVEL1_TEXTBOOK_SRCS); do \
		echo "" >> _build/cache/level-1-textbook.md; \
		awk 'state==0 && /^---$$/ {state=1; next} state==1 && /^---$$/ {state=2; next} state==1 {next} {print}' $$f >> _build/cache/level-1-textbook.md; \
		echo "" >> _build/cache/level-1-textbook.md; \
	done
	@cat _build/level-1-references.md >> _build/cache/level-1-textbook.md
	$(DOCKER_RUN) pandoc \
		--pdf-engine=xelatex \
		--include-in-header=_build/header.tex \
		--toc \
		_build/cache/level-1-textbook.md \
		-o $@

workbook/level-1.pdf: $(LEVEL1_WORKBOOK_SRCS) _build/header.tex _build/level-1-frontmatter.md _build/level-1-references.md
	@mkdir -p _build/cache
	@cat _build/level-1-frontmatter.md > _build/cache/level-1-workbook.md
	@for f in $(LEVEL1_WORKBOOK_SRCS); do \
		echo "" >> _build/cache/level-1-workbook.md; \
		awk 'state==0 && /^---$$/ {state=1; next} state==1 && /^---$$/ {state=2; next} state==1 {next} {print}' $$f >> _build/cache/level-1-workbook.md; \
		echo "" >> _build/cache/level-1-workbook.md; \
	done
	@cat _build/level-1-references.md >> _build/cache/level-1-workbook.md
	$(DOCKER_RUN) pandoc \
		--pdf-engine=xelatex \
		--include-in-header=_build/header.tex \
		--toc \
		_build/cache/level-1-workbook.md \
		-o $@

# Docs PDFs (desain kurikulum, silabus) -- A4, article
DOCS_PDFS = docs/desain-kurikulum.pdf docs/silabus.pdf

docs: $(DOCS_PDFS)

DOCS_PANDOC_FLAGS = \
	--pdf-engine=xelatex \
	--include-in-header=_build/header.tex \
	--toc --toc-depth=2 \
	-V papersize=a4 \
	-V geometry:margin=2.5cm \
	-V mainfont="TeX Gyre Pagella" \
	-V lang=id \
	-V documentclass=article \
	-V numbersections=true \
	-V toc-title="Daftar Isi"

docs/desain-kurikulum.pdf: docs/desain-kurikulum.md _build/header.tex
	$(DOCKER_RUN) pandoc $(DOCS_PANDOC_FLAGS) \
		--metadata=title:"Desain Kurikulum" \
		--metadata=subtitle:"Belajar Bahasa Arab --- Cahaya Tauhid" \
		--metadata=author:"Cahaya Tauhid" \
		$< -o $@

docs/silabus.pdf: docs/silabus.md _build/header.tex
	$(DOCKER_RUN) pandoc $(DOCS_PANDOC_FLAGS) \
		--metadata=title:"Silabus Lengkap" \
		--metadata=subtitle:"Belajar Bahasa Arab Level 1--5 --- Cahaya Tauhid" \
		--metadata=author:"Cahaya Tauhid" \
		$< -o $@

clean:
	find textbook -name "*.pdf" -delete 2>/dev/null || true
	find workbook -name "*.pdf" -delete 2>/dev/null || true
	find docs -name "*.pdf" -delete 2>/dev/null || true
	rm -rf _build/cache

all: docker-image textbook workbook docs
