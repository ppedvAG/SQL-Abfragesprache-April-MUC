--der IF

IF 1=1 select 100
IF 1=0 select 100

IF (1=0)
	select 100
else
	select 200


IF (select count(*) from customers) > 90
	select 'sind mehr als 90'
else
	select 'sind halt weniger als 90'


IF 1=1
	select 100
	select 400
else
	select 200

select 300


--wenn mehr Statements in einem Teil entahlten sein sollen dann 

--BLOCK
BEGIN 

END


IF 1=0
	BEGIN	select 100	END
else
	BEGIN
		select 200
		select 300
	END



--Falls der der Schnitt er Frachtkosten in o1 unter 80 liegen sollten, dann erhöhen wir die Frachtkosten um 10 %

IF (select avg(freight) from o1) < 80
	begin
	--	    update o1 set freight = 0 where freight is NULL
			update o1 set freight = freight *1.1
	end
else 
	begin
		select 'alles ok .. nix gemacht..'
	end


IF (1=1) OR (1=0)
select 100
else
select 200


IF (1=1) AND (1=0)
select 100
else
select 200



--WHILE 

WHILE Bedingung
	BEGIN
			CODE 
			CODE
			CODE
	END


declare @i as int = 0

while (@i < 10) AND (SELECT ..)
	begin
		select @i
		set @i= @i+1
		select @i
		if @i = 5 break
		---BREAK -- sofortiger stop
		--CONTINUE --- springt zum Schleifeneinstieg
	end





WHILE( Condition )
BEGIN


IF( Condition )
BEGIN

	select 200  

END


END


--Wie hoch ist in o1 aktuell: der Max (Freight), Sum(Freight)
drop table o1
select * into o1 from orders

select max(freight) , sum(freight) from o1

-- 2000   / 100000
--Erhöhe die Frachtkosten um 10 % in o1 solange bis der Max Wert einer Position 2000 erreicht oder die Summe 100000.
--Wichtig aber: die Werte dürfen nicht überschrietten werden

create or alter proc Restoreo1
as
drop table  if exists  o1
select * into o1 from orders

exec restoreo1


select max(freight) , sum(freight)from o1

while			(select max(freight)*1.1 from o1) <= 2000
					AND 
					(select sum(freight) *1.1 from o1) <=100000
	begin
			update o1 set freight = freight *1.1

	end
select max(freight), sum(freight) from o1









create table t1 (id int identity, spx char(4100))

insert into t1 select 'XY'
go 20000

drop table t1


declare @i as int=0
begin tran
while @i < 20000
begin 
insert into t1 (spx) values (@i)
set @i=@i+1
end
commit



---ABC

--case when

select SP, 
			CASE 
					WHEN  Bedingung   THEN Ausgabe
					WHEN Bedingung THEN Azusgabe
					...
					ELSE AUSGABE
			END as SPX
	from tabellen


	select customerid, country, 
													CASE 
																WHEN country in ('Germany', 'Italy', 'France') then 'EU'
																ELSE 'notEU'
													END as EUnotEU
	from customers

	--ABC 
	--Freight < 100 A Kunde
	-- > 500 C Kunde
	-- der Rest B Kunde
	--geht der Reihe nach durch
select orderid, freight, 
												case 
															when freight <100 then 'A Kunde'
															when freight > 500 then 'C Kunde'
															else 'B Kunde'
												end KundenTyp
from orders order by freight desc















