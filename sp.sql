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
-- Maximum ziyaretçi sayýsýna sahip Etkinliðin bilet tipinin fiyatýný %10 arttýrýr
Update BiletTuru Set BiletTuru.Ücret += BiletTuru.Ücret*0.1 Where BiletTuru.id in(
    Select Top(1) E.BiletTipiId from Etkinlik E
        Inner Join Salon S On S.EtkinlikId = E.id
        Where E.BaslamaTarihi between @startDate And @endDate
        Order by E.ZiyaretciSayisi Desc);
-- Minumum ziyaretçi sayýsýna sahip Etkinliðe Gelen Ziyaretçileri siler
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
--Oluþturduðumuz SP yi test ettik.
Exec ManageMinMaxExhibitions '1900-01-01','2030-01-01'
