# Templat Buku - Versi AsciiDoc

Buku ini berfungsi sebagai templat buku. Untuk membuat buku, cukup *clone* repositori ini dan mulai menulis menggunakan [AsciiDoc](https://asciidoc.org/). Perlu diperhatikan bahwa templat ini menggunakan versi Ruby - [Asciidoctor](https://asciidoctor.org/).

## Kakas

Templat ini hanya membutuhkan Ruby, Asciidoctor, dan `asciidoctor-pdf` serta beberapa ekstensi. Lakukan ini untuk menginstalnya (Anda harus [menginstal Ruby terlebih dahulu](https://www.ruby-lang.org/en/downloads/)):

```
$ gem install --user-install asciidoctor asciidoctor-pdf asciidoctor-bibliography asciidoctor-bibtex asciidoctor-diagram asciidoctor-rouge asciidoctor-epub3 asciidoctor-lists asciidoctor-diagram-batik asciidoctor-diagram-ditaamini asciidoctor-diagram-plantuml
```

Saat ini, templat ini menggunakan:

```bash
$ gem list --local | grep asciidoctor
asciidoctor (2.0.26)
asciidoctor-bibliography (0.11.0)
asciidoctor-bibtex (0.9.0)
asciidoctor-diagram (3.1.0)
asciidoctor-diagram-batik (1.17)
asciidoctor-diagram-ditaamini (1.0.3)
asciidoctor-diagram-plantuml (1.2025.3)
asciidoctor-epub3 (2.3.0)
asciidoctor-lists (1.1.2)
asciidoctor-pdf (2.3.24)
asciidoctor-rouge (0.4.0)
$
```

Anda juga dapat menginstal ekstensi Asciidoctor lainnya. Cari rubygems untuk `asciidoctor-` atau `asciiidoctor_` atau `_asciidoctor`:

```bash
$ gem search -d asciidoctor
*** REMOTE GEMS ***
...
...
asciidoctor-anywhere-footnote (1.0.3)
    Author: Ray Offiah
    Homepage:
    https://github.com/RayOffiah/asciidoctor-anywhere-footnote-ruby
    License: MIT

    An Asciidoctor extension for placing footnotes anywhere in the
    document
...
...
```


## Kompilasi ke PDF

Gunakan `Makefile`. Hasilnya akan berada di direktori [hasil](hasil/). Jika ingin menggunakan diagram, saya juga membuat contoh diagram (sebagai kode - menggunakan [ditaa](https://github.com/pepijnve/ditaa)) tetapi ini sepenuhnya opsional. Sila baca [Makefile](Makefile) terlebih dahulu. Jika Anda tidak memerlukan diagram, Anda tidak perlu menggunakan `-r asciidoctor-diagram` di Makefile dan lewati contoh diagram di bawah ini.

```bash
$ make
```

## Menggunakan Template Ini

### Isi / Konten

Semua konten berada di [isi](isi/). Anda harus menyinkronkan semua nama file di direktori tersebut dengan `judul-buku.adoc`.

### Gambar

* Semua gambar berada di [gambar](gambar/). Tentu saja Anda bebas mengatur cara menempatkan gambar di dalamnya, misalnya Anda dapat menggunakan direktori `xx-yy` dengan `xx` adalah *bagian* dan `yy` adalah *bab* (01-01). Misalnya, jika Anda memiliki gambar di bagian I dan bab 01 - bernama `01-01.png`, maka letakkan `01-01.png` di dalam direktori `01-01` di dalam `gambar`. Lihat isi direktori [gambar](gambar/) untuk contoh.

* Dalam dokumen Asciidoc, gunakan kode sumber ini:

```asciidoc
[[gambar-bagian-I-bab-01-01]]
.Judul Gambar
[link=https://www.onlywhenyouneedto.org]
image::01-01/01-01.png[]
```

* Jika Anda ingin membuat tautan - *referensi silang* yang merujuk ke gambar:

```asciidoc
... lorem sum dolor lorem sum dolor lorem sum dolor <<gambar-bagian-I-bab-01-01>> ...
```

Anda juga dapat mengubah nama direktori teratas untuk *gambar* dalam deskripsi `judul-buku.adoc`:

```
:imagesdir: gambar/isi-buku
```

Untuk gaya referensi, sila melihat pada manual tentang [Teks dan Gaya Referensi Silang](https://docs.asciidoctor.org/asciidoc/latest/macros/xref-text-and-style/). Dalam templat buku ini, kami menggunakan:

```
:xrefstyle: short
```

Oleh karena itu, referensi dalam dokumen akan menampilkan sesuatu seperti `Gambar 1`. Anda juga dapat menggunakan `full` (untuk nomor gambar dan keterangan), atau `basic` (hanya untuk keterangan - default).

### Kode Sumber

* Letakkan kode sumber di dalam direktori [kode-sumber](kode-sumber/). Selain itu, Anda dapat mengatur apa pun yang Anda suka dengan cara Anda meletakkan kode sumber Anda (atau mungkin juga tergantung pada bahasa pemrograman yang Anda gunakan. Misalnya, di Rust Anda menggunakan `src/main.rs` di dalam proyek, atau di Java Anda menggunakan `src/main/java/package/App.java`. Lebih baik jika Anda meletakkan nomor bagian dan bab seperti pola pada gambar `01-02` untuk bagian I dan bab 02.
* Ruby menggunakan gem-nya sendiri untuk *syntax highlighting*. Templat ini menggunakan **Rouge**, jadi Anda harus menginstalnya terlebih dahulu menggunakan: `gem install rouge --user-install`.
* Dalam asciidoc, gunakan kode sumber ini (contoh di Rust - `hello-plain` adalah nama proyek di dalam bagian I - bab 02):

```
[source,rust,linenums]
----
include::../{sourcedir}/01-02/hello-plain/hello.rs[]
----
<1> Penjelasan - keterangan untuk nomor 1
<2> Penjelasan - keterangan Untuk nomor 2

```

Sekali lagi, Anda juga dapat mengubah nama direktori teratas untuk *kode sumber* dalam deskripsi `judul-buku.adoc`:

```
:sourcedir: kode-sumber
```

**Catatan**: hapus **linenums** di **[source,rust,linenums]** jika Anda tidak ingin menggunakan penomoran baris dalam kode sumber.

### Bibliografi

Lihat [contoh file bibliografi](isi/tambahan-00-bibliografi.adoc):

```asciidoc
== Referensi

* [[[PragProg1999]]] Andy Hunt & Dave Thomas. The Pragmatic Programmer: From Journeyman to Master. Addison-Wesley. 1999.
* [[[RustBook2023]]] Steve Klabnik and Carol Nichols. The Rust programming language. No Starch Press, 2023.
```

Di dalam `judul-buku.adoc`, letakkan nama file:

```asciidoc
[bibliography]
include::{includedir}/tambahan-00-bibliografi.adoc[]
```


Dalam dokumen tempat kita ingin mengutip referensi (lihat tanda pada Referensi di atas, harus sama dengan kutipan):

```asciidoc
...
... anggap saja bagian ini dikutip dari <<PragProg1999>>. ...
...
... Tentu saja, jangan pernah lupakan buku Rust <<RustBook2023>>....
...
```

Hasil dalam dokumen:

![Hasil indeks di halaman Indeks](gambar/bukan-isi-buku/bib-inside-document.png)

Hasil di **Referensi**:

![Hasil di Referensi](gambar/bukan-isi-buku/bib-result-page.png)

### Diagram

Asciidoctor memiliki ekstensi jika kita ingin membuat diagram menggunakan deskripsi tekstual (disebut *diagram sebagai kode*). Untuk menggunakan fitur ini, instal asciidoctor-diagram terlebih dahulu. Lakukan ini jika Anda belum menginstalnya:

```
$ gem install --user-install asciidoctor-diagram
```

Contoh kode sumber:

[isi/01-02-judul.adoc](isi/01-02-judul.adoc)

```bash
((Proses Kompilasi Rust)) bisa dilihat di <<#gbr-01-01-02>>.

[#gbr-01-01-02]
.Proses Kompilasi Rust
[ditaa, target="proses-kompilasi-rust"]
----
 +--------+             +---------+   +--------------+   +----------+   +------------+
 |        |             | Lexing  |   |              |   |          |   |            |
 | Source | Invocation  | and     |   | AST lowering |   | MIR      |   | Code       |
 | code   |------------>| parsing |-->| (HIR)        |-->| lowering |-->| generation |
 |        |             |         |   |              |   |          |   |            |
 +---+----+             +---------+   +--------------+   +----------+   +------------+
----
```

File gambar akan dihasilkan secara langsung (nama file akan sama dengan yang didefinisikan dalam `target` + .png). Gambar akan dihasilkan dan disimpan di lokasi yang telah didefinisikan dalam `judul-buku.adoc`. Dalam kasus ini, lokasinya adalah:

```asciidoc
:imagesoutdir: gambar/cache
```

Hasilnya adalah:

[gambar/cache/proses-kompilasi-rust.png](gambar/cache/proses-kompilasi-rust.png)

```bash
bpdp@Neo-X$ ls -la images/cache/
total 12
drwxr-xr-x 2 bpdp bpdp 42 Dec 25 05:35 .

drwxr-xr-x 5 bpdp bpdp 82 Dec 25 05:35 ..
-rw-r--r-- 1 bpdp bpdp 9288 Dec 25 05:35 proses-kompilasi-rust.png
bpdp@Neo-X$
$
```

![Hasil Diagram dengan ditaa](gambar/bukan-isi-buku/result-diagram.png)

Lihat juga [manualnya](https://docs.asciidoctor.org/diagram-extension/latest/)

### Lampiran

Letakkan ini (ada 2 contoh lampiran) di akhir `judul-buku.adoc`. Letakkan lampiran di dalam file yang telah dijelaskan di `judul-buku.adoc`

```asciidoc
[appendix]
include::{includedir}/tambahan-01-lampiran.adoc[]

[appendix]
include::{includedir}/tambahan-02-lampiran.adoc[]
```

Berikut ini adalah contoh lampiran:

```asciidoc
= Lampiran I

=== Bagian 1 dari Lampiran I

Contoh lampiran bagian 1 dari lampiran I

=== Bagian 2 dari Lampiran I

Contoh lampiran bagian 2 dari lampiran I
```

Lihat juga [tambahan-01-lampiran.adoc](isi/tambahan-01-lampiran.adoc)

### Glosarium

Letakkan ini di akhir `judul-buku.adoc`. Masukkan glosarium ke dalam file yang telah dijelaskan di `judul-buku.adoc`

```asciidoc
[glossary]
= Glosarium

[glossary]
include::{includedir}/tambahan-03-glosarium.adoc[]
```

Berikut adalah contoh glosarium:

```asciidoc
terminologi 1:: terminologi no 1 adalah contoh glosarium
terminologi 2::
  terminologi no 2 adalah contoh glosarium
```

### Indeks

Untuk membuat indeks, pastikan file tujuan hasil adalah PDF (asciidoctor-pdf) karena Asciidoctor tidak akan menghasilkan indeks untuk output HTML5. Pada dasarnya, yang akan dilakukan adalah:

1. Definisikan indeks pada dokumen Asciidoctor.
2. Definisikan di mana Asciidoctor harus mencetak indeks di file utama.

Untuk mendefinisikan indeks dalam dokumen Asciidoctor:

[Lihat file kode sumber](isi/01-02-judul.adoc)

```asciidoc
...
...
...
Dalam bab ini, saya akan memberikan contoh cara memformat kode sumber (((kode sumber, pemformatan, keterangan))) menggunakan AsciiDoctor.
...
...
...
Untuk sumber lain yang tidak berkaitan dengan kode sumber dalam bahasa pemrograman, gunakan ini: (((kode sumber, pemformatan, tampilan shell)))
...
...
...
((Proses kompilasi Rust)) bisa dilihat di <<#gbr-01-01-02>>.
...
...
...
```

Untuk menentukan di mana Indeks akan dicetak, masukkan ini di dalam `judul-buku.adoc``:

```asciidoc
[index]
== Indeks
```

Dokumen yang dihasilkan akan bersih (tidak ada tanda indeks) tetapi setiap kali pembaca mengklik halaman pada halaman hasil indeks, penunjuk akan diarahkan ke halaman tersebut. Dokumen bersih:

![Hasil indeks dalam dokumen](gambar/bukan-isi-buku/index-result-in-document.png)

Halaman hasil indeks:

![Hasil indeks di halaman Indeks](gambar/bukan-isi-buku/index-result-in-index-page.png)

## Daftar

Templat ini menggunakan [asciidoctor-lists](https://github.com/Alwinator/asciidoctor-lists) untuk daftar gambar, tabel, dan kode sumber. Cuplikan dari [judul-buku.adoc](judul-buku.adoc):

```asciidoc
...
...
:listing-caption: Kode Sumber

:sectnums!:
== Daftar Gambar
list-of::image[]
<<<

== Daftar Tabel
list-of::table[]
<<<

== Daftar Kode Sumber
list-of::listing[]
<<<
:sectnums:
...
...
```

`:sectnums!` digunakan untuk menonaktifkan nomor bagian (karena seharusnya bukan bagian dari isi). `<<<` digunakan untuk pemisah halaman. Lihat juga [contoh deskripsi tema](sumber-daya/tema/tema-neo-x.yaml) untuk memahami penomoran halaman antara sampul depan dan isi buku. Perhatikan cuplikan ini:

```yaml
...
...
page:
layout: portrait
margin: [0.75in, 1in, 0.75in, 1in]
size: Letter
numbering:
start-at: 5
...
...
```

Kita akan menggunakan penomoran normal, dimulai dari halaman 5 (setelah daftar isi dan daftar). Anda mungkin perlu menyesuaikan nomor ini setelah Anda menyelesaikan proses kompilasi (periksa nomor halaman yang menandai akhir halaman depan dan sesuaikan). Lihat [manual](https://docs.asciidoctor.org/pdf-converter/latest/theme/page-numbers/).

## Lebih Lanjut

Jika ingin mengubah tata letak (font, logo, dll):

1. Lihat `Makefile` sebagai referensi perintah shell yang digunakan untuk membuat file pdf. Parameter yang digunakan antara lain adalah `pdf-theme`.
2. Tema berada di `sumber-data/tema/` dan menggunakan pola nama file ini (lihat juga `Makefile`):

*nama-tema-pdf-di-Makefile*-theme.yml

Contoh: 

*neo-x*-theme.yaml

3. Lihat [manual pembuatan tema](https://docs.asciidoctor.org/pdf-converter/latest/theme/) untuk informasi lebih lanjut tentang membuat tema Anda sendiri.

## Lisensi

Templat ini memiliki [Lisensi Apache 2.0](https://www.apache.org/licenses/LICENSE-2.0), namun Anda bebas memilih lisensi apa pun untuk buku Anda.
