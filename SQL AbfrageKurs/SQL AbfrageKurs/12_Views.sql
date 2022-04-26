--VIEWS

/*

..sind gemerkte Abfragen
Sichten werden wie Tabellen behandelt: SEL INS UP DEL JOIN

Wofür:
komplexe Abfragen zu vereinfachen
immer aktuelle Daten
komfortabel


Schlechtes


*/

select * from (select * from orders where freight < 100) t
where t.customerid = 'ALFKI'

create view vT1
as
select * from orders where freight < 100


select * from vT1 where CustomerID= 'ALFKI'


--Abfrage customerid, Firma, Land ,Stadt des Kunden + Orderid, Freight , orderdate, + Quantity, Unitprice  + productname, productid + Lastname , Employeeid + Kategoriename

CREATE OR ALTER view vKundeUmsatz 
as
select 
		c.customerid, c.companyname, c.country, c.city,
		o.orderid, o.freight, o.orderdate,
		e.lastname,
		od.unitprice, od.quantity, (od.unitprice* od.quantity) as PosSumme,
		p.productname, p.productid,
		cat.categoryname
from 
		customers c inner join orders o					on c.CustomerID	=	o.CustomerID
							 inner join [Order Details] od	on od.OrderID		=	o.OrderID
							 inner join Products P				on P.ProductID		=	od.ProductID
							 inner join Categories cat			on cat.CategoryID	=	p.CategoryID
							 inner join Employees e			on e.EmployeeID	= o.EmployeeID


select distinct  companyname, ProductName from vKundeUmsatz
STRG + SHIFT + R


select * from vKundeUmsatz where PosSumme > 3000

--alle Kunden aus Frankreich


select distinct companyname from vKundeUmsatz where country = 'France'
select companyname from customers where country = 'France'



create table slf (id int, stadt int, land int)

insert into slf 
select 1,10,100
UNION ALL
select 2,20,200
UNION ALL
select 3,30,300

select * from slf


create view vslf
as
select * from slf --tu das nicht !!!


select * from vslf


alter table slf add fluss int
update slf set fluss = id * 1000

--Abfrage auf Sicht
select * from slf --tu das nicht !!!


select * from vslf --Fluss fehlt .. schei** auf Stern

alter table slf drop column stadt

select * from vslf  --nicht exit Spalte Stadt mit Werten von Land
select * from slf



select * from slf


create view vslf1 with schemabinding --zwingt zum genauen Schreiben 
as
select id from dbo.slf --tu das nicht !!!


drop view vslf