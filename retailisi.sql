Microsoft Windows [Version 10.0.22000.1335]
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
 retail2     | postgres | UTF8     | English_Indonesia.1252 | English_Indonesia.1252 |
 siakad      | postgres | UTF8     | English_Indonesia.1252 | English_Indonesia.1252 |
 siswa       | postgres | UTF8     | English_Indonesia.1252 | English_Indonesia.1252 |
 template0   | postgres | UTF8     | English_Indonesia.1252 | English_Indonesia.1252 | =c/postgres          +
             |          |          |                        |                        | postgres=CTc/postgres
 template1   | postgres | UTF8     | English_Indonesia.1252 | English_Indonesia.1252 | =c/postgres          +
             |          |          |                        |                        | postgres=CTc/postgres
(10 rows)


postgres=# \c retail;
You are now connected to database "retail" as user "postgres".
retail=# \dt
           List of relations
 Schema |   Name    | Type  |  Owner
--------+-----------+-------+----------
 public | barang    | table | postgres
 public | costomer  | table | postgres
 public | karyawan  | table | postgres
 public | transaksi | table | postgres
(4 rows)


retail=# \d barang;
                        Table "public.barang"
   Column    |         Type          | Collation | Nullable | Default
-------------+-----------------------+-----------+----------+---------
 kode_barang | character varying(20) |           | not null |
 nama_barang | character varying(50) |           |          |
 stok_barang | integer               |           |          |
 harga_jual  | integer               |           | not null |
 harga_beli  | integer               |           | not null |
Indexes:
    "barang_pkey" PRIMARY KEY, btree (kode_barang)
Referenced by:
    TABLE "transaksi" CONSTRAINT "transaksi_kode_barang_fkey" FOREIGN KEY (kode_barang) REFERENCES barang(kode_barang)


retail=# select * from barang;
 kode_barang |  nama_barang   | stok_barang | harga_jual | harga_beli
-------------+----------------+-------------+------------+------------
 DD1         | buku_junal     |           5 |      25000 |      23000
 DD2         | buku_kuintansi |          10 |       5000 |       2000
 DD4         | kertas_karton  |          10 |       3000 |       1500
 DD5         | tempat_pensil  |           5 |      25000 |      23000
 DD3         | gunting        |           5 |       5000 |       3000
 DD6         | buku_gambar    |          10 |       5000 |       2000
 DD7         | lem_fox        |           7 |       7000 |       5000
 DD8         | klip_tembak    |           5 |      25000 |      20000
 DD9         | binder         |           5 |       5000 |       3000
 DD10        | mading         |          10 |       5000 |       2000
 DD11        | sticky note    |           7 |      12000 |       8000
 DD12        | lem            |           5 |      12000 |      10000
 DD13        | penggaris      |           5 |       5000 |       3000
 DD14        | eraser         |          10 |       5000 |       2000
 DD15        | pensil_warna   |           7 |       7000 |       5000
(15 rows)


retail=# \d karyawan;
                       Table "public.karyawan"
   Column    |         Type          | Collation | Nullable | Default
-------------+-----------------------+-----------+----------+---------
 id_karyawan | integer               |           | not null |
 nama_kar    | character varying(50) |           |          |
 alamat      | character varying(50) |           |          |
 no_telp     | character varying(14) |           |          |
Indexes:
    "karyawan_pkey" PRIMARY KEY, btree (id_karyawan)
Referenced by:
    TABLE "costomer" CONSTRAINT "costomer_id_karyawan_fkey" FOREIGN KEY (id_karyawan) REFERENCES karyawan(id_karyawan)


retail=# select * from karyawan;
 id_karyawan | nama_kar |  alamat   |   no_telp
-------------+----------+-----------+-------------
      126228 | Iksan    | Polewali  | 85921254662
      126229 | Anwar    | Polewali  | 85921254663
     1262556 | lisa     | tande     | 85871254662
      165556 | dina     | tande     | 85071254662
      127556 | fika     | majene    | 85889254662
     1263556 | lina     | makassar  | 85891254662
      165256 | dia      | mamuju    | 85074354662
      174556 | tika     | majene    | 85881254662
      976556 | salsa    | majene    | 8588354662
      176556 | nina     | polewali  | 85867254662
     1263356 | luna     | makassar  | 85891254661
      163256 | dian     | mamuju    | 85074304662
      106556 | tila     | tinambung | 85881267662
      576556 | andre    | majene    | 8588334662
      171156 | mita     | polewali  | 85767254662
