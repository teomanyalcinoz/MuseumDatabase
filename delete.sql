--Etkinlik 2 de kullan�lan salonlarda �al��an personelleri siler.
DELETE FROM Personel WHERE Personel.SalonId in ( Select Salon.id from Salon Where Salon.EtkinlikId = 2);

--Z�lfikar D�nmez ismine sahip ki�ilerin bilet bilgilerini siler.
DELETE FROM Bilet WHERE Bilet.ZiyaretciId in ( SELECT Ziyaretci.id From Ziyaretci Where Ziyaretci.Ad = 'Z�lfikar' AND Ziyaretci.Soyad = 'D�nmez');

-- Ad� Kristof yada Robet olan ka�iflerin ke�fetti�i eserleri siler.
DELETE E FROM Eser E Where e.KesifId in (Select Ke�if.id from Ke�if Where Ke�if.KasifId in ( Select Ka�if.id from Ka�if Where Ka�if.Ad = 'Marco' OR Ka�if.Ad = 'Robert'))  

--Z�lfikar D�nmez isimli ziyaret�ilerin gitti�i etkinliklerde sergilenen eserleri siler.
Delete E 
from Eser E Inner Join 
	Etkinlik 
	On Etkinlik.id = E.EtkinlikId
	Where Etkinlik.BiletTipiId in ( 
		Select Bilet.BiletTipiId 
		From Bilet 
		Where Bilet.ZiyaretciId in (
			Select id 
			from Ziyaretci 
			Where Ziyaretci.Ad = 'Z�lfikar' And Ziyaretci.Soyad ='D�nmez'
			)
		)
-- Marco Polo isimli ka�ifin ke�fetti�i ve 10 no lu salonda sergilenen t�m eserleri siler. (Beklenen Sonu� => Eserler tablosundan Mona Lisa silinecek) 
Delete E
From Eser E
INNER JOIN
Etkinlik ET ON ET.id = E.EtkinlikId
Where E.KesifId in (
	Select Ke�if.id 
	from Ke�if 
	Where Ke�if.KasifId  in (
		Select id 
		from Ka�if 
		Where Ka�if.Ad = 'Marco' And Ka�if.Soyad = 'Polo'
	)
)
And ET.id in (
	Select Salon.EtkinlikId 
	from Salon 
	Where Salon.id = 10
)
