--Etkinlik 2 de kullanýlan salonlarda çalýþan personelleri siler.
DELETE FROM Personel WHERE Personel.SalonId in ( Select Salon.id from Salon Where Salon.EtkinlikId = 2);

--Zülfikar Dönmez ismine sahip kiþilerin bilet bilgilerini siler.
DELETE FROM Bilet WHERE Bilet.ZiyaretciId in ( SELECT Ziyaretci.id From Ziyaretci Where Ziyaretci.Ad = 'Zülfikar' AND Ziyaretci.Soyad = 'Dönmez');

-- Adý Kristof yada Robet olan kaþiflerin keþfettiði eserleri siler.
DELETE E FROM Eser E Where e.KesifId in (Select Keþif.id from Keþif Where Keþif.KasifId in ( Select Kaþif.id from Kaþif Where Kaþif.Ad = 'Marco' OR Kaþif.Ad = 'Robert'))  

--Zülfikar Dönmez isimli ziyaretçilerin gittiði etkinliklerde sergilenen eserleri siler.
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
			Where Ziyaretci.Ad = 'Zülfikar' And Ziyaretci.Soyad ='Dönmez'
			)
		)
-- Marco Polo isimli kaþifin keþfettiði ve 10 no lu salonda sergilenen tüm eserleri siler. (Beklenen Sonuç => Eserler tablosundan Mona Lisa silinecek) 
Delete E
From Eser E
INNER JOIN
Etkinlik ET ON ET.id = E.EtkinlikId
Where E.KesifId in (
	Select Keþif.id 
	from Keþif 
	Where Keþif.KasifId  in (
		Select id 
		from Kaþif 
		Where Kaþif.Ad = 'Marco' And Kaþif.Soyad = 'Polo'
	)
)
And ET.id in (
	Select Salon.EtkinlikId 
	from Salon 
	Where Salon.id = 10
)
