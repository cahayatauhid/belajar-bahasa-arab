# Logo Prompts — Cahaya Tauhid

Prompt untuk generate logo mark di Nano Banana (Gemini 2.5 Flash Image). Pendekatan: fokus mark-only — wordmark "Cahaya Tauhid" ditambahkan terpisah di Inkscape/Illustrator setelah mark terpilih, karena image generator sering merender teks dengan rapi.

## Brand Context

- Lembaga: Cahaya Tauhid
- Konteks: paket pembelajaran bahasa Arab klasik untuk Muslim Indonesia dewasa
- Identitas: scholarly, reverent, klasik tapi tidak kuno
- Palette: dark navy blue (#0E2954) dan rich gold (#C9A227)
- Referensi visual: brand mark Gulf luxury yang minimalist (mis. JHODA AM Travel) — single calligraphic gesture vertikal, tanpa frame/medallion/ornamen, dipasangkan dengan Latin wordmark di samping

## Pendekatan Utama: Kaligrafi Minimalist

Style ini paling sesuai dengan identitas Cahaya Tauhid dan paling reliable di AI image gen karena minimal detail = minimal kesempatan AI gagal. Kaligrafi ornate (medallion, illuminated manuscript) cenderung diproduksi AI dengan huruf Arab yang malformed.

### Varian G — Single word minimalist: التوحيد

```
Generate a minimalist contemporary Arabic calligraphic logo mark
featuring the single word "التوحيد" (At-Tauhid). Style: ONE elegant
flowing calligraphic gesture, vertical orientation, modern luxury
brand mark aesthetic inspired by upscale Gulf and Saudi branding (think
premium travel agencies, perfumeries, educational institutions). The
calligraphy should be one continuous, confident, refined stroke —
extremely minimal and clean, NOT an ornate manuscript piece. Color:
rich metallic gold (#C9A227) only, with subtle gradient or sheen for
metallic feel. Background: pure white, completely empty. ABSOLUTELY NO
frame, NO medallion border, NO decorative flourishes, NO background
pattern, NO ornamental flowers or vines, NO Latin text, NO additional
Arabic words. Just the calligraphic mark floating in vast clean
negative space. Composition: vertically oriented, centered, with very
generous empty space around it (the mark occupies only the central 40%
of the frame). Mood: refined, modern, confident, premium, breathable.
Square 1:1 aspect ratio, high resolution.
```

### Varian H — Single word minimalist: نور

Sama persis dengan Varian G, ganti `التوحيد` menjadi `نور` (Nur, "Light"). Lebih sedikit huruf, hasilnya lebih minimal lagi. Cocok kalau mau menonjolkan tema "Cahaya".

### Varian I — Abstract calligraphic gesture (paling reliable di AI)

```
Generate a minimalist abstract calligraphic logo mark with Arabic-
inspired aesthetic. Style: a single elegant vertical brushstroke that
suggests Arabic calligraphy without spelling a specific word — a
flowing, confident, soaring mark that evokes the feeling of classical
Arab manuscript art reduced to its essential gesture. Tall vertical
emphasis with one or two tapered terminals and a small dot or two as
diacritic accents. Modern luxury brand mark aesthetic inspired by
upscale Gulf branding. Color: rich metallic gold (#C9A227) with subtle
sheen. Background: pure white, completely empty. NO frame, NO border,
NO ornament, NO Latin text, NO readable Arabic words (this is an
abstract calligraphic mark, not a literal word). Just the mark
floating in clean negative space, occupying the central 40% of the
frame. Mood: refined, modern, premium, soaring. Square 1:1 aspect
ratio, high resolution.
```

## Pendekatan Alternatif: Icon-based

Disediakan sebagai backup jika pendekatan kaligrafi minimalist tidak menghasilkan output yang memuaskan.

### Varian A — Minimalis Modern (kitab + cahaya)

```
Generate a minimalist vector logo icon. Subject: a stylized open book
with geometric rays of light emanating upward from its center, forming
an abstract dome silhouette. Style: clean flat vector design, single-
line geometric forms, no gradients, no shadows, no photorealism. Color
palette: dark navy blue (#0E2954) for the book and rich gold (#C9A227)
for the rays, on pure white background. Composition: centered,
symmetrical, generous negative space, balanced for use at small and
large scales. Mood: scholarly, reverent, contemporary. Do NOT include
any text, lettering, Arabic calligraphy, mosque silhouettes, or
photorealistic elements. Square 1:1 aspect ratio, high resolution.
```

### Varian B — Klasik Islamic Geometric (khatam + misbah)

```
Generate a classical Islamic-style vector logo icon. Subject: an
eight-pointed Islamic star (khatam) with a small stylized oil lamp at
the very center, symbolizing illumination and knowledge. Style: clean
vector geometry derived from traditional Islamic patterns, precise
symmetry, no gradients, no photorealistic textures. Color palette: dark
navy blue (#0E2954) for the star outline and rich gold (#C9A227) for
the lamp and inner detail, on cream background (#FAF6E9). Composition:
centered, perfectly symmetrical, dignified. Mood: traditional,
scholarly, timeless. Do NOT include any text, Arabic calligraphy,
modern flat design, or cartoon-style illustration. Square 1:1 aspect
ratio, high resolution.
```

### Varian C — Abstract Modern (cahaya tunggal mengalir dari kitab)

```
Generate a contemporary vector logo icon. Subject: a single elegant
abstract curve that simultaneously suggests an open book at the bottom
and rays of light radiating upward and outward from its center. Style:
minimalist vector, single continuous form, monoline aesthetic, no
shadows, no gradients. Color palette: dark navy blue (#0E2954) and rich
gold (#C9A227) on warm white background (#FDFBF6). Composition:
centered, with generous negative space surrounding the form. Mood:
peaceful, contemporary, intellectual. Do NOT include Arabic
calligraphy, any text, mosque imagery, photorealistic elements, or
crescent moons. Square 1:1 aspect ratio, high resolution.
```

## Tips Penggunaan

- Generate 5–10 kali per varian (model probabilistik) — pilih hasil paling bersih dan paling kosong negative space-nya
- Untuk kaligrafi: tekankan "minimal", "single gesture", "vast empty space" — AI sering over-decorate kalau diizinkan
- Hex code emas dengan instruksi "subtle metallic sheen" — hindari flat gold yang tampak murah
- Eksplisit larang "frame", "border", "medallion", "ornament" — kata-kata ini paling sering muncul tanpa diminta
- Kalau warna tidak sesuai: spesifikasi hex code lebih efektif daripada nama warna
- Kalau muncul teks rusak meskipun ada instruksi "no text": regenerasi atau tambahkan "absolutely no letters or numbers anywhere in the image"
- Untuk kaligrafi yang spesifik (Varian G/H): jika hasil huruf Arab terus-menerus malformed, fallback ke Varian I (abstract) atau komisi kaligrafer manusia

## Langkah Setelah Mark Terpilih

1. Vectorize hasil raster (Inkscape Trace Bitmap atau Adobe Illustrator Image Trace)
2. Bersihkan path, samakan stroke width, snap ke grid jika perlu
3. Untuk Varian G/H (kaligrafi readable): verifikasi huruf Arab benar — jika ada huruf yang malformed, redraw dengan referensi font klasik (Amiri, Diwani LT, atau referensi kaligrafi Quran)
4. Tambahkan Latin wordmark "Cahaya Tauhid" di samping atau di bawah mark, mengikuti style JHODA AM:
   - Layout horizontal: mark di kiri, wordmark di kanan
   - Atau layout vertikal: mark di atas, wordmark di bawah
   - Typography rekomendasi serif elegan: Playfair Display, EB Garamond, Cormorant
   - Atau serif modern: Source Serif Pro, Lora
   - Untuk style Gulf luxury: serif tipis dengan letter spacing lebar (tracking)
5. Tentukan jarak mark-wordmark, alignment, dan ukuran relatif
6. Export sebagai SVG (vector master) dan PNG di beberapa ukuran (16, 32, 64, 128, 256, 512, 1024 px)
