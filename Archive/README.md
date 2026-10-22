# INSPIRE HUB V2 · DUTA INSPIRE UNS

Revisi dari website INSPIRE HUB pertama. **Navigasi antar-halaman tetap dengan klik tab**, tanpa scroll antar-section. Isi masing-masing tab bisa digulir apabila lebih tinggi dari layar.

## Cara membuka website

1. Ekstrak `INSPIRE_HUB_V2.zip`.
2. Buka `INSPIRE_HUB_V2/index.html` di Chrome/Edge. Internet diperlukan untuk memuat font, library ikon, PDF exporter dan opsi autentikasi Supabase.
3. Coba tab **Mentor**, **Peluang**, **Milestone**, dan **Akun & Pendaftaran**.
4. Untuk mengunggah website publik, upload seluruh folder ke host web statis seperti Netlify / Vercel / GitHub Pages. HTTPS diperlukan agar autentikasi dan penyimpanan berjalan optimal.

## Revisi utama

- Semua istilah **90 hari** di UI berubah menjadi **6 minggu**, dengan enam tahap, tab Minggu 1–6, tambah tugas, centang dan reset progres.
- Mentor kini berupa **kartu profil per orang**; bisa cari/filter, buka detail, dan ajukan permintaan mentoring sebagai draf pribadi.
- **Duta Berprestasi UNS**: Kak Ella, Yasril, Noval (nama masukan tim, **contoh — belum diverifikasi**).
- **Alumni**: Mas Dana dan Mas Ilham Ryan (contoh nama masukan tim — perlu konfirmasi).
- **Dosen**: Dr. Susantiningrum, Prof. Dr. Dwi Prasetyani, Dr. Septi Yulisetiani. Keterlibatan mereka di kegiatan UNS didukung informasi publik. **Tidak berarti mereka setuju menjadi mentor INSPIRE HUB.**
- **Praktisi**: Dhanny Ardiansyah (Toekang Digital Indonesia), Dr. Wisnu S. Dewobroto (TDA), dan Antonius Irawan Eko S. (Cipta Solutindo Tech); pernah terlibat sebagai narasumber kegiatan UNS. **Tidak berarti sudah menjadi mitra resmi program.**
- **Peluang**: MAJU:ON, KBMK, P2MW, WIBAWA, KMI Expo, dan PKM. Kartu bisa dibuka, disimpan, atau mengakses sumber resmi.
- Halaman “Contoh area kolaborasi” dihilangkan; digantikan halaman **Akun & Pendaftaran** yang memiliki profil demo, minat bootcamp, permintaan mentoring, simpan peluang, export/import data JSON.
- Tambahan unduh kalender `.ics` untuk **jadwal pribadi** tiga sesi mentoring, bukan undangan resmi.

## Penting: demo vs. layanan nyata

**Tanpa konfigurasi backend**: semua fitur interaktif yang disebut di atas berfungsi dengan `localStorage`; pengajuan mentoring **draf saja**, tidak mengirim pesan kepada orang yang namanya ditampilkan. “Aktifkan profil demo” tidak menggunakan kata sandi dan **bukan login sungguhan**. Pengguna dapat mengekspor data sendiri sebagai JSON.

**Dengan kredensial Supabase** (opsional): login/daftar email-password bekerja memakai Supabase Auth, dengan data pribadi peserta disimpan di tabel `app_state` milik project. Ini bukan SSO UNS, belum termasuk pendaftaran resmi, verifikasi mentor, fitur approval atau notifikasi email/WhatsApp ke mentor. Untuk produksi perlu mekanisme admin, verifikasi identitas & persetujuan peserta/mentor.

### Menyalakan autentikasi dan sinkronisasi Supabase

1. Buat project di [Supabase](https://supabase.com/).
2. Buka SQL Editor; jalankan kode lengkap di `supabase_schema.sql` (membuat tabel dengan **Row Level Security**).
3. Buka `config.js` dan isi `url` (Project URL) serta `anonKey` / publishable key dari halaman Project Settings -> API. **Jangan masukkan service role key.**
4. Unggah website ke hosting HTTPS. Atur Site URL/Redirect URL serta pengaturan email confirmation pada dashboard Auth Supabase.
5. Buka **Akun & Pendaftaran**, coba **Daftar akun**, konfirmasi email bila diminta, lalu **Masuk akun online**. Isian setelah login tersinkron ke `app_state`.
6. Pengguna yang sebelumnya membuat data demo sebaiknya **Unduh data JSON** sebelum login dengan akun baru, lalu **Impor data** bila ingin memindahkan pekerjaan demo.

### Sumber peluang & nama publik

- KBMK 2026 (panduan Dikti): https://dikti.kemdiktisaintek.go.id/publikasi/pengumuman/panduan-kbmk-tingkat-nasional-tahun-2026
- P2MW: https://p2mw.kemdiktisaintek.go.id/p2mw
- WIBAWA / Wibawa Camp 2026: https://dakm.uns.ac.id/2026/06/30/wibawa-camp-2026-resmi-digelar-uns-dorong-semangat-wirausaha-mahasiswa/
- MAJU:ON 2026–27: https://www.majuon.com/
- Berita UNS dan Dr. Susantiningrum: https://uns.ac.id/id/uns-students/uns-raih-tiga-penghargaan-nasional-di-kmi-expo-dan-kbmk-2026.html
- Pelatihan PKM dan Dr. Septi Yulisetiani: https://fkip.uns.ac.id/2024/10/unit-kemahasiswaan-fkip-uns-gelar-pelatihan-dan-kompetisi-pkm-kewirausahaan/
- Narasumber dari Cipta Solutindo Tech: https://uns.ac.id/id/uns-update/unit-kemahasiswaan-fkip-uns-gelar-lokakarya-kewirausahaan.html

Status pendaftaran dan tenggat diambil berdasarkan informasi yang tersedia **22 Oktober 2026**; tidak auto-refresh. Verifikasi ulang di situs penyelenggara sebelum mengikuti lomba.

## Teknologi dipakai

Vanilla HTML/CSS/JavaScript + Plus Jakarta Sans + Lucide + Chart.js + SweetAlert2 + html2pdf.js + **opsional Supabase Auth/Postgres**. AOS tidak digunakan karena antartab memakai transisi sendiri. Tidak memakai Tailwind, ApexCharts, Select2, Firebase, WhatsApp API, atau Zoom karena tidak diperlukan untuk fungsi saat ini.

> **Kebijakan penggunaan:** sebaiknya tidak menerbitkan kontak/foto pribadi atau menyatakan seseorang sebagai mentor resmi sebelum mendapat persetujuan; tidak gunakan lambang resmi UNS tanpa otorisasi. Jangan meminta peserta memasukkan data sensitif ke prototipe tanpa kebijakan privasi dan pengelolaan data yang memadai.
