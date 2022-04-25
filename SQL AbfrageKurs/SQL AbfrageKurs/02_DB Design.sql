USE DB;
GO

--DB Design...


/*
Tabellen

Datensätze
Primärschlüssel (macht DS eindeutig)---Beziehungen-->  Fremdschlüssel
1:N


Datentypen und Spalten

Otto
varchar(50)  'otto'   4  variable
char(50)       'otto                                                        ' 50
nchar(50)     'otto                                                        ' 50 * 2  100 Unicode
nvarchar(50) 'otto'   4*2
text() ..nicht mehr nehmen .. seit 2005 depricated
varchar(max) char(max)   2GB

Datum und Zeit
datetime  (ms)
smalldatetime (sek)
date / time 
datetime2 (ns)
datetimeoffset (Zeitzone)

Zahlen
int ganze Zahlen +- 2,1 Mrd
big_int
smallint  +-  32000
tinyint     + 255
bit 
money 8 Nachkommastellen
decimal (10,4) .. 10 Stellen , davon 4 Nachkomma
float ..sehr viele Nachkommatstelen


XML
geography
geometry
























*/

delete from customers where customerid = 'ALFKI'

---Diagramm zur bessern Übersicht (Datentyp, Beziehungen, Identität, NULL Felder)