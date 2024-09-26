CREATE DATABASE AppMaya;
use AppMaya
create table User(
    id int auto_increment primary key,
    nama varchar(100),
    email varchar(100) unique,
    password varchar(200),
    usia varchar(100),
    pekerjaan varchar(100),
    lokasi varchar(100)
);
SELECT * FROM User;

CREATE TABLE children (
    child_id INT AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(100),
    usia INT,
    id INT,
    FOREIGN KEY (id) REFERENCES User(id) ON DELETE CASCADE
);

CREATE TABLE activities (
    activity_id INT AUTO_INCREMENT PRIMARY KEY,
    deskripsi VARCHAR(255),
    waktu DATE,
    kategori ENUM('Pekerjaan', 'Keluarga', 'Hobi'),
    id INT,
	FOREIGN KEY (id) REFERENCES User(id) ON DELETE CASCADE
);

CREATE TABLE meals (
    meal_id INT AUTO_INCREMENT PRIMARY KEY,
    nama_makanan VARCHAR(100),
    kategori ENUM('Sarapan', 'Makan Siang', 'Makan Malam', 'Snack'),
    kalori INT,
    child_id INT,
    FOREIGN KEY (child_id) REFERENCES children(child_id) ON DELETE CASCADE
);

CREATE TABLE health (
    health_id INT AUTO_INCREMENT PRIMARY KEY,
    aktivitas VARCHAR(100),
    durasi INT,  -- durasi dalam menit
    kalori_terbakar INT,
    tanggal DATE,
    id INT,
	FOREIGN KEY (id) REFERENCES User(id) ON DELETE CASCADE
);

INSERT INTO User (nama, email, password, usia, pekerjaan, lokasi)
VALUES ('Maya', 'maya@gmail.com', '123456', '37', 'Direktur Pemasaran', 'Jakarta Pusat');

INSERT INTO children (nama, usia, id) 
VALUES ('Lily', 6, 1), ('Leo', 4, 1);

INSERT INTO activities (deskripsi, waktu, kategori, id) 
VALUES ('Meeting Pemasaran', '2024-09-28', 'Pekerjaan', 1), 
       ('Mengantar anak ke sekolah', '2024-09-29', 'Keluarga', 1),
       ('Bermain piano', '2024-09-30', 'Hobi', 1);

INSERT INTO meals (nama_makanan, kategori, kalori, child_id) 
VALUES ('Nasi goreng sayur', 'Makan Siang', 500, 1), 
       ('Sandwich alpukat', 'Sarapan', 300, 2);


INSERT INTO health (aktivitas, durasi, kalori_terbakar, tanggal, id) 
VALUES ('Lari Maraton', 120, 1000, '2024-09-27', 1);

SELECT * FROM User;
SELECT * FROM children;
SELECT * FROM activities;
SELECT * FROM meals;
SELECT * FROM health;