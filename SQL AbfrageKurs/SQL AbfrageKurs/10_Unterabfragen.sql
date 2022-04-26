select * from (select * from customers) t inner join orders on t.

select * from (tabelle) -- 1Zeile 1Spalte

select sp, (select ..) from Tabelle --eine zelle eine Wert

select customerid, (select top 1 country from customers order by country )from customers

select * from customers 
where country = (select top 1 country from customers order by country) --nur ein Wert


select * from customers 
where country in (select country from customers) --nur ein Spalte mit vielen Werten

