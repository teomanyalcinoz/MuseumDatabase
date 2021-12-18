INSERT INTO Gorev (Ad)
VALUES 
( 'Müdür' ), ( 'Müdür Yardýmcýsý' ),( 'Güvenlik' ),( 'Hademe' ),( 'Envanter Görevlisi' ),( 'Rehber' ),( 'Fotoðrafçý' ),
( 'Küratör' ),( 'Giþe Görevlisi' ),( 'Etkinlik Koordinatör' )
GO

INSERT INTO EserTipi (TipAdý)
VALUES
('Heykel'),('Portre'),('Tablo'),('Büst'),('Mücevher'),('Aksesuar'),('Mozaik'),('Lahit'),('Para'),('Tablet'),('Savaþ Eseri')
GO

INSERT INTO Sanatçý (Ad, Soyad, DogumTarihi, OlumTarihi)
VALUES
('Pablo','Picasso','1881-10-25','1973-04-08'),
('Rembrandt','Harmenszoon','1606-07-14','1669-10-04'),
('Michelangelo','Caravaggio','1571-09-29','1610-07-18'),
('Käthe','Kollwitz','1867-07-08','1945-04-22'),
('Michelangelo','Buonarroti','1475-03-06','1564-02-18'),
('Antonio','Canova','1757-11-01','1822-10-13'),
('Donatello','Bardi','1386-01-01','1466-12-13'),
('Pieter','Brueghel',NULL,'1569-09-09'),
('Johannes','Vermeer','1632-11-01','1675-12-01'),
('Leonardo','da Vinci','1606-07-15','1669-10-04')
GO
--baþlangýç ve bitiþ yýlý string olmalý çünkü MÖ sql DATE formatýnda tutulamaz.
INSERT INTO Uygarlýk (Ad, BaslangýcYili, BitisYili)
VALUES
('Mezopotamya',NULL,NULL),('Babil','MÖ1895','MÖ539'),('Ýskit','MÖ800','MS300'),('Sümer','MÖ4000','MÖ2000'),
('Hitit','MÖ1600','MÖ1178'),('Axum','MÖ100','MS600'),('Mýsýr','MÖ3150','MÖ31'),('Asur','MÖ2500','MÖ639'),('Roma','MÖ27','MS395'),
('Lidyalýlar','MÖ687','MÖ546')
GO

INSERT INTO Dönem (DonemAdi)
VALUES ('Rönesans'),('Ýlk Çað'),('Helenistik'),('Roma'),('Barok'),('Kübizm'),('Neo Klasizm'),('Empresyonizm'),('Realizm'),('Fütürizm'),('Sürrealizm')
GO

INSERT INTO YapýlýþTekniði (TeknikAdi)
VALUES ('Yaðlý Boya'),('Pastel Boya'),('Sulu Boya'),('Oyma'),('Biçimlendirme'),('Döküm'),('Birleþtirme'),('Tempera'),('Fresko'),('Yontma')
GO

INSERT INTO Materyal (MateryalAdi)
VALUES ('Cam'),('Porselen'),('Taþ'),('Ahþap'),('Alçý'),('Balmumu'),('Demir'),('Kil'),('Mermer'),('Toprak')
GO

INSERT INTO Ülke (Ad)
VALUES ('Mýsýr'),('Ýspanya'),('Ýtalya'),('Almanya'),('Güney Afrika'),('Hindistan'),('Türkiye'),('Fransa'),('Belçika'),
('Yunanistan'),('Peru'),('Meksika'),('Çin'),('Çekya'),('Avusturya')
GO

INSERT INTO Bölge (Ad)
VALUES ('Krallar Vadisi'),('Ýç Anadolu'),('Bask'),('Nil'),('Bavyera'),('Kafkasya'),('Alsace-Lorraine'),('Arequipa'),('Aspendos'),('Alp')
GO

INSERT INTO BiletTuru (Ad,Ücret)
VALUES ('Premium',250),('Diamond',200),('Gold',180),('Öðrenci',20),('Tam',40),('Yýllýk Abone',130),('Aylýk Abone',70),('Çocuk',10),
('Online',10),('Öðretmen',30),('Tur',300)
GO

