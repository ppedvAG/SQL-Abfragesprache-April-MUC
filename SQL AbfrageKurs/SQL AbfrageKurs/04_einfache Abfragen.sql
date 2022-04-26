/*

select 'TXT', Zahlen, Mathe, F() as ALIAS
			Spalten, * alle Spalten des From
from Tabelle..oder Tabellenartiges
order by Spalte|ALIAS asc (default)|desc

Customers 91 
orders 830
order details 2155
product 90
employees 9


*/
use Northwind;
GO

select companyname from customers

select * from customers

select companyname, customerid, 100, 'TXT' from customers
select  'TXT' from customers


select companyname, customerid, 100 as beliebZahl , 'TXT'  as dooferText from customers

select freight,(freight *1.19) as Brutto from orders 

select customerid + companyname, customerid, companyname from customers

select * from employees

--gib Vor und Nachname als ein Feld zurück 
select firstname  + ' ' +  lastname from Employees
select firstname  + space(5) +  lastname from Employees

select * from orders
--wieviel Zeit in Tagen liegt zwischen Lieferdatum und zu lieferenden Datum 
--> Ausgabe: orderid , orderdate , shippeddate , requireddate und DiffTage

select 
		OrderID
		, OrderDate
--		, RequiredDate 	, ShippedDate
		, datediff(dd,RequiredDate,ShippedDate)
from orders


--Ergebnis sortieren

select 
		OrderID
		, OrderDate
--		, RequiredDate 	, ShippedDate
		, datediff(dd,RequiredDate,ShippedDate) as DiffTage
from orders
order by Difftage desc



Select Spalten, 'text', Zahlen, Mathe
		Spalte * Spalte , Spalte * Wert AS ALIAS
FROM
		TABELLEN
ORDER BY Spalte [ALIAS] asc|desc, Spalte [ALIAS] asc|desc


select * from orders order by customerid desc, orderdate desc


select 100,* from orders order by 2,5 --nach Spaltenposition sortieren

