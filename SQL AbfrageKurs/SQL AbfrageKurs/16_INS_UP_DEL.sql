--INS...

--von einer Tabelle in eine andere
--von einer Tabelle in eine nicht best Tabelle
--manueller Insert


--Daten aus einer Tabelle in eine neue Tabelle

select Sp , 'TXT'  ....   into neueTabelle from tabelle

--Achtung: alle SPalten müssen Namen haben
--Identity und Datentypen wrden übernommen, aber keine PK 

select * into kunden2 from customers

--Datesätze aus einer Tabelle in eine best Tabelle
--gleich viele Spalten ? Reihenfolge

insert into kundeneu
select customerid, CompanyName, country, city from customers where country = 'Brazil'


insert into KundenEU (companyname, City,customerid) values ('PPEDV AG', 'BGH', 'PPED2')



--UPDATE

update tabelle set spalte = Wert, sp2 = Wert where spx = wert
--Achtung: NULL 
update tabelle set sp = NULL

update tabelle set sp = sp*sp2 *3

select * into o1 from orders

--Erhöhe die Frachtkosten um 10 %

update o1 set freight = freight *1.1



--wir erhöhen die Frachtkosten um 10% , bei den Bestellung in o1, bei denen der Kunde aus Germany kommt

--Tipp: zuerst Abfrage, welche DS betroffen sind

select * from o1 inner join customers c on c.customerid = o1.customerid where c.Country = 'Germany'

--formatiere das Statement etwas um
--Select erste Zeile 
--from nächste Zeile

select *
from o1 inner join customers c on c.customerid = o1.customerid where c.Country = 'Germany'

--select auskommentieren

--select *
from o1 inner join customers c on c.customerid = o1.customerid where c.Country = 'Germany'


--update darüber

update o1 set freight = freight * 1.1
--select *
from o1 inner join customers c on c.customerid = o1.customerid where c.Country = 'Germany'

--alle DS aus o1 löschen bei denn das Produkt 11 vorkam

--Welche DS sind betroffen

select * from o1 inner join [Order Details] od on od.OrderID=o1.OrderID where od.ProductID=11

delete from o1
--select *
from o1 inner join [Order Details] od on od.OrderID=o1.OrderID where od.ProductID=11



select * from o1

--lösche die Frachtkosten aus o1 bei der  Bestellung 10250 ---  hihihihihihi

update o1 set freight = NULL where orderid = 10250

select * from o1

















