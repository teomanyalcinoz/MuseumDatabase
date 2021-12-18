--Eser adý,eser id,raf no,salon id,dönem adý,yapýlýþ tekniðini,boyunu eserin boy özelliðine göre kýsa yada uzun olarak
--materyal adýný,esertipi adýný,eserin sanatcýsýnýn adý ve soyadý ve ölüm yaþýný
--eserin sergilendiði etkinlðin popülerliðini geri döndüren view
IF OBJECT_ID('dbo.VIEWW') IS NOT NULL
BEGIN
	DROP VIEW VIEWW
END
GO
CREATE VIEW VIEWW
AS
Select
    top(100)E.Ad as EserAdý,
	E.id as EserId,
    ISNULL(E.RafNo,0) as RafNo,
	ISNULL(E.SalonId,0) as SalonId,
    D.DonemAdi as DönemAdi,
    Y.TeknikAdi as YapiliþTek,
    CASE
        WHEN E.Boy < 200 THEN 'KISA'
        WHEN E.Boy > 200 THEN 'UZUN'
    END as BOY,
    ISNULL(M.MateryalAdi,'yok') as MateryalAdi,
    ET.TipAdý as EserTipiAdi,
    SAN.Ad+' '+SAN.Soyad as SanatciAdSoyad,
    DATEDIFF(YEAR,SAN.DogumTarihi,SAN.OlumTarihi) as SanatcýÖlümYaþi,
    POPULAR From Eser E
Inner Join
(
Select 
    POP.id, 
    Case 
        When popularity < 2  Then 'NOT POPULAR'
        When popularity >= 2 Then 'POPULAR'
        ELSE 'UNDEFINED'
    END As POPULAR
    From (Select *, dbo.FONK(Et.id) as popularity from Etkinlik Et) as POP) S on S.id = E.EtkinlikId
    Inner Join YapýlýþTekniði Y On Y.id = E.YapýlýsTeknigiId
    INNER JOIN Dönem D ON D.id=E.DönemId
    INNER JOIN Materyal M ON M.id=E.MateryalId
    INNER JOIN EserTipi ET ON ET.id=E.EserTipiId
    INNER JOIN Sanatçý SAN ON SAN.id=E.SanatçýId
GO
select dbo.VIEWW.*,S.Ad as SalonAdi,K.HasarDurumu from dbo.VIEWW
	inner join Salon S on S.id=dbo.VIEWW.SalonId
	inner join Kira K on K.EserId=dbo.VIEWW.EserId