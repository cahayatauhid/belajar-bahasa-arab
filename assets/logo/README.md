---
title: "Logo Cahaya Tauhid"
lang: id
---

# Logo Cahaya Tauhid

Aset logo penerbit **Cahaya Tauhid**. Untuk dipakai di textbook, workbook, slide, frontpage GitHub Pages, dan keperluan lain yang membutuhkan branding penerbit.

## Daftar File

### Master / Sumber

File editable untuk modifikasi atau ekspor ke format baru.

| File                       | Format                | Ukuran    | Keterangan                                    |
|----------------------------|-----------------------|-----------|-----------------------------------------------|
| `sumber/cahaya-tauhid.ai`  | Adobe Illustrator     | 1.4 MB    | Master vektor (PDF 1.6 internally)            |
| `sumber/cahaya-tauhid.pdf` | PDF                   | 668 KB    | Master PDF (alternatif untuk Illustrator)     |

### Varian Siap Pakai

| File                                    | Format | Resolusi    | Latar       | Pemakaian                              |
|-----------------------------------------|--------|-------------|-------------|----------------------------------------|
| `cahaya-tauhid.svg`                     | SVG    | vektor      | Transparan  | **Default untuk web** --- scale lossless, file kecil |
| `cahaya-tauhid-warna-transparan.png`    | PNG    | 4167×4167   | Transparan  | Web bitmap fallback, presentasi         |
| `cahaya-tauhid-warna.png`               | PNG    | 4167×4167   | Solid       | PowerPoint, dokumen dengan latar putih |
| `cahaya-tauhid-warna.jpg`               | JPG    | 4167×4167   | Solid       | Print, sosial media                    |
| `cahaya-tauhid-monokrom.jpg`            | JPG    | 4167×4167   | Solid       | Print hitam putih, fotokopi            |

SVG di-generate dari `sumber/cahaya-tauhid.pdf` lewat `pdf2svg`. Untuk regenerasi: `pdf2svg sumber/cahaya-tauhid.pdf cahaya-tauhid.svg`.

### Watermark

| File                              | Format | Resolusi    | Pemakaian                                 |
|-----------------------------------|--------|-------------|-------------------------------------------|
| `cahaya-tauhid-watermark.png`     | PNG    | 1500×1500   | Watermark semi-transparan (alpha 6%) di setiap halaman PDF textbook/workbook |

Watermark di-generate dari `cahaya-tauhid-warna-transparan.png` dengan alpha dikalikan 0.06 via Pillow. Untuk regenerasi:

```bash
python3 -m venv /tmp/venv-pillow
/tmp/venv-pillow/bin/pip install Pillow
/tmp/venv-pillow/bin/python -c "
from PIL import Image
img = Image.open('assets/logo/cahaya-tauhid-warna-transparan.png').convert('RGBA')
a = img.split()[3]
a = a.point(lambda x: int(x*0.06))
img.putalpha(a)
img.thumbnail((1500,1500))
img.save('assets/logo/cahaya-tauhid-watermark.png')
"
```

## Color Palette

Diadopsi dari logo:

| Warna  | Hex       | RGB                  | Pemakaian                              |
|--------|-----------|----------------------|----------------------------------------|
| Navy   | `#203543` | `rgb(32, 53, 67)`    | Heading, border, accent gelap          |
| Gold   | `#D18C1C` | `rgb(209, 140, 28)`  | Highlight, separator, accent terang    |

Palette ini dipakai konsisten di seluruh produk (textbook PDF, workbook PDF, slide HTML, frontpage GitHub Pages).

## Konvensi Penamaan

- Lowercase, hyphen-separated
- Prefix `cahaya-tauhid-` (brand)
- Varian setelah brand: `warna` / `monokrom` / `transparan`
- Format gambar (`.png`/`.jpg`) di akhir
- File master di subfolder `sumber/`

## Lisensi

Logo ini adalah aset milik **Cahaya Tauhid**. Dipakai secara internal untuk paket pembelajaran. Tidak termasuk dalam lisensi CC BY-SA 4.0 yang berlaku untuk konten pembelajaran (textbook/workbook/slides) --- logo dipakai di bawah hak cipta penerbit.
