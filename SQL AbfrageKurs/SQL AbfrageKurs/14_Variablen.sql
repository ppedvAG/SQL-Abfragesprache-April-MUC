--Variablen

/*
@var  lokale Variable

Lebensdauer
existiert nur während des Batches (GO)

Wirkungsradius
nur in der Erstellersitzung


@@var globale Variable
existiert nur während des Batches (GO)

Lebensdauer

Wirkungsradius
in allen Sitzungen vorhanden
*/


declare @var as int
select @var
set @var = 100
select @var



declare @var as int
select @var
set @var = 100
GO
select @var



select @@ERROR ,@@CPU_BUSY, @@


declare @var2 as int = 0
select @var2
set @var2 = @var2+3
select @var2 = @var2 +2
select @var2
set @var2 = 100


--Zuweise mit Wert aus DB
declare @var3 as int
select top 1 @var3=freight from orders
select @var3

--kein gleichzeitiges Zuweisen und Ausgeben
declare @var3 as int
select top 1 @var3=freight, freight from orders
select @var3

--Wie hoch ist die Abweicheichung der Frachtkoste pro Bestellung vom Schnitt

select orderid,freight, (select avg(freight) from orders) , 
										freight- (select avg(freight) from orders)
from orders


declare		@schnitt as money
select			@schnitt = avg(freight) from orders where shipcountry = 'UK'



select orderid,freight, @schnitt , 
										freight- @schnitt
from orders
where freight > @schnitt

select orderid,freight, (select avg(freight) from orders where shipcountry = 'UK') , 
										freight- (select avg(freight) from orders where shipcountry = 'UK')
from orders
where freight > (select avg(freight) from orders where shipcountry = 'UK')


