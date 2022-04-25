--NULL

--NULL ist nicht '' oder auch nicht 0 
--jede math Operation mit NULL führt zu NULL

select 1+0
select 'A'+ ''
select 100+NULL

select * from customers where region = NULL

select * from customers where region is null

select * from customers where region is not null

--SUM  AVG

--- 100
--  200
--100
--200
-- NULL
--- 100+200+100+200 / 4
