/*
Prozedur hat meist komplette Businesslogik
..sind schneller


Prozeduren sin dnur ausführbar.. exec proc 
sind nicht direkt kombinierbar mit SELECT (zb Joinen)

create proc gpName @par int, @par2 int,...
as
CODE (INS UP DEL SELECT  EXEC...)
GO

*/

select * from orders where orderid = 10000

create procedure gpDemo1
as
Code...

create or alter proc gpDemo1
as
select 100*200
select 300
select * into #t from orders
select * from #t where orderid < 10250


exec gpDemo1

--Paramter

create proc gpdemo2 @par1 int, @par2 int
as
select @par1*@par2
select * from orders where freight < @par1

exec gpdemo2 70,2


exec gpKunden 'UK'

create or alter proc gpKunden @Land varchar(50)
as
select * from customers where country = @Land


--Prozedure anpassen, damit alle mit a beginnend zb gefunden werden
exec gpKunden 'AR' 


create or alter proc gpKunden @Land varchar(50) ='%'
as
select * from customers where country like @Land + '%'



create or alter proc gpdemo3 
as
select getdate()
GO

exec gpdemo3



--Lösche best Kunden mit Hilfe einer Prozedur
begin tran
exec gpDelKunde 'ALFKI' --aus Customers
rollback
-- AM Ende rollback

create or alter proc gpDelKunde @KdId varchar(5)
as
print 'so war es vorher'
select count(*) from customers where customerid = @KdId
select count(*) from orders where customerid = @KdId
select count(*) from [Order Details] where orderid in (Select orderid from orders where customerid = @KdId)
print  ' jetzt wird gelöscht'
delete from [Order Details] where orderid in (Select orderid from orders where customerid =@KdId)
delete from orders where customerid = @KdId
delete from customers where customerid =@KdId
print 'so ist es jetzt'


create or alter proc gpDelKunde @KdId varchar(5)
as
waitfor delay '00:00:05'
print 'Das ist der akt Bestand..'
select count(*) from customers where customerid = @KdId
select count(*) from orders where customerid = @KdId
select count(*) from [Order Details] where orderid in (Select orderid from orders where customerid = @KdId)
print 'jetzt wird gelöscht..'
waitfor delay '00:00:05'
delete from [Order Details] where orderid in (Select orderid from orders where customerid = @KdId)
delete  from orders where customerid = @KdId
delete from customers where customerid = @KdId

print 'und das bleibt übrig'
waitfor delay '00:00:05'
select count(*) from customers where customerid = @KdId
select count(*) from orders where customerid = @KdId
select count(*) from [Order Details] where orderid in (Select orderid from orders where customerid = @KdId)



begin tran
exec gpDelKunde 'BLAUS'
rollback


----Ergebnis der rozedur weiterverwenden


create or alter proc gpdemo4 @par1 int
as
select @par1*100

select * from orders where freight > (exec gpdemo4 ..) --geht nicht 


create or alter proc gpdemo4 @par1 int,  @par2 int output --ist auch input
as
select @par2=@par1*100

declare @var1 as int
exec gpdemo4 100, @par2 = @var1 output
select @var1






