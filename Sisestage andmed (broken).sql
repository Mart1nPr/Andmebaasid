create database hobune;
use hobune;

/*Töötab*/
insert into omanik(id, Nimi, Aadress) values (1, "Urmo", "Tall 27");
/*Ei tööta*/
insert into hobune(id, Nimi, Omanik_id, Tall_id, Treeningprogrammid) values (2, "Obene", 1, 3, 4);
/*Töötab*/
insert into tall(id, Nimi, Aadress) values (3, "Tallike", "Tall 27");
/*Töötab*/
insert into treeningprogramm(idTreeningprogramm, Nimi, Kirjeldus) values (4, "Obene", "Treenis kündmise jaoks");
/*Ei tööta*/
insert into treening(id, Kirjeldus, Kuupäev, Hobuseid) values (5, "Hüppas üle tõkete", "03-10-2024", 2);
/*Ei tööta*/
insert into ülevaatus (ülevaatusid, Vaktsineerimine, Kirjeldus, Kuupäev, Hobuseid) values (6, "Tehtud", "Hobune on korras", "03.10.2024", 2);

select * from omanik;
select * from hobune;
select * from tall;
select * from treeningprogramm;
select * from treening;
select * from ülevaatus;

SHOW WARNINGS;



