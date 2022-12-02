
siakad=# select * from dosen;
   nidn    |             nama_dosen
-----------+------------------------------------
   5119104 | Nahya Nur, S.T., M.Kom.
  17038904 | Dr.Eng.Sulfayanti,S.Si.,MT.
 924058601 | Ir.Sugiarto Cokrowibowo,S.Si.,M.T.
(3 rows)

siakad=# DELETE FROM dosen WHERE nidn = 924058601;
DELETE 1
siakad=# select * from dosen;
   nidn   |         nama_dosen
----------+-----------------------------
  5119104 | Nahya Nur, S.T., M.Kom.
 17038904 | Dr.Eng.Sulfayanti,S.Si.,MT.
(2 rows)


siakad=# select * from mahasiswa;
   nim    |    nama_mhs     | alamat_mhs
----------+-----------------+------------
 D0221351 | Nurul Inayah    | Tande
 D0221897 | Dina            | Polewali
 D0221345 | Siti Nurhalizah | Tande
(3 rows)


siakad=# DELETE FROM mahasiswa WHERE nim= 'D0221897';
DELETE 1
siakad=# select * from mahasiswa;
   nim    |    nama_mhs     | alamat_mhs
----------+-----------------+------------
 D0221351 | Nurul Inayah    | Tande
 D0221345 | Siti Nurhalizah | Tande
(2 rows)


siakad=# select * from kuliah;
 kode_makul |       nama_makul        | sks_makul | semester_makul
------------+-------------------------+-----------+----------------
 INF173319  | Pengembangan Multimedia |         3 |              3
 INF123319  | Basis Data              |         2 |              3
 INF183219  | aplikasi komputer       |         2 |              3
(3 rows)


siakad=# DELETE FROM kuliah WHERE kode_makul= 'INF183219';
DELETE 1
siakad=# select * from kuliah;
 kode_makul |       nama_makul        | sks_makul | semester_makul
------------+-------------------------+-----------+----------------
 INF173319  | Pengembangan Multimedia |         3 |              3
 INF123319  | Basis Data              |         2 |              3
(2 rows)


siakad=#