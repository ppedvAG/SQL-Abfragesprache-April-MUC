--AGGREGATE: 
--MIN() MAX() COUNT()  SUM() AVG()

select ....
from ..join
where ...
group by...
order by...

--Anzahl... NULL werden ignoriert
select count(*), count(customerid) , count(region)from customers --91

select  distinct count(country) from customers --91
select  count(distinct country) from customers  --21

--für den Fall ,dass NULL gezählt werden soll dann muss aus der NULL was anderen wie zb 0 werden
select isnull(region, 0) , region from customers
select count(isnull(region, 0)) from customers


--Liste mit dem max/min/durchschnitt/summe der Frachtkosten

select min(freight) as MINFracht, Max(freight) as MAXFracht, sum(freight) as SUMFracht, avg(freight) as AVGFracht 
from orders

select customerid, freight from orders
order by customerid

--Aggregat pro 

select customerid, sum(freight) from orders
group by customerid
order by customerid


--Wieviele Kunden gibt es pro Land.. Customers
select country , count(*) from customers
group by country
order by 2 desc


--Wieviele Kunden gibt es pro Stadt in einem Land?

select country, city, count(*) 
from customers
group by country, city--alles aus dem SELECT .. aber ALIAS und AGG entfernen ..fertig
order by 1,2

--Wie hoch sind die Rechnugssumme der Bestellungen

--Orderid , RngSumme
select * from [Order Details]

select orderid, sum(unitprice*quantity) as RngSumme
from [Order Details]
group by orderid

select orderid , sum(Possumme) as RngSumme from vKundeUmsatz
group by orderid
order by orderid


--Wie hoch ist der Umsatz pro Kunde?
select companyname , sum(unitprice*quantity) as Umsatz
from 
		customers c inner join		orders o					on c.customerid	= o.customerid
							inner join		[Order Details] od	on od.orderid		= o.orderid
group by companyname order by 2

select companyname, sum(possumme) 
from vKundeUmsatz 
group by companyname order by 2



--
--Wir brauchen aber nur die wo, die wo ein Umsatz haben der wo größer als wie 50000 ist
select companyname , sum(unitprice*quantity) as Umsatz
from 
		customers c inner join		orders o					on c.customerid	= o.customerid
							inner join		[Order Details] od	on od.orderid		= o.orderid
group by companyname order by 2


---> FROM--> JOIN --> WHERE-->  GROUP BY  --> HAVING-->SELECT(Alias, Mathe) --> Order BY --> TOP DISTINCT--> Ausgabe
select companyname , sum(unitprice*quantity) as Umsatz
from 
		customers c inner join		orders o					on c.customerid	= o.customerid
							inner join		[Order Details] od	on od.orderid		= o.orderid
group by companyname having sum(unitprice*quantity)> 50000
order by 2

--das Having ist das where für Aggregate
--tu folgenes nie: tu nie etwas mit having filtern , was ein where kann
--oder so: im having stehen immer nur AGG


--wer ist der fleissigste und der schlechteste Angestellen nach Umsatz
select * from 
(
			select top 1 lastname as Nachname , sum(unitprice*quantity) as Umsatz
			from employees e 
											inner join orders o					on  o.EmployeeID	=e.EmployeeID
											inner join [Order Details] od	on od.orderid			= o.OrderID
			group by lastname  order by Umsatz asc
) t
UNION ALL
select * from 
(
			select top 1 lastname as Nachname , sum(unitprice*quantity) as Umsatz
			from employees e 
											inner join orders o					on  o.EmployeeID	=e.EmployeeID
											inner join [Order Details] od	on od.orderid			= o.OrderID
			group by lastname  order by Umsatz desc
	) t2



select top 1 lastname as Nachname , sum(unitprice*quantity) as Umsatz
into #t1
from employees e 
								inner join orders o					on  o.EmployeeID	=e.EmployeeID
								inner join [Order Details] od	on od.orderid			= o.OrderID
group by lastname  order by Umsatz desc


insert into #t1
select top 1 lastname as Nachname , sum(unitprice*quantity) as Umsatz
from employees e 
								inner join orders o					on  o.EmployeeID	=e.EmployeeID
								inner join [Order Details] od	on od.orderid			= o.OrderID
group by lastname  order by Umsatz asc

select * from #t1



--Anzahl der Kunden pro Land, aber auch pro Stadt , aber auch weltweit

select country, city , count(*) from customers group by country, city

with rollup order by 1,2


WHILE( Condition )
BEGIN

select country, city , count(*) from customers group by country, city with cube order by 1,2 

END












