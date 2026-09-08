USE edusmart_db;

--Saya buat users sebanyak 10 data (disoal mintanya 10-15 record)
INSERT INTO users (name, email, role) VALUES
('Raza Candra Anwar', 'razacandraanwar@gmail.com', 'Student'),
('Siti Nurhaliza', 'siti.nurhaliza@gmail.com', 'Student'),
('Bambang Setiawan', 'bambangsetiawan@gmail.com', 'Instructor'),
('Naruto Uzumaki', 'uzumakiklan@gmail.com', 'Instructor'),
('Sakura Sasuke', 'iniklanku@email.com', 'Student'),
('Namikaze Prabowo', 'sayaakanlawan@email.com', 'Student'),
('Hatake Widodo', 'hidupjokowi@email.com', 'Student'),
('Gibran Chimaru', 'fufufafa@email.com', 'Student'),
('Deidada', 'megachan@email.com', 'Instructor'),
('Otsusuki Basweydan', 'anakabah@email.com', 'Admin Dinas');

-- saya buat kategori materi juga 10 data
INSERT INTO kategori_materi (category_name) VALUES
('Ilmu Pendidikan'),
('Ilmu Pemerintahan'),
('Etika Bernegara'),
('Manajemen Kepegawaian'),
('Kebijakan Publik'),
('Digitalisasi Layanan Publik'),
('Kesejahteraan Sosial'),
('Pengembangan SDM Aparatur'),
('Reformasi Birokrasi'),
('Perlindungan Anak dan Perempuan');

-- Untuk materi, saya masukan 13 data, dengan catatan, kategori "Etika Bernegara", "Digitalisasi Layanan Publik",
-- dan "Perlindungan Anak dan Perempuan" sengaja dikosongkan belum ada materi untuk keperluan pengujian LEFT JOIN.
-- fungsi left join akan menampilkan kategori yang belum memiliki materi, sehingga kategori tersebut akan muncul di hasil query LEFT JOIN.

INSERT INTO materi (title, price, quota, category_id, instructor_id) VALUES
('Fundamental Pendidikan (Behaviorisme, Kognitivisme, Konstruktivisme)', 150000, 30, 1, 3),
('Karakteristik Peserta Didik', 90000, 40, 1, 3),
('Kurikulum dan Perencanaan Pembelajaran', 250000, 25, 1, 4),
('Pengantar Ilmu Pemerintahan', 120000, 35, 2, 3),
('Sistem Pemerintahan Daerah', 400000, 10, 2, 4),
('Otonomi Daerah dan Desentralisasi', 600000, 5, 2, 4),
('Manajemen Kinerja ASN', 220000, 25, 4, 3),
('Rekrutmen dan Seleksi P3K', 300000, 15, 4, 4),
('Analisis Kebijakan Publik', 250000, 20, 5, 9),
('Peningkatan Kesejahteraan Sosial Masyarakat', 180000, 30, 7, 3),
('Pengembangan Kompetensi Aparatur', 400000, 10, 8, 4),
('Strategi Reformasi Birokrasi Digital', 350000, 12, 9, 9),
('Evaluasi dan Supervisi Pendidikan', 190000, 25, 1, 3);
