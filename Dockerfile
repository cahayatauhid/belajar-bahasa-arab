FROM debian:bookworm-slim

# Install pandoc, xelatex, polyglossia (untuk multi-bahasa termasuk Arab),
# fontspec, dan font Amiri (Naskh klasik untuk typography Arab)
RUN apt-get update && apt-get install -y --no-install-recommends \
        pandoc \
        texlive-xetex \
        texlive-fonts-recommended \
        texlive-fonts-extra \
        texlive-lang-other \
        texlive-lang-arabic \
        texlive-latex-extra \
        texlive-plain-generic \
        lmodern \
        fonts-texgyre \
        fonts-hosny-amiri \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /data
ENTRYPOINT []