INSERT INTO Ziyaretci (Ad, Soyad, TelNo)
VALUES ('Zülfikar','Dönmez','5639876542'),('Namýk','Kemal','5426239645'),('Ramazan','Özkan','5366987412'),('Özkan','Bahçe','5553576532'),
('Ferhat','Çýnar','5368643245'),('Selma','Çataloluk','5383122453'),('Simge','Atýkol','5536593214'),('Elif','Koçal','5356859910'),('Hammet','Mutlu','5439782536'),
('Süleyman','Rodop','5462348465'),('Yasin','Döner','5550378965')
GO

INSERT INTO Kaþif (Ad, Soyad, DogumTarihi, OlumTarihi)
Values ('Howard','Carter','1874-05-09','1939-03-02'),('Georger Herbert','de Carnarvon','1866-06-26','1923-04-05'),('Klaus','Schmidt','1953-12-11','2014-07-20'),
('Kristof','Kolomb','1451-01-01','1506-01-01'),('Amerigo','Vespucci','1454-01-01','1512-01-01'),
('Marco','Polo','1254-01-01','1324-01-01'),
('Vasco','de Gama','1460-01-01','1524-01-01'),('James','Cook','1728-01-01','1779-01-01'),
('Ferdinand','Magellan','1480-01-01','1521-01-01'),
('Robert','Peary','1856-05-06','1920-02-20'),('George Murray','Levick','1876-07-03','1956-05-30'),
('Jeanne','Baret','1740-01-01','1807-01-01')
GO

INSERT Into Muze (Ad, Adres, YazSezonuAcilis, YazSezonuKapanis, KisSezonuAcilis, KisSezonuKapanis)
VALUES ('Antalya Oyuncak Müzesi','Antalya','2021-05-05','2021-01-01','2021-01-01','2021-01-01'),
('Ýstanbul Arkeoloji Müzesi','Ýstanbul ','2021-05-05','2021-01-01','2021-01-01','2021-01-01'),
('Kariye Müzesi','Ýstanbul','2021-02-02','2021-05-05','2021-01-01','2021-01-01'),
('Louvre Museum','Fransa','2021-05-05','2021-01-01','2021-01-01','2021-01-01'),
('Çin Ulusal Müzesi','Çin','2021-07-07','2021-01-01','2021-01-01','2021-01-01'),
('Vatikan Müzesi','Vatikan','2021-05-05','2021-01-01','2021-01-01','2021-01-01'),
('Pergamon Müzesi','Almanya','2021-05-05','2021-01-01','2021-01-01','2021-01-01'),
('Ermitaj Müzesi','Rusya','2021-05-05','2021-01-01','2021-01-01','2021-01-01'),
('Amerikan Doða Tarihi Müzesi','ABD','2021-04-04','2021-01-01','2021-01-01','2021-01-01'),
('Noel Baba Kilisesi','Antalya ','2021-03-03','2021-01-01','2021-01-01','2021-01-01')
GO

INSERT INTO Etkinlik (EtkinlikAdý, BaslamaTarihi, BitisTarihi, ZiyaretciSayisi, BiletTipiId, MuzeId)
VALUES ('Yaðlý Boyalar Etkinliði','2021-01-01','2021-01-03',120,2,1),
('Kartal Anadolu Lisesi Gezisi','2021-02-04','2021-02-06',100,4,1),
('Antik Mýsýr Eserleri','2021-04-04','2021-04-06',80,11,1),
('Anadolu Eserleri','2021-06-04','2021-06-10',80,11,1),
('Ýlkokul Öðrencileri Müze Gezisi','2019-02-02','2019-03-02',300,8,2),
('Rönesans Dönemi Eserleri','2018-01-04','2018-05-06',200,11,6),
('Mermer Heykeller Etkinliði', '2018-03-14','2018- 04-16',215,11,5),
('Çini Eserler Etkinliði', '2020-05-20','2020- 05-30',115,9,7),
('Nü Eserler Etkinliði', '2021-06-02','2021- 07-02',632,1,8),
('Minyatür Heykeller','2021-05-05','2021-07-07',400,9,2)
GO
INSERT INTO Salon (Ad, MuzeId, EtkinlikId)
VALUES 
('Seramik Eserler',1,9),
('Tabiat Tarihi',2,8),
('Prehistorya',3,7),
('Bölge Kazýlarý',5,6),
('Ýmparatorlar',6,5),
('Tanrýlar',7,4),
('Mozaik',8,3),
('Ölü Kültü',9,2),
('Sikke,Küçük Eserler ve Ýkonalar',10,2),
('Etnoðrafya',10,1),
('Sinevizyon',1,6),
('Orta Doðu Eserleri',2,7),
('Uygarlýklar',4,5),
('Roma Eserleri',5,9),
('Kalýntýlar',6,7)
GO
INSERT INTO GeliþÞekli (GeliþÞekliAdi)
VALUES ('Baðýþ'),('Keþif'),('Satýn Alma'),('Kira'),('Açýk Arttýrma'),('Ganimet'),('Kazý'),('Sondaj'),('Sergi'),('Zoralým'),('Devir'),('Bilimsel Araþtýrma')
GO


