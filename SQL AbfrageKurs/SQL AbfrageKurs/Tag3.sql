/*
SELECT 
			TOP n / percent with ties
			DISTINCT 
			*
			Sp,
			(Select ..)--darf nur ein Wert rauskommen
			F(),	Mathe, TXT , Zahlen    as ALIAS
			AGG()
FROM  TAB1 A LEFT|RIGHT|INNER JOIN Tab2 B on A.Sp1=B.Sp2
							LEFT|RIGHT|INNER JOIN Tab2 C on C.Sp1=B.Sp2
							LEFT|RIGHT|INNER JOIN Tab2 D on D.Sp1=B.Sp2
							LEFT|RIGHT|INNER JOIN Tab2 Eon E.Sp1=B.Sp2
							LEFT|RIGHT|INNER JOIN Tab2 F  on F.Sp1=B.Sp2  AND OR E.SP2 = C.SP4
							LEFT|RIGHT|INNER JOIN VIEW v1 ON v1.Sp4 = C.sp3
						   LEFT|RIGHT|INNER JOIN #t ON #t.sp5 = D.Sp2
						   LEFT|RIGHT|INNER JOIN (select .....) T ON T.Sp3 = E.Sp2
WHERE
					T.Sp2 = 10 AND | OR #t.sp2 < 100...
					between in like (% _ []
					is null
					not like not in is not
GROUP BY SP		HAVING AGG > 100 with CUBE  | ROLLUP
ORDER BY SP , ALIAS desc

*/


select * from orders
--AVG

--Wie weit weichen die Frachtkosten jeder Bestellung von den durchschnittlichen Frachtkosten ab
--Orderid , freight, Abweichung

select avg(freight) from orders

select orderid,freight, (select avg(freight) from orders) , 
										freight- (select avg(freight) from orders)
from orders


--Liste alle Bestellungen auf, die über den durchsschnittlichen Frachtkosten liegen

select * from orders
where freight > (select avg(freight) from orders)






