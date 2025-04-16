-- nama : Rezka askananda
-- NIM : 23241111
-- Kelas : C

-- Melihat database yang ada
show DATABASES;

-- memilih database
USE mysql;

-- melihat tabel dalam database mysql
show TABLES;

-- mendeskripsikan sebuah tabel yang dipilih ex, tabel, 'user'
DESCRIBE user;

-- melihat isi tabel user, khusus untuk kolom host, user, password
SELECT Host, User, Password FROM user;