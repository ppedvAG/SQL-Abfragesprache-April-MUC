
--Kopie der Customers
select * into kunden from customers

--Kunden l�schen
delete from kunden where customerid = 'ALFKI'

--jeder INS UP DEL = Transaktion

--Transaktion

begin tran ---TX l�uft
select @@TRANCOUNT
delete from kunden where customerid = 'FISSA'
select * from kunden where customerid = 'FISSA'
rollback-- commit

ROLLBACK ..macht alles R�ckg�ngig
COMMIT best�tigt die �nderungen


 

 --Transaktionen so kurz wie m�glich halten, da evtl paralelle ZUgriffe blockiert werden, solange die TX l�uft

