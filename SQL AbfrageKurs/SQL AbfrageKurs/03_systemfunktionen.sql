/*
Datumsfunktionen
Intervall
yy = Jahr
hh=Stunde
qq=Quartal
ss=Sekunde
mm=Monat
mi=Minute
ms=Millisekunde
dy Tag des Jahres

*/

--heute und jétzt

select getdate()  --2022-04-25 10:11:35.190

select datepart(yy,'12.2.2022') --

--Jahr von heute
select datepart(yy,getdate())--2022

--Quartal von heute 
select datepart(qq,getdate())--2

select datepart(dy,getdate())--2

select year(getdate())


--zu einem Datum etwas(intervall dazurechnen)
select dateadd(mm,3,'3.4.2021') 

--Welches Datum haben wir in 50 Tagen und welches hatten wir vor 99 Tagen
select dateadd(dd,50,getdate())  as In50Tagen,
		  dateadd(dd,-99,getdate()) as Vor99Tagen

--Zeit zwischen zwei Terminen.. Zeit in Tagen von heute bis 31.12.2022
select	datediff(dd,getdate(), '31.12.2022'), 
			datediff(dd, '31.12.2022', getdate())

--Heutiger Wochentag
select datename(dw, getdate())


--Textfunktionen

select 'ABC'

select 'A' +'B'

select 100 +'A'
select 'A' + 100
select 'A' + '100'

select convert(varchar(50),100)+'A'

--Konvertieren kan im Fall des Datums auch komplizierter werden
select  convert(datetime, getdate(),104)
select  convert(datetime, getdate(),103)
select  convert(datetime, getdate(),126)


--die ersten 3 Zeichen von link oder rechts
select left('abcdegh',3), right('abcdefgh',3)

--ab einer best Position für eine best Länge.. beginnt mit 1
select substring('abcdefgh',3,2) --cd

--best Zeichen anhand der Position und Länge ersetzen..die Länge der zu ersetzenden Zeichen ist egal
select stuff('abcdefgh',3,2,'12345') --ab12345efgh

--Zeichenkette umdrehen
select reverse('Otto'), reverse(1234567)


--Länge von ZK
--len entfernt Leerzeihen am Ende einer ZK..nicht vorne
select len('Otto'), len('Otto           '),len('         Otto           ')

--Leerzeichen vorne oder hinten entfernen
select rtrim('otto       '), ltrim('       Otto')

--tats Länge.. datalength..macht keinen trim
select datalength('Otto       ')

--bel TelNr 08677-988971 sollen die letzten 3 Zeichen ausgeixt werden
--durch XXX ersetzt werden

select stuff('08677-988971',10,3,'xxx')
select len('08677-988971')-2

select stuff('08677-9888888888971',len('08677-9888888888971')-2,3,'xxx')


--right ... blöd... weil Ausgabe 

--was, wenn es die ersten 3 Zeichen sein sollten?
select reverse('08677-9888888888971')--1798888888889-77680

select stuff(reverse('08677-9888888888971'),1,3,'XXX') --XXX8888888889-77680
select reverse(stuff(reverse('08677-9888888888971'),1,3,'XXX')) --08677-9888888888XXX

select substring('08677-9888888888971',1 , len('08677-9888888888971')-3)+ 'XXX'





















