
--Kopie der Customers
select * into kunden from customers

--Kunden löschen
delete from kunden where customerid = 'ALFKI'

--jeder INS UP DEL = Transaktion

--Transaktion

begin tran ---TX läuft
select @@TRANCOUNT
delete from kunden where customerid = 'FISSA'
select * from kunden where customerid = 'FISSA'
rollback-- commit

ROLLBACK ..macht alles Rückgängig
COMMIT bestätigt die Änderungen


 

 --Transaktionen so kurz wie möglich halten, da evtl paralelle ZUgriffe blockiert werden, solange die TX läuft

