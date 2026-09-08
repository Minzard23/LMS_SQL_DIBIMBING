
-- EduSmart - Database Schema untuk platform LMS (DDL)
CREATE DATABASE IF NOT EXISTS edusmart_db;
USE edusmart_db;

-- Disini raza buat Tabel: users buat nyimpan data pengguna (Student, Instructor, atau Admin Dinas)

CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    NIK VARCHAR(100) NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    role ENUM('Student', 'Instructor', 'Admin Dinas') NOT NULL DEFAULT 'Student',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Lalu membuat Tabel kategori_materi untuk menyimpan kategori materi pelatihan
CREATE TABLE kategori_materi (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL UNIQUE
);

-- Dan tabel materi buat menyimpan data materi pelatihan. Nah tabel ini terhubung ke kategori_materi dan ke users (sebagai instructor pembuat materi)
-- Makannya hubungannya one-to-many, satu kategori bisa punya banyak materi, dan satu instructor bisa membuat banyak materi. Makanya di tabel materi ada category_id dan instructor_id sebagai foreign key.
CREATE TABLE materi (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    price DECIMAL(10,2) NOT NULL DEFAULT 0,
    quota INT NOT NULL DEFAULT 0,
    category_id INT NOT NULL,
    instructor_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_course_category
        FOREIGN KEY (category_id) REFERENCES kategori_materi(category_id)
        ON DELETE RESTRICT ON UPDATE CASCADE,

    CONSTRAINT fk_course_instructor
        FOREIGN KEY (instructor_id) REFERENCES users(user_id)
        ON DELETE RESTRICT ON UPDATE CASCADE
);
