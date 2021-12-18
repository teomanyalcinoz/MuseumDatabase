--Prosed�r ile birlikte , en az ziyaret�i say�s�na sahip etkinli�e giden ziyaret�ileri silmi�tik
--Triggerla birlikte bu silinen ziyaret�ileri olu�turdu�umuz �naktifZiyaret�i tablosuna yazd�k
IF OBJECT_ID('triggerZiyaretci') IS NOT NULL
BEGIN
	DROP TRIGGER triggerZiyaretci
END
GO
CREATE TRIGGER triggerZiyaretci 
ON Ziyaretci AFTER DELETE
AS
	DECLARE @errorCount INT = 0
    INSERT INTO �naktifZiyaretci SELECT Ad,Soyad,TelNo FROM deleted
	SET @errorCount = @@ERROR
	IF @errorCount > 0
		BEGIN
			ROLLBACK
		END
GO

--Daha �nceden olu�turdu�umuz sp yi �al��t�r�p inaktif ziyaret�ileri siliyoruz ve 'triggerZiyaretci' triggerini tetikliyoruz.
Exec ManageMinMaxExhibitions '1900-01-01','2030-01-01'
--�naktifZiyaretci tablosuna yaz�ld� m� kontrol� i�in
SELECT * FROM �naktifZiyaretci