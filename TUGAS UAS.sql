-- nama : Rezka askananda
-- nim : 23241111
-- prodi : pti IV/C

use ptic_mart;

-- soal 1
-- munculkan kode pelanggan, nama produk , qty , harga dan total 
-- dari semua produk yang pernah di transaksikan, 
-- namun output yang diminta adalah total harga minimal 200.000 dan urutkan berdasarkan harga terkecil

select kode_pelanggan,nama_produk, qty, harga, qty*harga as total from tr_penjualan
 where harga >= 200.000 order by total asc;
 
-- soal 2
-- tampilkan nama produk, kategori, dan harga dari semua produk yang tidak pernah terjual
select nama_produk, kategori_produk, harga
from ms_produk;

-- soal 3
-- munculkan kode pelanggan, nama pelanggan, alamat, dan nilai transaksi 
-- dari pelanggan yang paling tinggi nilai transaksinya

select kode_pelanggan, nama_pelanggan, alamat 