INSERT INTO Personel (Ad, Soyad, MuzeId, IseBaslamaTarihi, GorevId, SalonId, Maas, Aktiflik)
VALUES 
('Mert','Güçtekin',3,'2018-03-10',4,1,2800,1),
('Ýrem','Esim',5,'2015-08-09',2,2,3000,1),
('Feyza','Türksoyu',3,'2018-10-11',1,3,5000,1),
('Deniz','Aybey',3,'2017-01-09',2,4,3000,1),
('Kerim','Olcay',3,'2012-07-02',5,5,3500,1),
('Tuana','Kýzýltaþ',1,'2016-06-11',2,6,3000,0),
('Mesut','Taþova',1,'2020-04-12',3,7,2800,1),
('Büþra','Soykan',1,'2021-05-04',6,8,3000,1),
('Melisa','Gürleþen',4,'2018-09-12',1,9,5000,1),
('Kemal','Yakutlu',6,'2014-03-10',8,10,3200,1),
('Ýsmail','Erbay',7,'2020-09-01',1,1,5000,1),
('Mustafa','Yýldýz',9,'2019-01-11',1,2,5000,0),
('Canan','Karasoy',6,'2015-01-11',2,3,3000,1),
('Sedef','Kýzmaz',6,'2016-02-12',3,4,2800,1),												
('Kerem','Fýrtýna',8,'2017-03-12',4,5,2800,1),
('Safiye','Balpýnar',2,'2017-04-09',5,6,3500,1),
('Tugay','Çaylý',3,'2018-05-01',5,7,3500,1),
('Fatih','Atalmýþ',4,'2018-05-01',6,8,3000,0),
('Burcu','Alýk',5,'2019-04-03',6,9,3000,1),
('Süleyman','Özbirlik',7,'2020-06-03',7,10,2800,1),
('Aslýhan','Karaçalý',9,'2020-11-08',8,1,3200,1),
('Buket','Manas',10,'2011-10-07',9,2,3500,0),
('Burcu','Karaaslan',1,'2012-11-08',10,3,4000,1),
('Birol','Toktaþ',2,'2015-09-09',2,4,3000,1),
('Nisa','Aslan',2,'2016-09-05',5,5,3500,1),
('Savaþ','Kahraman',4,'2016-07-05',5,6,3500,1),
('Baran','Bayezit',4,'2021-07-02',7,7,2800,0),
('Ersin','Dadak',5,'2021-07-04',4,8,2800,1),
('Emre','Gencay',5,'2020-07-04',4,9,2800,1),
('Arif','Öykücü',7,'2018-05-06',9,10,3500,0),
('Nazlý','Özkýzmaz',7,'2019-05-11',6,1,3000,1),
('Rabia','Esenboða',9,'2019-04-12',3,2,2800,1),
('Meryem','Güzey',10,'2019-04-10',3,3,2800,1)
GO


INSERT INTO Keþif (KasifId, BolgeId, UlkeId, KesifTarihi)
VALUES
(1,2,5,'1952-04-10'),
(2,4,7,'1947-08-09'),
(3,6,5,'1960-01-07'),
(4,8,3,'1974-02-05'),
(5,10,1,'2008-03-11'),
(6,3,10,'2003-04-12'),
(7,5,8,'1958-05-07'),
(8,7,4,'1943-08-05'),
(9,9,6,'1890-11-03'),
(10,1,2,'1965-12-01')
GO

