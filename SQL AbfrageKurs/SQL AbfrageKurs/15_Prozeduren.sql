/*
Prozedur hat meist komplette Businesslogik
..sind schneller


Prozeduren sin dnur ausführbar.. exec proc 
sind nicht direkt kombinierbar mit SELECT (zb Joinen)




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