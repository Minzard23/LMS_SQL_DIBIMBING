USE edusmart_db;

-- Menghitung total user yang terdaftar
SELECT COUNT(*) AS total_user FROM users;

-- Lalu menghitung total materi yang tersedia
SELECT COUNT(*) AS total_materi FROM materi;

-- Menghitung jumlah materi per kategori
SELECT
    k.category_name,
    COUNT(m.course_id) AS jumlah_materi
FROM kategori_materi k
LEFT JOIN materi m ON k.category_id = m.category_id
GROUP BY k.category_id, k.category_name;

-- Menghitung rata-rata harga materi per kategori
SELECT
    k.category_name,
    ROUND(AVG(m.price), 2) AS rata_rata_harga
FROM kategori_materi k
JOIN materi m ON k.category_id = m.category_id
GROUP BY k.category_id, k.category_name;

-- Menghitung dan menampilkan kategori yang memiliki lebih dari 3 materi
SELECT
    k.category_name,
    COUNT(m.course_id) AS jumlah_materi
FROM kategori_materi k
JOIN materi m ON k.category_id = m.category_id
GROUP BY k.category_id, k.category_name
HAVING COUNT(m.course_id) > 3;
