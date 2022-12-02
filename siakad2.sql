Microsoft Windows [Version 10.0.22000.978]
(c) Microsoft Corporation. All rights reserved.

C:\Users\LENOVO>cd "C:\Program Files\PostgreSQL\14\bin"

C:\Program Files\PostgreSQL\14\bin>psql -U postgres -h localhost
Password for user postgres:
psql (14.5)
WARNING: Console code page (437) differs from Windows code page (1252)
         8-bit characters might not work correctly. See psql reference
         page "Notes for Windows users" for details.
Type "help" for help.


-- buat database
postgres=# CREATE DATABASE siakad;
CREATE DATABASE
postgres=# \list
                                              List of databases
    Name     |  Owner   | Encoding |        Collate         |         Ctype          |   Access privileges
-------------+----------+----------+------------------------+------------------------+-----------------------
 informatika | postgres | UTF8     | English_Indonesia.1252 | English_Indonesia.1252 |
 latihan1    | postgres | UTF8     | English_Indonesia.1252 | English_Indonesia.1252 |
 mahasiswa   | postgres | UTF8     | English_Indonesia.1252 | English_Indonesia.1252 |
 postgres    | postgres | UTF8     | English_Indonesia.1252 | English_Indonesia.1252 |
 retail      | postgres | UTF8     | English_Indonesia.1252 | English_Indonesia.1252 |
 siakad      | postgres | UTF8     | English_Indonesia.1252 | English_Indonesia.1252 |
 siswa       | postgres | UTF8     | English_Indonesia.1252 | English_Indonesia.1252 |
 template0   | postgres | UTF8     | English_Indonesia.1252 | English_Indonesia.1252 | =c/postgres          +
             |          |          |                        |                        | postgres=CTc/postgres
 template1   | postgres | UTF8     | English_Indonesia.1252 | English_Indonesia.1252 | =c/postgres          +
             |          |          |                        |                        | postgres=CTc/postgres
(9 rows)

-- buat table
postgres=# \c siakad ;
You are now connected to database "siakad" as user "postgres".
siakad=# CREATE TABLE mahasiswa (nim varchar(10) not null primary key,nama_mhs varchar(30),alamat_mhs varchar(30));
CREATE TABLE
siakad=# CREATE TABLE dosen (NIDN int not null primary key,nama_dosen varchar(50));
CREATE TABLE
siakad=# CREATE TABLE kuliah (kode_makul varchar(10)  not null primary key,nama_makul varchar(30),sks_makul int ,semester_makul int);
CREATE TABLE
siakad=# \d mahasiswa ;
                      Table "public.mahasiswa"
   Column   |         Type          | Collation | Nullable | Default
------------+-----------------------+-----------+----------+---------
 nim        | character varying(10) |           | not null |
 nama_mhs   | character varying(30) |           |          |
 alamat_mhs | character varying(30) |           |          |
Indexes:
    "mahasiswa_pkey" PRIMARY KEY, btree (nim)


siakad=# \d dosen;
                        Table "public.dosen"
   Column   |         Type          | Collation | Nullable | Default
------------+-----------------------+-----------+----------+---------
 nidn       | integer               |           | not null |
 nama_dosen | character varying(50) |           |          |
Indexes:
    "dosen_pkey" PRIMARY KEY, btree (nidn)



siakad=# \d kuliah;
                          Table "public.kuliah"
     Column     |         Type          | Collation | Nullable | Default
----------------+-----------------------+-----------+----------+---------
 kode_makul     | character varying(10) |           | not null |
 nama_makul     | character varying(30) |           |          |
 sks_makul      | integer               |           |          |
 semester_makul | integer               |           |          |
Indexes:
    "kuliah_pkey" PRIMARY KEY, btree (kode_makul)


-- isi nilai table
siakad=# insert into mahasiswa(nim,nama_mhs,alamat_mhs) values ('D0221351','Nurul Inayah','Tande'),('D0221345','Siti Nurhalizah','Majene'),('D0221897','Dina','Polewali');
INSERT 0 3
siakad=# select * from mahasiswa;
   nim    |    nama_mhs     | alamat_mhs
