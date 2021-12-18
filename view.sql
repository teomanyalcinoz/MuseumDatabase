--Eser ad�,eser id,raf no,salon id,d�nem ad�,yap�l�� tekni�ini,boyunu eserin boy �zelli�ine g�re k�sa yada uzun olarak
--materyal ad�n�,esertipi ad�n�,eserin sanatc�s�n�n ad� ve soyad� ve �l�m ya��n�
--eserin sergilendi�i etkinl�in pop�lerli�ini geri d�nd�ren view
IF OBJECT_ID('dbo.VIEWW') IS NOT NULL
BEGIN
	DROP VIEW VIEWW
END
GO
CREATE VIEW VIEWW
AS
Select
    top(100)E.Ad as EserAd�,
	E.id as EserId,
    ISNULL(E.RafNo,0) as RafNo,
	ISNULL(E.SalonId,0) as SalonId,
    D.DonemAdi as D�nemAdi,
    Y.TeknikAdi as Yapili�Tek,
    CASE
        WHEN E.Boy < 200 THEN 'KISA'
        WHEN E.Boy > 200 THEN 'UZUN'
    END as BOY,
    ISNULL(M.MateryalAdi,'yok') as MateryalAdi,
    ET.TipAd� as EserTipiAdi,
    SAN.Ad+' '+SAN.Soyad as SanatciAdSoyad,
    DATEDIFF(YEAR,SAN.DogumTarihi,SAN.OlumTarihi) as Sanatc��l�mYa�i,
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
    Inner Join Yap�l��Tekni�i Y On Y.id = E.Yap�l�sTeknigiId
    INNER JOIN D�nem D ON D.id=E.D�nemId
    INNER JOIN Materyal M ON M.id=E.MateryalId
    INNER JOIN EserTipi ET ON ET.id=E.EserTipiId
    INNER JOIN Sanat�� SAN ON SAN.id=E.Sanat��Id
GO
select dbo.VIEWW.*,S.Ad as SalonAdi,K.HasarDurumu from dbo.VIEWW
	inner join Salon S on S.id=dbo.VIEWW.SalonId
	inner join Kira K on K.EserId=dbo.VIEWW.EserId