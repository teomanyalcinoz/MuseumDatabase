--Ziyaretci tablosuna while döngüsü kullanarak 300bin adet örnek kayýt girdik
declare @i int
set @i = 0
WHILE @i<300000
BEGIN
	
	INSERT INTO Ziyaretci(Ad,Soyad,TelNo) VALUES (CONCAT('Ziyaretci',@i),'Soyad','5242421234')
	set  @i =  @i +1
END
set statistics io on

select * from Ziyaretci where Ad = 'Ziyaretci1881'

create nonclustered index index1
on Ziyaretci(Ad)

select * from Ziyaretci where Ad = 'Ziyaretci1881'
