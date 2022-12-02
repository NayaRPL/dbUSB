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


postgres=# \c retail
You are now connected to database "retail" as user "postgres".
retail=# \dt
              List of relations
 Schema |       Name       | Type  |  Owner
--------+------------------+-------+----------
 public | barang           | table | postgres
 public | costomer         | table | postgres
 public | dept_barang      | table | postgres
 public | detail_pembelian | table | postgres
 public | karyawan         | table | postgres
 public | membeli          | table | postgres
 public | suppiler         | table | postgres
(7 rows)


retail=# \d barang
                        Table "public.barang"
   Column    |         Type          | Collation | Nullable | Default
-------------+-----------------------+-----------+----------+---------
 kode_barang | character varying(20) |           | not null |
 id_dept     | character varying(20) |           |          |
 id_supp     | character varying(20) |           |          |
 nama_barang | character varying(50) |           |          |
 jumlah      | integer               |           |          |
 harga       | integer               |           |          |
Indexes:
    "barang_pkey" PRIMARY KEY, btree (kode_barang)
Foreign-key constraints:
    "barang_id_dept_fkey" FOREIGN KEY (id_dept) REFERENCES dept_barang(id_dept)
    "barang_id_supp_fkey" FOREIGN KEY (id_supp) REFERENCES suppiler(id_supp)
Referenced by:
    TABLE "detail_pembelian" CONSTRAINT "detail_pembelian_kode_barang_fkey" FOREIGN KEY (kode_barang) REFERENCES barang(kode_barang)


retail=# select * from barang;
 kode_barang | id_dept | id_supp | nama_barang | jumlah | harga
-------------+---------+---------+-------------+--------+-------
 C02         | B01     | G02     | Kuas        |      2 | 15000
 D03         | B01     | G02     | cat minyak  |      3 | 30000
(2 rows)


retail=# select * from costomer;
 id_cust | id_karyawan |   nama_cust    | alamat |   no_telp
---------+-------------+----------------+--------+-------------
       1 |      126228 | Nurul Inayah   | Majene | 82312011590
       2 |      126229 | Siti Nurhalisa | Tande  | 82312011591
(2 rows)


retail=# select * from dept_barang;
 id_dept | nama_dept
---------+-----------
 B01     | Paniting
 B02     | Hand Tool
(2 rows)


retail=# select * from detail_pembelian;
 id_beli | kode_barang
---------+-------------
 K001    | C02
 D001    | D03
(2 rows)


retail=# select * from karyawan;
 id_karyawan | nama_kar |  alamat  |   no_telp
-------------+----------+----------+-------------
      126228 | Iksan    | Polewali | 85921254662
      126229 | Anwar    | Polewali | 85921254663
(2 rows)


retail=# select * from membeli;
 id_beli | id_cust |  tgl_beli  | total_barang | total_harga
---------+---------+------------+--------------+-------------
 K001    |       1 | 2022-11-26 |            2 |       15000
 D001    |       1 | 2022-11-26 |            3 |       30000
(2 rows)


retail=# select * from suppiler;
 id_supp | nama_supp | alamat
---------+-----------+--------
 G01     | Nifsik    | Cina
 G02     | Facom     | Japan
(2 rows)


retail=#