----------+-----------------+------------
 D0221351 | Nurul Inayah    | Tande
 D0221345 | Siti Nurhalizah | Majene
 D0221897 | Dina            | Polewali
(3 rows)

siakad=# insert into dosen(nidn,nama_dosen) values ('0017038904','Dr.Eng.sulfayanti,S.Si.,MT.'),('0924058601','Ir.Sugiarto cokrowibowo,S.Si.,M.T.'),('0005119104','Nahya Nur, S.T., M.Kom.');
INSERT 0 3
siakad=# select * from dosen ;
   nidn    |             nama_dosen
-----------+------------------------------------
  17038904 | Dr.Eng.sulfayanti,S.Si.,MT.
 924058601 | Ir.Sugiarto cokrowibowo,S.Si.,M.T.
   5119104 | Nahya Nur, S.T., M.Kom.
(3 rows)


siakad=# insert into kuliah(kode_makul,nama_makul,sks_makul,semester_makul) values ('INF183219','Aplikasi Komputer',2,3),('INF173319','Pengembangan Multimedia',3,3),('INF123319','Basis Data',2,3);
INSERT 0 3
siakad=# select * from kuliah;
 kode_makul |       nama_makul        | sks_makul | semester_makul
------------+-------------------------+-----------+----------------
 INF183219  | Aplikasi Komputer       |         2 |              3
 INF173319  | Pengembangan Multimedia |         3 |              3
 INF123319  | Basis Data              |         2 |              3
(3 rows)


-- cara update sql 
siakad=# select * from mahasiswa;
   nim    |    nama_mhs     | alamat_mhs
----------+-----------------+------------
 D0221351 | Nurul Inayah    | Tande
 D0221345 | Siti Nurhalizah | Majene
 D0221897 | Dina            | Polewali
(3 rows)

siakad=# UPDATE mahasiswa SET alamat_mhs ='Tande' WHERE nim = 'D0221345';
UPDATE 1
siakad=# select * from mahasiswa;
   nim    |    nama_mhs     | alamat_mhs
----------+-----------------+------------
 D0221351 | Nurul Inayah    | Tande
 D0221897 | Dina            | Polewali
 D0221345 | Siti Nurhalizah | Tande
(3 rows)


siakad=# select * from kuliah;
 kode_makul |       nama_makul        | sks_makul | semester_makul
------------+-------------------------+-----------+----------------
 INF183219  | Aplikasi Komputer       |         2 |              3
 INF173319  | Pengembangan Multimedia |         3 |              3
 INF123319  | Basis Data              |         2 |              3
(3 rows)


siakad=# UPDATE kuliah SET nama_makul ='aplikasi komputer' WHERE kode_makul = 'INF183219';
UPDATE 1
siakad=# select * from kuliah;
 kode_makul |       nama_makul        | sks_makul | semester_makul
------------+-------------------------+-----------+----------------
 INF173319  | Pengembangan Multimedia |         3 |              3
 INF123319  | Basis Data              |         2 |              3
 INF183219  | aplikasi komputer       |         2 |              3
(3 rows)


siakad=# select * from dosen;
   nidn    |             nama_dosen
-----------+------------------------------------
  17038904 | Dr.Eng.sulfayanti,S.Si.,MT.
 924058601 | Ir.Sugiarto cokrowibowo,S.Si.,M.T.
   5119104 | Nahya Nur, S.T., M.Kom.
(3 rows)


siakad=# UPDATE dosen SET nama_dosen ='Dr.Eng.Sulfayanti,S.Si.,MT.' WHERE nidn = 17038904;
UPDATE 1
siakad=# UPDATE dosen SET nama_dosen ='Ir.Sugiarto Cokrowibowo,S.Si.,M.T.' WHERE nidn =  924058601;
UPDATE 1
siakad=# select * from dosen;
   nidn    |             nama_dosen
-----------+------------------------------------
   5119104 | Nahya Nur, S.T., M.Kom.
  17038904 | Dr.Eng.Sulfayanti,S.Si.,MT.
 924058601 | Ir.Sugiarto Cokrowibowo,S.Si.,M.T.
(3 rows)




