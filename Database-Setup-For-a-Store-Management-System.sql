mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sakila             |
| storedb            |
| sys                |
| test3              |
| world              |
+--------------------+
8 rows in set (0.01 sec)

mysql> use storedb;
Database changed
mysql> show tables;
Empty set (0.00 sec)

mysql> create table clients (
    -> id_client int primary key,
    -> nom varchar(15),
    -> prenom varchar(15),
    -> email varchar (30),
    -> adresse varchar(30),
    -> telephone int
    -> );
Query OK, 0 rows affected (0.01 sec)

mysql> show tables;
+-------------------+
| Tables_in_storedb |
+-------------------+
| clients           |
+-------------------+
1 row in set (0.00 sec)

mysql> desc clients;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| id_client | int         | NO   | PRI | NULL    |       |
| nom       | varchar(15) | YES  |     | NULL    |       |
| prenom    | varchar(15) | YES  |     | NULL    |       |
| email     | varchar(30) | YES  |     | NULL    |       |
| adresse   | varchar(30) | YES  |     | NULL    |       |
| telephone | int         | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
6 rows in set (0.01 sec)

mysql> create table produits (
    -> id_produits int  primary key,
    -> nom varchar(15),
    -> description varchar(50),
    -> prix float ,
    -> stock int
    -> );
Query OK, 0 rows affected (0.03 sec)

mysql> show tables;
+-------------------+
| Tables_in_storedb |
+-------------------+
| clients           |
| produits          |
+-------------------+
2 rows in set (0.00 sec)

mysql> desc produits;
+-------------+-------------+------+-----+---------+-------+
| Field       | Type        | Null | Key | Default | Extra |
+-------------+-------------+------+-----+---------+-------+
| id_produits | int         | NO   | PRI | NULL    |       |
| nom         | varchar(15) | YES  |     | NULL    |       |
| description | varchar(50) | YES  |     | NULL    |       |
| prix        | float       | YES  |     | NULL    |       |
| stock       | int         | YES  |     | NULL    |       |
+-------------+-------------+------+-----+---------+-------+
5 rows in set (0.00 sec)
mysql> create table commandes (
    -> id_commande int primary key,
    -> id_client int ,
    -> date_commande date ,
    -> statut varchar(10),
    -> total float ,
    -> foreign key (id_client) references clients(id_client),
    -> constraint check_statut check (statut in ('en cours','livree','annulee'))
    -> );
Query OK, 0 rows affected (0.08 sec)

mysql> desc commandes;
+---------------+-------------+------+-----+---------+-------+
| Field         | Type        | Null | Key | Default | Extra |
+---------------+-------------+------+-----+---------+-------+
| id_commande   | int         | NO   | PRI | NULL    |       |
| id_client     | int         | YES  | MUL | NULL    |       |
| date_commande | date        | YES  |     | NULL    |       |
| statut        | varchar(10) | YES  |     | NULL    |       |
| total         | float       | YES  |     | NULL    |       |
+---------------+-------------+------+-----+---------+-------+
5 rows in set (0.00 sec)

mysql> alter table commandes
    -> alter column statut set default 'en cours'
    -> ;
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc commandes;
+---------------+-------------+------+-----+----------+-------+
| Field         | Type        | Null | Key | Default  | Extra |
+---------------+-------------+------+-----+----------+-------+
| id_commande   | int         | NO   | PRI | NULL     |       |
| id_client     | int         | YES  | MUL | NULL     |       |
| date_commande | date        | YES  |     | NULL     |       |
| statut        | varchar(10) | YES  |     | en cours |       |
| total         | float       | YES  |     | NULL     |       |
+---------------+-------------+------+-----+----------+-------+
5 rows in set (0.00 sec)
