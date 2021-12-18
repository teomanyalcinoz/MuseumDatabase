--Belirtilen tarihten sonra do�an Ka�iflerin Ke�fetti�i eserleri d�nderir.
Select * 
from Eser 
Where Eser.KesifId in ( 
	Select Ke�if.id 
	from Ke�if 
	Where Ke�if.KasifId in ( 
		Select Ka�if.id 
		from Ka�if 
		Where Ka�if.DogumTarihi > '1000-01-01'
	)
);
--Etkinli�e giden insanlar ve etkinli�in ad�n� d�nderir.
SELECT Ziyaretci.Ad, Ziyaretci.Soyad,EBilet.EtkinlikAd� 
FROM Ziyaretci INNER JOIN (
	SELECT ZiyaretciId,EtkinlikAd�
	FROM Bilet INNER JOIN Etkinlik 
	ON Etkinlik.BiletTipiId = Bilet.BiletTipiId
) AS EBilet
ON EBilet.ZiyaretciId = Ziyaretci.id;

--Z�lfikar isimli ziyaret�inin gitti�i etkinliklerdeki salonlarda �al��an personel bilgilerini d�nderir.
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
				WHERE Ziyaretci.Ad = 'Z�lfikar'
			)
		)
	)
) AS ZiyaretciEtkinlikSalonlari
ON Personel.SalonId = ZiyaretciEtkinlikSalonlari.id;