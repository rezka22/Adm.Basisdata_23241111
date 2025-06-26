-- Nama		: Rezka askananda
-- NIM		: 23241111
-- Kelas	: C
-- Modul	: Modul 3B ORDER BY, Fungsi Agregasi, GROUP BY, HAVING

-- Menggunakan database
use ptic_mart;

-- Praktek 6
-- WHARE Dengan ORDER BY
-- Mengurutkan hasil filtering dari hasil sebuah query
-- Ambil nama produk dan qty untuk produk yang berawalan huruf f untuk qty besar atau kecil

SELECT nama_produk, qty FROM tr_penjualan WHERE nama_produk LIKE 'F%' ORDER BY qty DESC;

-- Fungsi agregasi 
-- Digunakan untuk  mengolah beberapa baris dalam kolom data
-- Praktek 7
-- Hitung qty terjual pada penjualan

SELECT qty FROM tr_penjualan;
SELECT SUM(qty) FROM tr_penjualan; -- ada 42 produk yang terjual

-- Praktek 8
-- Hitung semua transaksi yang terjadi pada penjualan

SELECT COUNT(qty) FROM tr_penjualan;

-- Praktek 9
-- Hitung qty terjual dan transaksi yang terjadi 

SELECT SUM(qty), COUNT(qty) FROM tr_penjualan;

-- Praktek 10
-- hitung rata rata qty terjual per transaksi AVG()
-- hitung qty terbanyak yang terjual per transaksi MAX()
-- hitung qty paling sedikit terjual per transakasi MIN()

SELECT AVG(qty), MAX(qty), MIN(qty) FROM tr_penjualan;

-- COUNT (DISTINCT) 
-- digunakan untuk menghitung nilai unik yang terdapat pada sebuah kolom
-- Praktek 11

SELECT COUNT(nama_produk) FROM tr_penjualan;
SELECT COUNT(DISTINCT nama_produk) FROM tr_penjualan;

-- Praktek 12
 SELECT COUNT(nama_produk), COUNT(DISTINCT nama_produk) FROM tr_penjualan;
 
 -- praktek 13
 -- ambil nama produk dan hitung nilai max dari qty
 
 SELECT nama_produk, MAX(qty) FROM tr_penjualan;
 SELECT nama_produk, MAX(qty) FROM tr_penjualan GROUP BY nama_produk;
 
 -- praktek 14
 -- GROUP BY 
 -- digunakan untuk  mengelompokan isi data jadi satu atau banyak kolom
 -- biasanya di gabung dengan fungsi agregasi
 -- menampilkan nama produk dari hasil pengelompokan nama produk 
 
 SELECT nama_produk FROM tr_penjualan group by nama_produk;
 
 -- praktek 15
 -- menampilkan nama produk dan qty dari hasil kelompok nama produk
 
 SELECT nama_produk, qty FROM tr_penjualan GROUP BY nama_produk, qty;
 
 -- praktek 16
 -- tampilkan semua produk dan total qty terjual
 
 SELECT nama_produk, SUM(qty) FROM tr_penjualan GROUP BY nama_produk;
 
 -- praktek 17 
 -- tampilkan semua produk dan total qty terjual urut dari qty terbanyak
 
 SELECT nama_produk, SUM(qty) FROM tr_penjualan GROUP BY nama_produk ORDER BY SUM(qty) DESC;
 
 -- praktek 18
 -- HAVING 
 -- diguntakan untuk melakukan filtering dari hasil fungsi agregasi dan GROUP BY
 -- ambil nama produk, total qty yang terjual di atas 2
 
 SELECT nama_produk, SUM(qty) FROM tr_penjualan GROUP BY nama_produk HAVING SUM(qty) > 2 ORDER BY SUM(qty) DESC;
 
 -- Latihan mandiri 4
-- a. tampilkan semua kolom dari transaksi yang ada diskon dan urut dari harga tertinggi
select * from tr_penjualan where diskon_persen>0 order by harga desc;

-- b. tampilkan kolom nama produk, qty, dan harga dari transaksi penjualan yang memiliki harga minimal 100k dan diurutkan berdasarkan harga tertinggi
select nama_produk, qty, harga from tr_penjualan where harga>=100000 order by harga desc;

-- c. tampilkan kolom nama produk, qty, harga dari tabel transaksi. harga minimal 100k atau nama produk berawalan karakter T dan urut dari diskon tertinggi
select nama_produk, qty, harga from tr_penjualan where harga>=100000 or nama_produk like 'T%' order by diskon_persen desc;

-- Latihan mandiri 5
-- a. melihat daftar nama produk yang total jumlah produk terjual per kelompok nama produk adalah di atas nilai 4
select nama_produk from tr_penjualan group by nama_produk having sum(qty)>4;

-- b. melihat daftar nama produk yang total jumlah produk terjual per kelompok harus produk sama dengan 9
select nama_produk from tr_penjualan group by nama_produk having sum(qty)=9;

-- c. melihat daftar kelompok nama produk dan total nilai penjualan (harga dikali jumlah, dikurangi diskon) dengan dan urutan berdasarkan nilai penjualan terbesar;
select nama_produk, sum(harga*qty-diskon_persen) as nilai_penjualan from tr_penjualan group by nama_produk order by nilai_penjualan desc;