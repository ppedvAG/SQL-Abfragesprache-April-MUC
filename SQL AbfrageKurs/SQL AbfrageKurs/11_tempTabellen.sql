/*
temp Tabelle != temporal Tables (= verionnierende Tabelle)

temporären Tabellen

#tabelle --lokale temp Tabelle
Lebenszeit:
leben bis der Ersteller sie gelöscht hat oder die Verbindung geschlossen wurde

--Wirkungsradius
die tabelle ist nur in der Sitzung verwendbar wo sie auch erstellt wurde



##tabelle --globale temp Tabelle
leben bis der Ersteller sie gelöscht hat oder die Verbindung geschlossen wurde

--Wirkungsradius
die Tabelle ist auch in anderen Sitzungen verwendbar
laufende Abfragen werden nicht unterbrochen


Wofür:
statt komplexen Code prozeduraler nachvollziehbarer Code
evtl schneller


#tabellen aktualisieren sich nicht

*/

select top 1 orderid, freight from orders order by freight asc
UNION ALL --ERROR
select top 1 orderid, freight from orders order by freight desc


--Weg über 2 #tabelle

select top 1 orderid, freight into #t1 from orders order by freight asc

select top 1 orderid, freight into #t2 from orders order by freight desc


select * from #t1
UNION ALL
select * from #t2

--Weg über 1 #tabelle
set identity_insert dbo.#tx on
select top 1 orderid, freight into #tx from orders order by freight asc

insert into #tx
select top 1 orderid, freight from orders order by freight desc

select * from #tx



--statt dem:
select *, 'low' as Typ	
									from (select top 1 orderid, freight from orders order by freight asc) t1
UNION ALL
select * , 'high'			
								from (select top 1 orderid, freight from orders order by freight desc ) t2



--ABC Analyse : 
--A Kunden : Freight <= 100
--C Kunden:  Freight >= 500
--Rest = B Kunde


--Firma, Frachkosten, Typ (A BC)
--mit UNION ALL

select companyname, freight, 'A' from customers c inner join orders o on c.CustomerID=o.CustomerID		where freight < 100
UNION ALL
select companyname, freight, 'B' from customers c inner join orders o on c.CustomerID=o.CustomerID		where freight between 100 and 500
UNION ALL
select companyname, freight, 'C' from customers c inner join orders o on c.CustomerID=o.CustomerID		where freight > 500

-----mit temp Tabellen
select companyname, freight, 'A' as TYP
into #t1
from customers c inner join orders o on c.CustomerID=o.CustomerID		where freight < 100

insert into #t1
select companyname, freight, 'B' as TYP from customers c inner join orders o on c.CustomerID=o.CustomerID	where freight between 100 and 500

insert into #t1
select companyname, freight, 'C' as TYP from customers c inner join orders o on c.CustomerID=o.CustomerID	where freight >500

select * from #t1

select avg(freight ) from #t1



--was wenn..


select avg(freight) from 
(
						select * from (
						select companyname, freight, 'A' from customers c inner join orders o on c.CustomerID=o.CustomerID		
							where freight <  order by freight asc
					) t1
UNION ALL
select * from 
				(
select companyname, freight, 'B' from customers c inner join orders o on c.CustomerID=o.CustomerID		
			where freight between 100 and 500 order by freight desc
			) t2
UNION ALL
select * from 
			(
select companyname, freight, 'C' from customers c inner join orders o on c.CustomerID=o.CustomerID		
			where freight > 500 order by freight desc
		) t3
	) t4