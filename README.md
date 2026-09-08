# Mini Project SQL — EduSmart LMS Database

Full Stack Web Development Bootcamp — Dibimbing.id

## Deskripsi

Database ini merepresentasikan data di balik platform **EduSmart** — kategori materi dan judul pelatihan diselaraskan dengan konten yang ada pada aplikasi EduSmart. Terdiri dari 3 entitas: `users`, `kategori_materi`, dan `materi`.

## 1. ERD (Entity Relationship Diagram)

### Primary Key tiap tabel

| Tabel | Primary Key |
|---|---|
| `users` | `user_id` |
| `kategori_materi` | `category_id` |
| `materi` | `course_id` |

### Relationship & Cardinality

1. **`kategori_materi` → `materi`** — **One-to-Many (1:N)**. Satu kategori bisa memiliki banyak materi, satu materi hanya masuk ke satu kategori. Direalisasikan lewat FK `materi.category_id`.

2. **`users` → `materi`** — **One-to-Many (1:N)**. Satu user (berperan sebagai Instructor) bisa membuat banyak materi, satu materi hanya dibuat oleh satu user. Direalisasikan lewat FK `materi.instructor_id`.

Tidak ada relasi many-to-many pada desain ini. Tabel `users` menyimpan seluruh pengguna (Student, Instructor, Admin Dinas) dalam satu tabel yang sama, dibedakan lewat kolom `role`, untuk menghindari duplikasi struktur kolom (name, NIK, email) di beberapa tabel terpisah.

## 2. Struktur File

```
├── README.md
├── schema.sql              -- DDL: DATABASE & CREATE TABLE (Sesuai yang diminta pada studi kasus)
├── seed.sql                -- DML: 10 users, 10 kategori, 13 materi
├── 01_fundamentals.sql     -- Query dasar (SELECT, WHERE, ORDER BY, LIMIT)
├── 02_aggregate_conditional logic.sql        -- Query agregat (COUNT, AVG, GROUP BY, HAVING)
├── 03_join statement.sql            -- Query JOIN (INNER JOIN, LEFT JOIN)
└── 04_optimization.sql     -- Indexing & EXPLAIN
```

## 3. Cara Menjalankan

```bash
mysql -u root -p < schema.sql
mysql -u root -p < seed.sql
mysql -u root -p < 01_fundamentals.sql
mysql -u root -p < 02_aggregate_conditional logic.sql
mysql -u root -p < 03_join statement.sql
mysql -u root -p < 04_optimization.sql
```

## 4. Hasil Query (Terverifikasi)

### Aggregate & Conditional

**Total user terdaftar:** 10
**Total materi tersedia:** 13

**Jumlah materi per kategori** (LEFT JOIN, kategori kosong tetap muncul):

| Kategori | Jumlah Materi |
|---|---|
| Ilmu Pendidikan | 4 |
| Ilmu Pemerintahan | 3 |
| Etika Bernegara | 0 |
| Manajemen Kepegawaian | 2 |
| Kebijakan Publik | 1 |
| Digitalisasi Layanan Publik | 0 |
| Kesejahteraan Sosial | 1 |
| Pengembangan SDM Aparatur | 1 |
| Reformasi Birokrasi | 1 |
| Perlindungan Anak dan Perempuan | 0 |

**Kategori dengan lebih dari 3 materi:** Ilmu Pendidikan (4) — satu-satunya kategori yang lolos `HAVING > 3`.

### Join Statements

Semua kategori dengan 0 materi (Etika Bernegara, Digitalisasi Layanan Publik, Perlindungan Anak dan Perempuan) tetap tampil dengan `title: NULL` saat menggunakan `LEFT JOIN` — membuktikan perbedaannya dengan `INNER JOIN` yang akan menghilangkan baris tersebut sepenuhnya.

## 5. Optimization: Indexing & EXPLAIN

Kolom `category_id` dan `instructor_id` di tabel `materi` sudah otomatis memiliki index karena keduanya FOREIGN KEY. Index tambahan `idx_materi_price` dibuat untuk kolom `price`, karena sering dipakai di `WHERE` dan `ORDER BY` tapi belum ada index-nya.

**Hasil `EXPLAIN SELECT * FROM materi ORDER BY price DESC LIMIT 5;`:**

| id | select_type | table | type | key | rows | Extra |
|---|---|---|---|---|---|---|
| 1 | SIMPLE | materi | ALL | NULL | 13 | Using filesort |

**Interpretasi:** 
Hasil `EXPLAIN` menunjukkan `type: ALL` dan `key: NULL`, artinya MySQL tetap membaca seluruh baris tabel (full table scan) walaupun index `idx_materi_price` sudah dibuat — index-nya sama sekali tidak dipakai. Ini terjadi karena tabel `materi` cuma berisi 13 baris; untuk data sekecil ini, optimizer menganggap scan langsung ke semua baris lebih murah daripada baca index dulu baru cari ke tabel. Index seperti ini baru akan benar-benar dipakai dan berdampak ketika jumlah data sudah jauh lebih besar (ribuan/jutaan baris), karena di situ full scan jadi jauh lebih mahal dibanding baca index yang sudah terurut.

## Tools

- MySQL / MariaDB / XAMPP
- Draw.io (untuk ERD)

## Dibuat Oleh

Raza Candra Anwar — Full Stack Web Development Bootcamp, Dibimbing.id
