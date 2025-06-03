-- Nama		: Rezka askananda
-- NIM		: 23241111
-- Kelas	: C
-- Modul	: Modul 3A ORDER BY, Fungsi Agregasi, GROUP BY, HAVING

-- Menggunakan database
use ptic_mart;

-- ORDER BY
-- Mengurutkan data dari sebuah field (kolom) atua hasill olah kolom
-- Praktek 1
-- ambil nama produk dan qty dari table penjualan urutkan berdasarkan qty
select nama_produk,qty from tr_penjualan order by qty; -- urut dari kecil ke besar

-- Praktek 2
-- Ambil nama produk dan qty dari table penjualan urutkan berdasarkan qty dan nama produk
select nama_produk, qty from tr_penjualan order by qty, nama_produk;


-- latihan mandiri 1
-- a. tampilkan semua kolom dari table tr penjualan dengan mengurutkan berdasarkan qty dan tgl_transaksi
select * from tr_penjualan order by qty, tgl_transaksi;

-- b. tampilkan semua kolom dari table ms pelanggan dengan mengurutkan berdasarkan nama_pelanggan
select * from ms_pelanggan order by nama_pelanggan;

-- c. tampilkan semua kolom dari table ms pelanggan dengan mengurutkan berdasarkan alamat
select * from ms_pelanggan order by alamat;


-- ASC (DEFAULT/TIDAK WAJIB)(mengurutkan kecil ke besar), DESC (WAJIB DITULIS)(mengurutkan dari besar ke kecil)
-- Praktek 3
select nama_produk,qty from tr_penjualan order by qty desc;

-- Praktek 4
-- Ambil nama produk, qty dari tr penjualan urut dengan desc dan asc
select nama_produk,qty from tr_penjualan order by qty desc, nama_produk asc;

-- Latihan mandiri 2
-- a. tampilkan semua kolom dari table tr penjualan dengan mengurutkan berdasarkan tgl transaksi secara DESC dan qty secara ASC
select * from tr_penjualan order by tgl_transaksi desc, qty asc;

-- b. tampilkan semua kolom dari table ms_pelanggan dengan mengurutkan berdasarkan nama pelanggan secara DESC
select * from ms_pelanggan order by nama_pelanggan desc;

-- c. tampilkan semua kolom dari table ms_pelanggan dengan mengurutkan berdasarkan alamat secara DESC
select * from ms_pelanggan order by alamat desc;

-- Praktik 5
-- Menggunakan order by dari hasil perhitungan kolom
-- Ambil nama produk, qty, harga dan perkalian qty*harga, urut berdasarkan qty*harga/total
select nama_produk, qty, harga, qty*harga as total from tr_penjualan order by total desc;

-- Latihan mandiri
-- Pengurutan dengan ekspresi total harga menggunakan rumusan jumlah barang dikali harga barang dikurangi diskon
select nama_produk, qty, harga, diskon_persen, (qty * harga - diskon_persen) as total_harga from tr_penjualan order by total_harga desc;