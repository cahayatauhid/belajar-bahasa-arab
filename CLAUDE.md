# CLAUDE.md — Belajar Bahasa Arab (Cahaya Tauhid)

Instruksi untuk Claude Code saat bekerja di repo ini. Baca dulu sebelum melakukan perubahan.

## Project Overview

Paket pembelajaran bahasa Arab klasik berjenjang (Level 1–5) untuk Muslim Indonesia dewasa tanpa background pesantren. Tiga deliverable per pelajaran:

- **Textbook** — markdown → PDF B5 (pandoc + xelatex via Docker)
- **Workbook** — markdown → PDF B5 (pipeline sama)
- **Slides** — HTML + vanilla CSS/JS (no framework)

Penerbit: **Cahaya Tauhid**. Lisensi: **CC BY-SA 4.0**.

## Audience dan Tone

Pengajar dan peserta tidak punya background software engineering. Asumsi English peserta: SMA, dipelajari puluhan tahun lalu.

**Hindari dev jargon** dalam semua materi peserta:

| Hindari            | Pakai                                       |
|--------------------|---------------------------------------------|
| parse, parsing     | i'rab, menganalisa kalimat                  |
| exception          | perkecualian, kasus khusus                  |
| scaffolding        | bertahap, berjenjang                        |
| flowchart          | bagan                                       |
| output, outcome    | hasil, pencapaian                           |
| milestone          | klaim capaian, tonggak                      |
| objective          | tujuan utama                                |
| framework          | kerangka                                    |

**Hindari istilah grammar Inggris teknis** (inflection, accusative, circumstantial accusative, specifier, possessive construct). Pakai analogi konkret dengan contoh dalam Bahasa Indonesia.

Tone teknis dan dewasa, bukan kanak-kanak. Tetap accessible.

## Backbone Matn Klasik

| Sisi     | Matn                  | Penulis                  | Posisi          |
|----------|-----------------------|--------------------------|-----------------|
| Nahwu    | Al-Jurumiyyah         | Ibn Ajurrum (w. 723H)    | Level 1–2       |
| Nahwu    | Qotrun Nada           | Ibn Hisyam (w. 761H)     | Level 3–4       |
| Shorf    | Tashrif al-'Izzi      | Az-Zinjani (w. 655H)     | Level 1–2       |
| Shorf    | Lamiyyah al-Af'al     | Ibn Malik (w. 672H)      | Level 3–4       |
| Capstone | Alfiyah Ibn Malik     | Ibn Malik (w. 672H)      | Level 5 (mahir) |

Detail desain dan silabus: `docs/desain-kurikulum.md` dan `docs/silabus.md`.

## Konvensi

### Folder Layout

```
textbook/pelajaran-NN/index.md      → render ke index.pdf via Makefile
workbook/pelajaran-NN/index.md      → render ke index.pdf via Makefile
slides/pelajaran-NN/index.html      → buka di browser, pakai _template/
slides/_template/                    → style.css + script.js (shared)
slides/logo.svg                      → copy logo untuk akses dari frontpage/template
audio/                               → ceramah YouTube clips (ditambah belakangan)
assets/logo/                         → master logo Cahaya Tauhid + varian (warna/monokrom/transparan/SVG)
assets/logo/sumber/                  → file editable (.ai, .pdf master)
assets/logo/cahaya-tauhid-watermark.png → PNG alpha 6% untuk watermark PDF
docs/                                → desain kurikulum, silabus
_build/header.tex                    → LaTeX preamble (font, color palette, watermark, \ayat \hadits \ar, titling untuk per-pelajaran)
_build/level-1-frontmatter.md        → frontmatter cover + lisensi untuk level-1.pdf gabungan
_build/desain-kurikulum-frontmatter.md → frontmatter cover + lisensi untuk docs/desain-kurikulum.pdf
_build/silabus-frontmatter.md        → frontmatter cover + lisensi untuk docs/silabus.pdf
```

### Markdown Conventions

