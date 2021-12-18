IF OBJECT_ID('ManageMinMaxExhibitions') IS NOT NULL
BEGIN
	DROP PROCEDURE ManageMinMaxExhibitions
END
GO
Create Procedure ManageMinMaxExhibitions(@startDate date, @endDate date)
AS
BEGIN
BEGIN TRANSACTION
BEGIN TRY
-- Maximum ziyaret�i say�s�na sahip Etkinli�in bilet tipinin fiyat�n� %10 artt�r�r
Update BiletTuru Set BiletTuru.�cret += BiletTuru.�cret*0.1 Where BiletTuru.id in(
    Select Top(1) E.BiletTipiId from Etkinlik E
        Inner Join Salon S On S.EtkinlikId = E.id
        Where E.BaslamaTarihi between @startDate And @endDate
        Order by E.ZiyaretciSayisi Desc);
-- Minumum ziyaret�i say�s�na sahip Etkinli�e Gelen Ziyaret�ileri siler
Delete From Ziyaretci Where Ziyaretci.id In(
        Select Z.id From Ziyaretci Z Inner Join Bilet B
        On B.ZiyaretciId = Z.id
        Where B.BiletTipiId In(
            Select Top(1) Bi.BiletTipiId From Etkinlik E
            Inner Join Bilet Bi On Bi.BiletTipiId = E.BiletTipiId
            Where E.BaslamaTarihi between @startDate And @endDate
            Order by E.ZiyaretciSayisi Asc
        ));
COMMIT TRANSACTION
END TRY
BEGIN CATCH
PRINT 'ISLEM BASARISIZ OLDU !!!!'
ROLLBACK TRANSACTION
END CATCH
END
GO
--Olu�turdu�umuz SP yi test ettik.
Exec ManageMinMaxExhibitions '1900-01-01','2030-01-01'
