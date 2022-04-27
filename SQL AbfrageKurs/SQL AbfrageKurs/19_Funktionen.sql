--Funktionen..sind meist Gift!!
--seit SQL 2019 


select f(wert), f(spalte)  from f(Wert) where f(spalte) > f(wert)


create function fdemo(@par1 int, @par2 int) returns int
as
begin 
return (select @par1*@par2)
end

select fdemo(20,3) --error

select dbo.fdemo(20,3) --ahh... 60


select dbo.fbrutto(100)



create function fbrutto (@netto money) returns money
as
begin
return (select @netto *1.19)
end

select dbo.fbrutto(100) , dbo.fbrutto(freight) from orders
where dbo.fbrutto(freight) < 100


select fRngSumme(10248) -- 440

select dbo.fRngSumme(orderid) 



select sum(unitprice*quantity) from  [Order Details] where orderid = 10248



create function fRngSumme (@RngNr int) returns money
as
begin
	return(	select sum(unitprice*quantity) from  [Order Details] where orderid = @RngNr)
end

select dbo.fRngSumme(10248

alter table orders add RngSumme as dbo.fRngSumme(orderid)


select * from orders where rngsumme < 500

update [Order Details] set Quantity = 10 where orderid = 10248 and productid = 11
select * from  [Order Details]