- YAML frontmatter: `title`, `subtitle`, `lang: id`
- Ayat Al-Qur'an pakai command `\ayat{...}`:

  ```
  \ayat{إِنَّآ أَنزَلْنَٰهُ قُرْءَٰنًا عَرَبِيًّا لَّعَلَّكُمْ تَعْقِلُونَ}
  ```

- Hadits / matan klasik pakai `\hadits{...}`
- Inline Arabic pakai `\ar{...}`

### Arabic Typography

- **Selalu pakai Rasm Utsmani / gaya Mushaf Madinah** untuk ayat Al-Qur'an. Hindari mushaf imla'i atau modern. Cek tanda sukun, dagger alif (ٰ), alif madda (آ → آ atau ـٰ).
- Font: **Amiri Quran** untuk semua Arab dalam paket (tunggal karena keterbatasan babel mixing fonts).
- RTL otomatis via babel `\foreignlanguage{arabic}{...}` (sudah di-wrap di command `\ayat`/`\hadits`/`\ar`).
- Pandoc pakai `babel` (bukan polyglossia) — penting untuk diingat saat tweak preamble.

### Slides

- Pakai vanilla HTML + CSS + JS (no framework, no Reveal.js)
- Template: `slides/_template/style.css` + `script.js`
- Per pelajaran: `slides/pelajaran-NN/index.html` dengan relative path `../_template/...`
- Ayat di slide: `<blockquote lang="ar" class="quran">...</blockquote>` — class `quran` switch ke Amiri Quran via Google Fonts
- Logo Cahaya Tauhid otomatis muncul di title slide (slide pertama) via `.slide:first-child::before` di template CSS

### PDF Cover Page Convention

Dua pola berbeda berdasarkan jenis dokumen:

- **Per-pelajaran textbook/workbook** (B5, pendek 5-15 hal): logo + title inline di atas content page 1. Pakai pandoc default `\maketitle` dengan `titling` package `\pretitle/\posttitle` di `_build/header.tex`. Tidak ada cover page terpisah.
- **Combined / docs** (level-1.pdf, desain-kurikulum.pdf, silabus.pdf): cover page terpisah + lisensi page + TOC + content. Pakai `documentclass: book` + `top-level-division: chapter` di YAML frontmatter `_build/{nama}-frontmatter.md` plus `include-before` LaTeX block manual untuk `\begin{titlepage}...\end{titlepage}`. Pandoc tidak auto-trigger `\maketitle` karena H1 jadi `\chapter`, bukan title.

Watermark logo semi-transparan (alpha 6%, file `assets/logo/cahaya-tauhid-watermark.png`) muncul di setiap halaman semua PDF via `eso-pic` package di `_build/header.tex`.

## Build

Prasyarat: Docker.

```bash
docker build -t cahaya-tauhid-build .       # one-time
make textbook/pelajaran-01/index.pdf        # single
make textbook                                # all textbook
make workbook                                # all workbook
make clean                                   # remove generated PDFs
```

Slide:

```bash
open slides/pelajaran-01/index.html
```

## What Claude Should NOT Do

- Jangan ganti backbone matn klasik tanpa konfirmasi user
- Jangan tambah vocabulary di luar konteks matn klasik dan korpus Quran/hadits/kitab pemula
- Jangan auto-commit; tunggu instruksi eksplisit
- Jangan pakai dev jargon (lihat tabel di atas)
- Jangan ubah palette warna brand (navy `#203543` + gold `#D18C1C`, diadopsi dari logo Cahaya Tauhid di `assets/logo/`)
- Jangan ubah ukuran kertas (B5 untuk per-pelajaran printable, A4 untuk docs)
- Jangan modifikasi `assets/logo/` --- itu aset master dari designer; logo dianggap final
- Workbook bukan "PR" --- istilahnya "panduan praktik kesadaran" untuk ibadah/aktivitas rutin

## Git Workflow

- Tunggu instruksi eksplisit sebelum `git commit`
- Pesan commit dalam Bahasa Indonesia, concise, fokus pada "why" bukan "what"
- Co-author trailer wajib: `Co-Authored-By: Claude Opus 4.7 (1M context) <noreply@anthropic.com>`
- Repo di GitHub: `cahayatauhid/belajar-bahasa-arab` (private)
