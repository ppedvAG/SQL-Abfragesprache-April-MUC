--TOP.. die ersten 3 oder n Datensätze
--eigtl TOP immer mit order by verknüpfen, sonst "Zufallsergebnis"

Select top 3 * from customers
select top 3 percent * from customers

select top 5 * from customers order by city

--die ersten 13 Bestellungen nach Frachtkosten aufsteigend
select top 13 with ties --mit Krawatte
		freight as Fracht ,* 
from 
		orders 
order by 
		freight asc


--DISTINCT filtert aus der Ergebnismenge doppelte Zeilen heraus
select customerid , country from customers --91

select distinct customerid , country from customers--91


select  distinct  country from customers--71

select distinct country, city from customers
--welche Kunden hatten Seafood gekauft

select  distinct 
			c.CompanyName--,p.ProductName, e.lastname
from  customers c 
								inner join orders o					on c.CustomerID	=	o.CustomerID
						  		inner join [Order Details] od	on od.OrderID		=	o.OrderID
								inner join Products p				on p.ProductID	  =	od.ProductID
								inner join Employees e				on e.EmployeeID =o.employeeid
								inner join Categories cat			on cat.CategoryID=p.CategoryID
where cat.CategoryName = 'Seafood'
ORDER BY c.CompanyName


