--Prosedür ile birlikte , en az ziyaretçi sayýsýna sahip etkinliðe giden ziyaretçileri silmiþtik
--Triggerla birlikte bu silinen ziyaretçileri oluþturduðumuz ÝnaktifZiyaretçi tablosuna yazdýk
IF OBJECT_ID('triggerZiyaretci') IS NOT NULL
BEGIN
	DROP TRIGGER triggerZiyaretci
END
GO
CREATE TRIGGER triggerZiyaretci 
ON Ziyaretci AFTER DELETE
AS
	DECLARE @errorCount INT = 0
    INSERT INTO ÝnaktifZiyaretci SELECT Ad,Soyad,TelNo FROM deleted
	SET @errorCount = @@ERROR
	IF @errorCount > 0
		BEGIN
			ROLLBACK
		END
GO

--Daha önceden oluþturduðumuz sp yi çalýþtýrýp inaktif ziyaretçileri siliyoruz ve 'triggerZiyaretci' triggerini tetikliyoruz.
Exec ManageMinMaxExhibitions '1900-01-01','2030-01-01'
--ÝnaktifZiyaretci tablosuna yazýldý mý kontrolü için
SELECT * FROM ÝnaktifZiyaretci