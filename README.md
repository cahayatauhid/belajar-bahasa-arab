# Belajar Bahasa Arab — Cahaya Tauhid

Paket pembelajaran bahasa Arab klasik berjenjang untuk Muslim Indonesia dewasa, fokus pada pemahaman Al-Qur'an, hadits, dan kitab klasik.

Diterbitkan oleh **Cahaya Tauhid** dengan lisensi [Creative Commons Attribution-ShareAlike 4.0 International (CC BY-SA 4.0)](LICENSE).

## Audiens

Bapak/ibu profesional Indonesia, dewasa, Muslim, tanpa background pesantren atau studi Islam formal. Asumsi: bisa baca Al-Qur'an dengan tajwid, belum bisa memisahkan kata per kata.

## Backbone Matn Klasik

Lima matn klasik sebagai referensi utama pelajaran:

- **Nahwu**: *Al-Jurumiyyah* (Ibn Ajurrum, w. 723H) untuk Level 1–2; *Qotrun Nada* (Ibn Hisyam, w. 761H) untuk Level 3–4
- **Shorf**: *Tashrif al-'Izzi* (Az-Zinjani, w. 655H) untuk Level 1–2; *Lamiyyah al-Af'al* (Ibn Malik, w. 672H) untuk Level 3–4
- **Capstone**: *Alfiyah Ibn Malik* (Ibn Malik, w. 672H) untuk Level 5 (mahir, opsional)

## Komponen per Pelajaran

- `textbook/pelajaran-NN/` — buku teks (markdown → PDF B5 via pandoc + xelatex)
- `workbook/pelajaran-NN/` — buku latihan PR (markdown → PDF B5)
- `slides/pelajaran-NN/` — slide presentasi pengajar (HTML + vanilla CSS/JS)
- `audio/` — placeholder; rekaman ceramah ulama dari YouTube ditambah pada level lanjutan

## Desain dan Silabus

- [`docs/desain-kurikulum.md`](docs/desain-kurikulum.md) — audiens, prasyarat, prinsip pedagogis, roadmap 5 level dengan tujuan utama dan klaim capaian per level
- [`docs/silabus.md`](docs/silabus.md) — silabus per sesi untuk Level 1–5 (~213 sesi total, 1x per minggu, 90 menit per sesi)
- [`docs/logo-prompts.md`](docs/logo-prompts.md) — prompt logo untuk Nano Banana

## Build

Prasyarat: Docker.

```bash
# Build image (one-time setup)
docker build -t cahaya-tauhid-build .

# Render satu pelajaran textbook
make textbook/pelajaran-01/index.pdf

# Render semua textbook / workbook
make textbook
make workbook

# Bersihkan PDF generated
make clean
```

Slide langsung dibuka di browser:

```bash
open slides/pelajaran-01/index.html
```

Navigasi slide: arrow keys, PageUp/PageDown, atau tombol next/prev.

## Status

Paket Level 1 (Pondasi: Peta Gramatikal Lengkap) sedang dalam tahap drafting. Pelajaran 1 (Mengapa Belajar Bahasa Arab) sebagai sample dan template untuk pelajaran berikutnya.

## Struktur Repo

```
.
├── CLAUDE.md                    instruksi untuk Claude Code
├── Dockerfile                   build environment (debian + texlive + Amiri Quran)
├── Makefile                     build commands
├── _build/header.tex            LaTeX preamble (font, command \ayat / \hadits / \ar)
├── docs/                        desain kurikulum, silabus, prompt logo
├── textbook/pelajaran-NN/       sumber buku teks (markdown)
├── workbook/pelajaran-NN/       sumber buku latihan (markdown)
├── slides/_template/            shared CSS dan JS untuk slide
├── slides/pelajaran-NN/         slide HTML per pelajaran
└── audio/                       placeholder untuk rekaman ceramah
```