(15 rows)


retail=# \d costomer;
                       Table "public.costomer"
   Column    |         Type          | Collation | Nullable | Default
-------------+-----------------------+-----------+----------+---------
 id_cust     | integer               |           | not null |
 id_karyawan | integer               |           |          |
 nama_cust   | character varying(50) |           |          |
 alamat      | character varying(50) |           |          |
 no_telp     | character varying(14) |           |          |
Indexes:
    "costomer_pkey" PRIMARY KEY, btree (id_cust)
Foreign-key constraints:
    "costomer_id_karyawan_fkey" FOREIGN KEY (id_karyawan) REFERENCES karyawan(id_karyawan)
Referenced by:
    TABLE "transaksi" CONSTRAINT "transaksi_id_cust_fkey" FOREIGN KEY (id_cust) REFERENCES costomer(id_cust)


retail=# select * from costomer;
 id_cust | id_karyawan |   nama_cust    |  alamat  |   no_telp
---------+-------------+----------------+----------+-------------
       1 |      126228 | Nurul Inayah   | Majene   | 82312011590
       2 |      126229 | Siti Nurhalisa | Tande    | 82312011591
       3 |      171156 | awaluddin      | mejene   | 82312011592
       4 |      576556 | nurmadina      | mejene   | 82412011592
       5 |      176556 | nurlina        | polewali | 82512011592
       6 |      163256 | siti lutfiah   | mejene   | 82312011492
       7 |      163256 | siti           | mejene   | 82312011192
       8 |      171156 | najwa          | mejene   | 82312011592
       9 |      576556 | aisya          | mejene   | 82412011592
      10 |      176556 | rahma          | polewali | 82512011592
      11 |      171156 | uddin          | mejene   | 82312011592
      12 |      576556 | nurmina        | mejene   | 82412011592
      13 |      176556 | nur            | polewali | 82512011592
      14 |      163256 | siti lutfi     | mejene   | 82312011492
      15 |      163256 | nunung         | mejene   | 82312011192
(15 rows)


retail=# \d transaksi;
                       Table "public.transaksi"
    Column    |         Type          | Collation | Nullable | Default
--------------+-----------------------+-----------+----------+---------
 id_beli      | character varying(20) |           | not null |
 id_cust      | integer               |           |          |
 tgl_beli     | date                  |           |          |
 kode_barang  | character varying(20) |           |          |
 total_barang | integer               |           |          |
 total_jual   | integer               |           |          |
Indexes:
    "transaksi_pkey" PRIMARY KEY, btree (id_beli)
Foreign-key constraints:
    "transaksi_id_cust_fkey" FOREIGN KEY (id_cust) REFERENCES costomer(id_cust)
    "transaksi_kode_barang_fkey" FOREIGN KEY (kode_barang) REFERENCES barang(kode_barang)


retail=# select * from transaksi;
 id_beli | id_cust |  tgl_beli  | kode_barang | total_barang | total_jual
---------+---------+------------+-------------+--------------+------------
 TR1     |       1 | 2022-12-10 | DD2         |            2 |      10000
 TR3     |       1 | 2022-12-10 | DD1         |            1 |      25000
 TR2     |       2 | 2022-12-10 | DD14        |            2 |      10000
 TR4     |       3 | 2022-12-10 | DD3         |            1 |       5000
 TR5     |       9 | 2022-12-10 | DD6         |            2 |      10000
 TR6     |       6 | 2022-12-10 | DD2         |            2 |      10000
 TR7     |       2 | 2022-12-10 | DD1         |            1 |      25000
 TR8     |       1 | 2022-12-10 | DD8         |            1 |      25000
 TR9     |       2 | 2022-12-10 | DD3         |            1 |       5000
 TR10    |       4 | 2022-12-10 | DD6         |            2 |      10000
 TR111   |       8 | 2022-12-10 | DD2         |            2 |      10000
 TR13    |       8 | 2022-12-10 | DD1         |            1 |      25000
 TR12    |       4 | 2022-12-10 | DD14        |            5 |      10000
 TR14    |       7 | 2022-12-10 | DD3         |            1 |       5000
 TR15    |       8 | 2022-12-10 | DD3         |            2 |      10000
