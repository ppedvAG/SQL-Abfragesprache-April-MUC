/*

*/

--Abfrage: alle Kunden, die aus UK, Italy, Germany, France sind
--Ausgabe: Customerid, Companyname, Country, city

--Ergebnis in neue Tabelle
drop table kundenEU

select	CustomerID, Companyname, Country, City
into KundenEU
from	customers
where 
			Country in ('UK', 'Italy', 'Germany', 'France ')



select * from kundenEU

--Ziel: Ausgabe aller Kunden / Ausgabe der gmeinsamen Datensätze, / Ausgabe der unterschiedlichen Datensätze


--der UNION verknüpft mehrere Abfragen zu einem Ergebnis
--aber es muss gelten: kompatible Datentypen und es müssen gleich viele SPalten enthalten sein
--UNION macht automatisch distinct 
--will man keinen DIstinct dann UNION ALL
--gib nie UNION alleine an, wenn es keinen doppelten Zeilen gibt
Select 100
UNION
select 200
UNION 
select 300


select 100
UNION 
select 'A' --error

select 'A'
UNION 
select 100 --error


select convert(varchar(50),100)
UNION 
select 'A'


select 100,200
UNION
select 300 --error

select 100,200
UNION
select 300,NULL--ok

--die erste Zeile gibt den Spaltennamen vor
select 100 as SpX
UNION
select 200 as SPY


select 100
union 
select 200
union 
select 100 --fehlt



select 100
union ALL
select 200
union ALL
select 100 --wieder drin


--brauchen eine Liste: alle Städte und Länder in denen wir Kontakte haben und ein Merkmal ob Kunden K oder Angestellter A
--Ausgabe: Companyname / Lastname --- Land --- Stadt  -- Merkmal A oder K

select	companyname as FirmaAng,		country,		city,	'K' as Typ	from customers
UNION ALL
select	lastname ,										country,		city,	 'A'	from employees
order by country, city

select	companyname as FirmaAng,		country,		city,	'K' as Typ	from customers
UNION ALL
select	lastname ,										city,		country,	 'A'	from employees --blöd gelaufen..
order by country, city



--Unterschiede und Gemeinsamkeiten der Tabellen Customers und KundenEU

--gemeinsame Datensätze?..ginge nur wenn man alle Spalten in JOIN vergleicht
select * from 
customers c inner join kundeneu eu on c.CustomerID=eu.CustomerID and c.city = eu.city and eu.country = c.country and c.CompanyName=eu.CompanyName

--besser: intersect gemeinsame Datensätze...
select customerid, companyname, country, city from customers
intersect
select customerid, companyname, country, city from KundenEU


select country  from customers
intersect
select country  from KundenEU


--wie finde ich die unterschiedlichen zeilen?

select customerid, companyname, country, city from customers
except
select customerid, companyname, country, city from KundenEU --60 Zeilen



select customerid, companyname, country, city from KundenEU --nur 2
except
select customerid, companyname, country, city from customers




----Gebe die Bestellungen aus mit den höchsten und niedrigsten Frachtkosten
--  Ausgabe: Orderid, freight , Merkmal hoch und niedrig als ein Ergebnis

--warum macht union Error
select top 1 orderid, freight from orders order by freight asc
UNION ALL
select top 1 orderid, freight from orders order by freight desc


--der order by zählt zum SELECT des UNION 
select top 1 orderid, freight from orders --order by freight asc
UNION ALL
select top 1 orderid, freight from orders 
order by freight desc


--Error: kein order by bei den SELECTs des UNION
select top 1 orderid, freight from orders order by freight asc
UNION ALL
select top 1 orderid, freight from orders order by freight desc



--Error: kein order by bei den SELECTs des UNION
select *, 'low' as Typ	from (select top 1 orderid, freight from orders order by freight asc) t1
UNION ALL
select * , 'high'			from (select top 1 orderid, freight from orders order by freight desc ) t2


--alle Angestellten, die auch dort wohen wo ein Kunden wohnt ohne JOIN  (Landesvergleich)

select * from employees
where country in(select distinct country from Customers)

select * from employees
where city not in(select distinct city from Customers)



select * from (select * from employees) t where country = t.country





