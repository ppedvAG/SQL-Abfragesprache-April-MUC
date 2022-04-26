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



--CROSS JOIN
--

--jeder DS mit jedem DS der anderen verknüpfen

select * from customers cross join orders

--FULL JOIN
--= LEFT UND RIGHT JOIN
select * from customers c full join orders o on c.CustomerID=o.CustomerID

select * from customers c  join orders o on c.CustomerID=o.CustomerID










--JOINS über mehr Tabellen

select * from Tabelle1 A inner join Tabelle2 B on A.Sp1 = B.Sp2
									   inner join Tabelle3 C on C.Sp3 = B.Sp2
									   inner join Tabelle4 D on D.sp5 = A.sp5
									   inner join Tabelle5 E on E.sp2 = D.sp6

--Liste aller Firmen und der Produkte, die sie kauften


select 
			c.CompanyName,p.ProductName
from  customers c inner join orders o					on c.CustomerID	=	o.CustomerID
							  inner join [Order Details] od on od.OrderID		=	o.OrderID
							  inner join Products p				on p.ProductID	=	od.ProductID
ORDER BY c.CompanyName


--Welcher Angestellte hat welchen Kunden, welches Produkt verkauft

select 
			c.CompanyName,p.ProductName, e.lastname
from  customers c 
							inner join orders o					on c.CustomerID	=	o.CustomerID
						  	 inner join [Order Details] od on od.OrderID		=	o.OrderID
							  inner join Products p				on p.ProductID	=	od.ProductID
							  inner join Employees e on e.EmployeeID=o.employeeid
ORDER BY c.CompanyName


--Welcher Kunden hat Seafood gekauft
select top 10 * from Categories



select 
			c.CompanyName--,p.ProductName, e.lastname
from  customers c 
								inner join orders o					on c.CustomerID	=	o.CustomerID
						  		inner join [Order Details] od	on od.OrderID		=	o.OrderID
								inner join Products p				on p.ProductID	  =	od.ProductID
								inner join Employees e				on e.EmployeeID =o.employeeid
								inner join Categories cat			on cat.CategoryID=p.CategoryID
where cat.CategoryName = 'Seafood'
ORDER BY c.CompanyName
