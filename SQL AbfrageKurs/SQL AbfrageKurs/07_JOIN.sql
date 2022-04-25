/*
Ergbnisse aus mehreren Tabellen--> Spalten nebeneinander

INNER JOIN

CROSS JOIN

LEFT JOIN

RIGHT JOIN

FULL JOIN


select *
FROM
			TABELLE1 A INNER|RIGHT|LEFT TABELLE2 B ON A.Spx=B.Spx

select *
FROM
			TABELL21 A INNER|RIGHT|LEFT TABELL1 B ON A.Spx=B.Spx

select *
from tabelle1 A LEFT JOIN Tabelle2 B ON  A.sp = B.Sp
-----            LINKS                 RECHTS  
--von Tab1 alle DS

select *
from tabelle2 B RIGHT JOIN Tabelle1 A ON  A.sp = B.Sp
-----            LINKS                 RECHTS
--von Tab 1 alle DS

*/
select 
			c.CustomerID,c.CompanyName, --Kundendaten
			o.OrderID, o.OrderDate, o.freight --Bestelldaten
from customers c inner join orders o on c.CustomerID=o.CustomerID
order by c.CustomerID, o.OrderDate


select * 
from 
customers inner join orders on customers.customerid = orders.customerid 

select * 
from 
customers c inner join orders o on c.customerid = o.customerid 

--Liste alle BestPositionen und deren Produktbezeichnungen 

select 
		od.*
		,p.ProductName 
from 
		[Order Details] od  inner join products p	on	od.ProductID  =   p.ProductID
		

--es muss nicht immer die ID SPalte sein...
--Alle Kunden, die an einem Ort wohnen, an denen auch ein Ang wohnt


select c.CompanyName, c.city, e.city, e.lastname
from customers c inner join employees e on c.city = e.city
where
				e.city = 'London'




--alle Kunden, die nichts bestellten

select * from customers C left join orders o on c.CustomerID=o.CustomerID
where o.orderid is  null

--Gibts Bestellungen, zu denen kein Kunde existiert

select * from 
						orders o left join customers c on c.CustomerID=o.CustomerID
			where 
						c.CustomerID is null


--als right join
select * from 
						customers c right join orders o on c.CustomerID=o.CustomerID
			where 
						c.CustomerID is null










*/