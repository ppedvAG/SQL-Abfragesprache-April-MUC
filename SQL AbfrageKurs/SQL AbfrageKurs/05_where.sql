--WHERE

/*

SELECT Sp,....
FROM Tabellen
WHERE ...immer nach FROM 
ORDER BY  ..das letzte
  

WHERE
				Spalten  = Wert                               city = 'München'
				SP  > , <  , >= , <= Wert ..................  freight <= 100
				SP != Wert   | SP <> Wert                City != 'München'
				SP like Wert                                      City like 'München'   City like 'Mü%'
								Wildcards:  % steht für 0  bis unendlich viele Zeichen 
													_ steht für genau ein Zeichen

				SPx between Wert1 and Wert2  -- Grenzen sind inklusive ersetzt Spx >= Wert1 AND Spx <= Wert2
				SPx in ('Wert1', 'Wert2', 'Wert3',...)

				AND | OR
				SP = Wert 
				SP > Wert...

				[ ] steht für genau ein Zeichen, aknn aber Wertebereiche abdecken
				[ABC] [A-C] [0-9]  [A-D|1-4]
				SP like '[ABCD]%'

				

				not like
				not in
				not between

*/

select * from customers where city = 'London'

----Alle Kunden aus England (UK)

select * from customers 
			where 
						country = 'UK'


--Wieviele Bestellungen (orders) haben Freightkosten kleiner 100

select * from orders
			where 
					freight < 100
			order by freight desc

--alle Bestellungen, die nicht von AngNr 8 stammen (employeeid)
select * from orders	
			where 
					EmployeeID != 8

--alle Firmen , die mit A beginnen
select * from customers
		where CompanyName like 'A%'


--alle Firmen, die mit A enden
select * from customers where companyname like '%A'

---alle Firmen, die ein y im Namen haben
select * from customers where CompanyName like '%y%'


----alle Bestellungen, bei den der Bruttofrachtkostenwert unter 100 liegt
select freight, freight *1.19, * from orders where freight * 1.19< 100 
select freight, freight *1.19, * from orders where freight < 100 / 1.19

--alle Bestellungen aus dem Jahr 1997

select * from orders
				where 
							OrderDate like '%1997%' --korrekt, aber mieeeeeeses TSQL


select datepart(yy,orderdate),* from orders
				where 
							datepart(yy,OrderDate) = 1997 --korrekt, aber langsam


select year(orderdate),* from orders
				where 
							year(OrderDate) = 1997 --korrekt, aber langsam
				order by orderdate desc



select year(orderdate),* from orders
				where 
							orderdate > = '1.1.1997' -- 1.1.1997 00:00:00.000
							AND
							orderdate <= '31.12.1997'      --31.12.1997 00:00:00.000    --falsch


select year(orderdate),* from orders
				where 
							orderdate > = '1.1.1997' -- 1.1.1997 00:00:00.000
							AND
							orderdate <= '31.12.1997 23:59:59.999'     --korrektes TSQL, schnell, aber falsche Ergebnis ..auch 1998

select year(orderdate),* from orders
				where 
							orderdate > = '1.1.1997' -- 1.1.1997 00:00:00.000
							AND
							orderdate <= '31.12.1997 23:59:59.997'     --korrektes TSQL, schnell, aber falsche Ergebnis

--LÖSUNG------------
--datentyp : datetime (ms) wird in der DB als int gespeichert
---datetime ist ungenau.. auf ca 2 bis 3 ms genau
---besser : date, ist sowie alles 00:00:00.000

--Kürzere Form

--between
select * from orders
		where
					orderdate between '1.1.1997' and '31.12.1997 23:59:59.997'


--Suche alle Kunden aus dem Land UK oder Italy
select * from customers
	where country = 'UK' or Country = 'Italy'


--Trick.. ist es immer dieselbe Spalte

select * from customers
	where
				country IN ('Italy','U%','USA','France') --keine Wildcard weil Vergleich mit = 

	
----Suche alle Firmen, die A, B , C oder D beginnen
select * from customers
			where companyname like 'A%'
					  OR
					  companyname like 'B%'
					  .....
select * from customers
			where companyname <='D' --DARIA  !!!


select * from customers
			where companyname <'E'  order by 2 asc


select * from customers
			where left(companyname,1) between 'A' AND 'D'


--was wäre wenn	
----Suche alle Firmen, die A, C ,L, M O  oder S beginnen


--alle Zeilen von Order Datails
select * from [Order Details]

select * from customers where CompanyName like '[ABCD]%'


select * from customers where CompanyName like '[ACLMO]%'


--Wunschpin per Website
--tp03
-- 0007  char(4)

--where pin not like '[0-9][0-9][0-9][0-9]'



--0175-34?456?3

select * from customers where customerid like '%L_D'


select * from tabelle
		where  SP > < >= <=!= like in between Wert 
					nur bei Like .. % _ [Bereiche
					AND
					OR   []

--Suche alle Kunden, die im Firmenname ein % haben...
--Problem: die Suche muss mit like arbeiten... das % steht aber für beliebig viele unbekannte

select * from customers where CompanyName like '%%%' --= like  '%'


select * from customers where CompanyName like '%[%]%' --= like  '%'


--suche alle Firmen heraus die ein ' im Namen haben
select * from customers where companyname like '%['']%'


--select * from customers where companyname like '%[']%'--Error

select * from customers where companyname like '%''%'

--Suche alle Bestellungen, die von Kunden stammen mit ABC zu Beginn und STU am Ende der CustId
--und die Frachtkosten sollten Brutto unter 100 liegen
--oder vom Angestellten nur 1,3 oder 5 bearbeitet sein
--318

select * from orders
	where
				(customerid	like	'[ABC]%[STU]'
				AND
				freight			<		100/1.19)
				OR
				employeeid	in (1,3,5) 

select * from orders
	where
				(customerid	like	'[ABC]%[STU]'
				AND
				freight			<		100/1.19)
				OR
				employeeid	in (1,3,5) 

select * from orders
	where
				customerid	like	'[ABC]%[STU]'
				AND
				(freight			<		100/1.19
				OR
				employeeid	in (1,3,5) )

--das AND ist stärker bindend, daher immer Klammern setzen, um das Ergebnis deutlich zu achten


--Suche alle Kunden, deren Region nicht NULL ist
--Suche alle Kunden, deren Region  NULL ist

select  * from customers where region is null




select * from orders



