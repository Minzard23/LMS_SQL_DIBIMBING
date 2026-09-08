USE edusmart_db;

--Menampilkan daftar materi beserta nama kategorinya
SELECT
    m.title,
    m.price,
    k.category_name
FROM materi m
INNER JOIN kategori_materi k ON m.category_id = k.category_id;

--Menampilkan semua kategori meskipun belum memiliki materi
SELECT
    k.category_name,
    m.title
FROM kategori_materi k
LEFT JOIN materi m ON k.category_id = m.category_id;

--Menampilkan semua user meskipun belum pernah membuat materi
SELECT
    u.name,
    u.role,
    m.title AS materi_dibuat
FROM users u
LEFT JOIN materi m ON u.user_id = m.instructor_id;

--Menampilkan daftar materi beserta nama instructor yang membuat materi tersebut
SELECT
    m.title,
    m.price,
    u.name AS instructor_name
FROM materi m
INNER JOIN users u ON m.instructor_id = u.user_id;

--Menampilkan jumlah materi yang dibuat oleh masing-masing instructor
SELECT
    u.name AS instructor_name,
    COUNT(m.course_id) AS jumlah_materi
FROM users u
LEFT JOIN materi m ON u.user_id = m.instructor_id
WHERE u.role = 'Instructor'
GROUP BY u.user_id, u.name;
