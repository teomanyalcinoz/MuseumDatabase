--PARAMETRE OLARAK IDSI VERÝLEN ETKÝNLÝÐE KAÇ TANE BÝLET SATILDIGINI DONDUREN FONKSÝYON
IF OBJECT_ID ('dbo.FONK') IS NOT NULL
BEGIN
	DROP FUNCTION FONK
END
GO
CREATE function FONK(@id int)
RETURNS INT
AS
BEGIN
    DECLARE @t int;
    select @t = COUNT(B.id) from Bilet B
        inner join Etkinlik E on E.BiletTipiId = B.BiletTipiId
        where E.id = @id
    return @t;
END
GO
SELECT dbo.FONK(2)