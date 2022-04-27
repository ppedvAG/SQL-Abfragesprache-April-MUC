CREATE TABLE    TabName    --ALTER DROP
					(
					 sp1 int ,
					 sp2 char(50) not null,
					 sp3 int identity,
					 sp5 int  primary key
					)


create table #t 
						(
						 id int identity
						 ,Vorname nvarchar(50) null
						 ,FamName nvarchar(50) not null
						 ,GebDatum date not null
						 ,PLZ char(5)
						 ,Ort nvarchar(50)
						)


Alter table #t add Strasse nvarchar(50)

select * from #t

alter table #t drop column GebDatum

drop table #t