(15 rows)


retail=# select * from barang;
 kode_barang |  nama_barang   | stok_barang | harga_jual | harga_beli
-------------+----------------+-------------+------------+------------
 DD1         | buku_junal     |           5 |      25000 |      23000
 DD2         | buku_kuintansi |          10 |       5000 |       2000
 DD4         | kertas_karton  |          10 |       3000 |       1500
 DD5         | tempat_pensil  |           5 |      25000 |      23000
 DD3         | gunting        |           5 |       5000 |       3000
 DD6         | buku_gambar    |          10 |       5000 |       2000
 DD7         | lem_fox        |           7 |       7000 |       5000
 DD8         | klip_tembak    |           5 |      25000 |      20000
 DD9         | binder         |           5 |       5000 |       3000
 DD10        | mading         |          10 |       5000 |       2000
 DD11        | sticky note    |           7 |      12000 |       8000
 DD12        | lem            |           5 |      12000 |      10000
 DD13        | penggaris      |           5 |       5000 |       3000
 DD14        | eraser         |          10 |       5000 |       2000
 DD15        | pensil_warna   |           7 |       7000 |       5000
(15 rows)


retail=# select * from barang, harga_jual-harga_beli AS keuntungan from barang;
ERROR:  syntax error at or near "-"
LINE 1: select * from barang, harga_jual-harga_beli AS keuntungan fr...
                                        ^
retail=# select kode_barang, nama_barang,stok_barang,harga_jual-harga_beli AS keuntungan FROM barang;
 kode_barang |  nama_barang   | stok_barang | keuntungan
-------------+----------------+-------------+------------
 DD1         | buku_junal     |           5 |       2000
 DD2         | buku_kuintansi |          10 |       3000
 DD4         | kertas_karton  |          10 |       1500
 DD5         | tempat_pensil  |           5 |       2000
 DD3         | gunting        |           5 |       2000
 DD6         | buku_gambar    |          10 |       3000
 DD7         | lem_fox        |           7 |       2000
 DD8         | klip_tembak    |           5 |       5000
 DD9         | binder         |           5 |       2000
 DD10        | mading         |          10 |       3000
 DD11        | sticky note    |           7 |       4000
 DD12        | lem            |           5 |       2000
 DD13        | penggaris      |           5 |       2000
 DD14        | eraser         |          10 |       3000
 DD15        | pensil_warna   |           7 |       2000
(15 rows)


retail=# select kode_barang, nama_barang,stok_barang,harga_jual,harga_beli,harga_jual-harga_beli AS keuntungan FROM barang;
 kode_barang |  nama_barang   | stok_barang | harga_jual | harga_beli | keuntungan
-------------+----------------+-------------+------------+------------+------------
 DD1         | buku_junal     |           5 |      25000 |      23000 |       2000
 DD2         | buku_kuintansi |          10 |       5000 |       2000 |       3000
 DD4         | kertas_karton  |          10 |       3000 |       1500 |       1500
 DD5         | tempat_pensil  |           5 |      25000 |      23000 |       2000
 DD3         | gunting        |           5 |       5000 |       3000 |       2000
 DD6         | buku_gambar    |          10 |       5000 |       2000 |       3000
 DD7         | lem_fox        |           7 |       7000 |       5000 |       2000
 DD8         | klip_tembak    |           5 |      25000 |      20000 |       5000
 DD9         | binder         |           5 |       5000 |       3000 |       2000
 DD10        | mading         |          10 |       5000 |       2000 |       3000
 DD11        | sticky note    |           7 |      12000 |       8000 |       4000
 DD12        | lem            |           5 |      12000 |      10000 |       2000
 DD13        | penggaris      |           5 |       5000 |       3000 |       2000
 DD14        | eraser         |          10 |       5000 |       2000 |       3000
 DD15        | pensil_warna   |           7 |       7000 |       5000 |       2000
(15 rows)


retail=# harga_beli