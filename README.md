# Belajar Bahasa Arab — Cahaya Tauhid

Paket pembelajaran bahasa Arab klasik berjenjang untuk Muslim Indonesia dewasa, fokus pada pemahaman Al-Qur'an, hadits, dan kitab klasik.

Diterbitkan oleh **Cahaya Tauhid** dengan lisensi [Creative Commons Attribution-ShareAlike 4.0 International (CC BY-SA 4.0)](LICENSE).

🌐 **Site online**: <https://cahayatauhid.github.io/belajar-bahasa-arab/> — slide presentasi, textbook PDF, dan workbook PDF dapat diunduh per-pelajaran.

## Audiens

Bapak/ibu profesional Indonesia, dewasa, Muslim, tanpa background pesantren atau studi Islam formal. Asumsi: bisa baca Al-Qur'an dengan tajwid, belum bisa memisahkan kata per kata.

## Backbone Matn Klasik

Lima matn klasik sebagai referensi utama pelajaran:

- **Nahwu**: *Al-Jurumiyyah* (Ibn Ajurrum, w. 723H) untuk Level 1–2; *Qotrun Nada* (Ibn Hisyam, w. 761H) untuk Level 3–4
- **Shorf**: *Tashrif al-'Izzi* (Az-Zinjani, w. 655H) untuk Level 1–2; *Lamiyyah al-Af'al* (Ibn Malik, w. 672H) untuk Level 3–4
- **Capstone**: *Alfiyah Ibn Malik* (Ibn Malik, w. 672H) untuk Level 5 (mahir, opsional)

## Komponen per Pelajaran

- `textbook/pelajaran-NN/` — buku teks (markdown → PDF B5 via pandoc + xelatex)
- `workbook/pelajaran-NN/` — panduan praktik kesadaran selama ibadah/aktivitas rutin (markdown → PDF B5)
- `slides/pelajaran-NN/` — slide presentasi pengajar (HTML + vanilla CSS/JS)
- `audio/` — placeholder; rekaman ceramah ulama dari YouTube ditambah pada level lanjutan

## Status Level 1 (Pondasi: Peta Gramatikal Lengkap)

Level 1 (Pelajaran 1–34) sudah dirilis lengkap — textbook, workbook, dan slide tersedia untuk seluruh 34 pelajaran. Level 2–5 dalam tahap perencanaan (silabus sudah ditulis, konten belum di-draft).

## Desain dan Silabus

- [`docs/desain-kurikulum.md`](docs/desain-kurikulum.md) — audiens, prasyarat, prinsip pedagogis, roadmap 5 level, pemetaan matn ke pelajaran, pemetaan format workbook
- [`docs/silabus.md`](docs/silabus.md) — silabus per sesi untuk Level 1–5 (~213 sesi total, 1× per minggu, 90 menit per sesi)

## Branding

Logo Cahaya Tauhid dan palette warna tersimpan di `assets/logo/`. Logo dipakai di seluruh produk: cover textbook/workbook, watermark setiap halaman PDF, header frontpage GitHub Pages, dan title slide tiap pelajaran.

- Palette: navy `#203543` + gold `#D18C1C` (diadopsi dari logo)
- Detail varian (color/monokrom/transparan/SVG) + lisensi: [`assets/logo/README.md`](assets/logo/README.md)

## Build

Prasyarat: Docker.

```bash
# Build image (one-time setup)
docker build -t cahaya-tauhid-build .

# Render satu pelajaran textbook / workbook
make textbook/pelajaran-01/index.pdf
make workbook/pelajaran-01/index.pdf

# Render semua textbook / workbook
make textbook
make workbook

# Render combined Level 1 PDF (cover + lisensi + 34 pelajaran sebagai chapter)
make level-1-textbook
make level-1-workbook

# Render docs PDF (cover + lisensi + TOC + konten)
make docs

# Bersihkan PDF generated
make clean
```

Slide langsung dibuka di browser, baik secara lokal maupun via GitHub Pages:

```bash
# lokal
open slides/pelajaran-01/index.html

# online
open https://cahayatauhid.github.io/belajar-bahasa-arab/pelajaran-01/
```

Navigasi slide: arrow keys (←/→), spasi, PageUp/PageDown, atau tombol next/prev. Slide auto-redeploy ke GitHub Pages setiap kali ada perubahan di `slides/**` atau `assets/**` di branch `main`.

## Struktur Repo

```
.
├── CLAUDE.md                         instruksi untuk Claude Code
├── Dockerfile                        build environment (debian + texlive + Amiri Quran + Pillow)
├── Makefile                          build commands
├── _build/header.tex                 LaTeX preamble (font, palette, watermark, \ayat \hadits \ar)
├── _build/level-1-frontmatter.md     cover + lisensi untuk textbook/level-1.pdf gabungan
├── _build/level-1-references.md      back-matter referensi untuk level-1.pdf
├── _build/desain-kurikulum-frontmatter.md  cover + lisensi untuk docs/desain-kurikulum.pdf
├── _build/silabus-frontmatter.md     cover + lisensi untuk docs/silabus.pdf
├── assets/logo/                      master logo (AI/PDF) + varian (PNG/JPG/SVG) + watermark
├── docs/                             desain kurikulum + silabus
├── textbook/pelajaran-NN/            sumber buku teks (markdown)
├── textbook/level-1.pdf              gabungan 34 pelajaran sebagai chapter
├── workbook/pelajaran-NN/            sumber panduan praktik (markdown)
├── workbook/level-1.pdf              gabungan 34 panduan praktik
├── slides/_template/                 shared CSS dan JS untuk slide
├── slides/pelajaran-NN/              slide HTML per pelajaran
├── slides/index.html                 frontpage GitHub Pages
├── slides/logo.svg                   copy logo untuk akses dari frontpage/template
├── audio/                            placeholder untuk rekaman ceramah
└── .github/workflows/pages.yml       auto-deploy ke GitHub Pages
```
