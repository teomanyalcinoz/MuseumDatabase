--Belirtilen tarihten sonra doðan Kaþiflerin Keþfettiði eserleri dönderir.
Select * 
from Eser 
Where Eser.KesifId in ( 
	Select Keþif.id 
	from Keþif 
	Where Keþif.KasifId in ( 
		Select Kaþif.id 
		from Kaþif 
		Where Kaþif.DogumTarihi > '1000-01-01'
	)
);
--Etkinliðe giden insanlar ve etkinliðin adýný dönderir.
SELECT Ziyaretci.Ad, Ziyaretci.Soyad,EBilet.EtkinlikAdý 
FROM Ziyaretci INNER JOIN (
	SELECT ZiyaretciId,EtkinlikAdý
	FROM Bilet INNER JOIN Etkinlik 
	ON Etkinlik.BiletTipiId = Bilet.BiletTipiId
) AS EBilet
ON EBilet.ZiyaretciId = Ziyaretci.id;

--Zülfikar isimli ziyaretçinin gittiði etkinliklerdeki salonlarda çalýþan personel bilgilerini dönderir.
SELECT *
FROM Personel INNER JOIN (
	SELECT * 
	FROM Salon 
	WHERE Salon.EtkinlikId IN (
		SELECT Etkinlik.id 
		FROM Etkinlik
		WHERE BiletTipiId IN (
			SELECT Bilet.BiletTipiId 
			FROM Bilet 
			WHERE ZiyaretciId  IN (
				SELECT id 
				FROM Ziyaretci 
				WHERE Ziyaretci.Ad = 'Zülfikar'
			)
		)
	)
) AS ZiyaretciEtkinlikSalonlari
ON Personel.SalonId = ZiyaretciEtkinlikSalonlari.id;