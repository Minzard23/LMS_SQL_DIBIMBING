USE edusmart_db;

-- Ini menampilkan seluruh data materi
SELECT * FROM materi;

-- Ini menampilkan nama materi dan harga saja
SELECT title, price FROM materi;

-- Menampilkan materi dengan harga antara 50.000 sampai 200.000
SELECT * FROM materi
WHERE price BETWEEN 50000 AND 200000;

-- Ini menampilkan materi yang memiliki kuota 0 ATAU harga di atas 500.000
SELECT * FROM materi
WHERE quota = 0 OR price > 500000;

-- Dan menampilkan 5 materi dengan harga tertinggi
SELECT * FROM materi
ORDER BY price DESC
LIMIT 5;