INSERT INTO Eser (Ad, RafNo, Agirlik, Boy, En, Aciklama, EserYili, SalonId, EtkinlikId, EserTipiId, SanatçýId, UygarlýkId, DönemId, YapýlýsTeknigiId, MateryalId, KesifId, GelisSekliId, Aktiflik)
VALUES 
('Guernica', 9,170,349,777,'Franco dönemi Guernica kasabasýnda yaþananlarý konu aldýðý eser','1937-01-01',2,3,3,1,1,6,1,1,3,2,1),
('Gece Devriyesi',2,250,363,437,'Sivili muhafýzlarýn tablosu','1642-01-01',1,4,3,2,NULL,5,1,NULL,NULL,4,1),
('Genç Hasta Baküs',4,NULL,67,53,'Roma tanrýsý Baküs`ü kendi silüetinde hasta resmediþi','1593-01-01',4,7,2,3,4,1,3,NULL,NULL,2,1),
('Yastaki Ebeveynler',5,25,40,30,'Belçika`daki Alman askerleri mezarlýðýndan alýnan','1932-01-01',6,5,4,4,NULL,8,10,9,NULL,5,1),
('Anne ve Ýki Çocuðu',6,25,54,68,'Annenin çocuklarýný kollarýnda koruduðu','1932-01-01',6,2,1,4,NULL,7,4,3,NULL,5,1),
('Pieta',3,1000,100,150,'Ölü Ýsa`yý kucaðýnda tutan','1498-01-01',5,7,1,5,9,1,10,9,NULL,2,1),
('Ýkarus`un Düþüþü',1,50,73,112,'Ýkarus`un Düþüþü','1558-01-01',7,5,3,2,8,NULL,7,2,NULL,NULL,1),
('Babil Kulesi',7,50,144,155,'Farklý milletlerin ortaya çýkýþý','1563-01-01',7,7,3,8,2,3,1,NULL,NULL,4,1),
('Mona Lisa',8,100,77,53,'Da Vinci`nin ünlü tablosu','1503-01-01',8,1,2,10,9,1,3,NULL,6,6,1),
('Hilebazlar',7,140,94,131,'Henüz 23 yaþýnda yaptýðý harika resim','1590-01-01',5,7,3,3,9,1,3,NULL,NULL,5,1)
GO

INSERT INTO Kira (EserId,Ücret, BaslangicTarihi, BitisTarihi, HasarDurumu, MuzeId)
VALUES
(1,10000,'2018-03-10','2018-05-10','Saðlam',1),
(2,12000,'2016-08-09','2016-10-09','Saðlam',2),
(1,13500,'2018-01-11','2018-04-11','Saðlam',3),
(1,9000,'2021-01-01','2021-02-01','Kýrýk',4),
(3,1000,'2019-07-02','2018-07-10','Saðlam',5),
(4,11750,'2017-03-10','2017-05-10','Saðlam',6),
(5,20000,'2020-06-12','2018-09-12','Az Hasarlý',7),
(3,30000,'2021-05-03','2018-08-03','Saðlam',8),
(5,9750,'2020-03-10','2018-05-10','Saðlam',1),
(7,13000,'2020-08-09','2016-10-09','Az Hasarlý',2),
(3,15550,'2018-01-11','2018-04-11','Saðlam',3),
(4,50000,'2017-01-01','2021-02-01','Saðlam',4),
(8,25000,'2016-07-02','2019-07-10','Parçasý Eksik',5),
(8,11750,'2017-03-10','2017-05-10','Saðlam',6),
(1,20000,'2015-06-12','2015-09-12','Saðlam',7),
(5,30000,'2014-05-03','2016-05-03','Saðlam',8)
GO
INSERT INTO Bilet(BiletTipiId, ZiyaretciId, BaslangýcTarihi, BitisTarihi)
VALUES (11,1,'2014-05-03','2016-05-03'),
(3,1,'2021-05-03','2021-05-03'),
(5,6,'2020-05-03','2018-05-03'),
(2,4,'2008-05-03','2008-05-03'),
(3,3,'1996-05-03','1998-05-03'),
(4,2,'2014-05-03','2016-05-03')
GO
