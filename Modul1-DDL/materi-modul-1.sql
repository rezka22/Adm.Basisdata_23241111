-- Nama : Rezka askananda
-- NIM : 23241111
-- Kelas : C
-- Modul : Modul 1 Data Definition Langauge

-- Mebuat Database
CREATE DATABASE pti_mart;

-- Menggunakan DATABASE
USE pti_mart;

-- Membuat Tabel
CREATE TABLE pelanggan(
 id_pelanggan int PRIMARY KEY NOT NULL,
 nama_pelanggan VARCHAR(50),
 alamat VARCHAR(100),
 kota VARCHAR (20),
 no_tlp VARCHAR (15)
);

CREATE TABLE produk(
 id_produk int PRIMARY KEY NOT NULL,
 nama_produk VARCHAR (50),
 kategori VARCHAR (20),
 harga int (17),
 stok int (10)
); 
 
-- membuat tabel dengan foreign key
CREATE TABLE transaksi(
 id_transaksi int PRIMARY KEY NOT NULL,
 tgl_transaksi DATE,
 id_produk int,
 id_pelanggan int,
 qty int,
 total_harga int,
 FOREIGN KEY (id_produk) REFERENCES produk (id_produk),
 FOREIGN KEY (id_pelanggan) REFERENCES pelanggan (id_pelanggan)
 );
 
-- mengisi data dalam tabel
INSERT INTO pelanggan(
id_pelanggan, nama_pelanggan, alamat, kota, no_tlp
)VALUES
(007,"Leviathan", "JL pemuda No.666", "Mataram", "08266600");

INSERT INTO produk(
id_produk, nama_produk, kategori, harga, stok
)VALUES
(211,"mie", "makanan", "25000", "2"),
(321,"coffe", "minuman", "15000", "11"),
(214,"es cream", "minuman", "16000", "10"),
(122,"roma", "makanan", "5000", "5"),
(111,"beter", "makanan", "2000", "6");

-- cek apakah data ada 
SELECT * FROM pelanggan;
SELECT * FROM produk;

-- mengisi data pada tabel yang ada foreign key
INSERT INTO transaksi
 set id_transaksi = 2911,
	 tgl_transaksi = "2025-02-22",
     id_produk = (
     SELECT id_produk FROM produk
     WHERE id_produk = 211),
     id_pelanggan = (
     SELECT id_pelanggan FROM pelanggan
     WHERE id_pelanggan = 007),
     qty = 1,
     total_harga = (
     SELECT harga FROM produk
     WHERE id_produk = 211) * qty;
     
SELECT * FROM transaksi;
     
 
 