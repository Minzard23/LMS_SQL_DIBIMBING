USE edusmart_db;

--Disini category_id dan instructor_id di tabel materi sudah otomatis memiliki index karena keduanya adalah FOREIGN KEY, 
--Nah Index tambahan di bawah ini untuk kolom price, yang sering dipakai di WHERE dan ORDER BY tapi belum ada index-nya.

CREATE INDEX idx_materi_price ON materi(price);
EXPLAIN SELECT * FROM materi ORDER BY price DESC LIMIT 5;
