/*
SELECT 
			F() ,
			Spalte1, Spalte2,...
			'Text', Zahl, Datum [as]! ALIAS
			Mathe
FROM 
		  Tabelle1 A inner|left|right join Tabelle2 B ON A.Sp1 = B.Sp2
WHERE
		   A.Sp3  = > < <= >= != IN BETWEEN   
		            like    
							%  beliebiger Text
							_   genau unbekanntes Zeichen
							[]  Wertebereich steht für ein Zeichen
			  not like in between
			  AND | OR -....... AND wird vor OR gebunden ausser man setzt Klammern
ORDER BY 
				Sp asc (default), Sp2 desc ..... Positionen order by 2,5 desc

where stadt in ('A','B', 'C')
where Datum >=1.1.1980 AND 30.6.1990
*/

select c.City, o.Freight as Fracht
from customers c inner join orders o ON c.CustomerID=o.CustomerID
where c.city like 'L%' and Fracht < 100 --Error
order by c.Country, Fracht


--Logische Fluss:
---> FROM--> JOIN --> WHERE--> SELECT(Alias, Mathe)--> Order BY --> Ausgabe

--Welche Kunden haben 1997 welche Bestellungen gemacht
-- Firma, Country, City, BestNr, Frachtkosten 


select 'TXT', 100


select customerid, companyname from customers C




select 
			c.CompanyName,c.Country,c.City,		--Kunden
			o.OrderID, o.Freight							--Bestellungen
from Customers c inner join orders o on c.CustomerID=o.CustomerID
where
			year(o.OrderDate) =1997





