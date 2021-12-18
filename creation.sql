CREATE DATABASE Muze
	On Primary 
	(
		NAME='MuzeDB',
		FILENAME = 'E:\Muze_db.mdf'
	)
	LOG ON  
	(
		NAME='MuzeDB_log',
		FILENAME = 'E:\Muze_log.ldf'
	)
GO

use Muze;

CREATE TABLE Ziyaretci (
  id int IDENTITY(1,1) PRIMARY KEY,						
  Ad varchar(35) default NULL,
  Soyad varchar(35) default NULL,
  TelNo char(10) default NULL,
);


CREATE TABLE BiletTuru (
  id int IDENTITY(1,1) PRIMARY KEY,						
  Ad varchar(35) default NULL,
  Ücret integer default NULL,
 
);



CREATE TABLE Bilet (
  id int IDENTITY(1,1) PRIMARY KEY,							
  BiletTipiId int default NULL,
  ZiyaretciId int default NULL,
  BaslangýcTarihi date default NULL,
  BitisTarihi date default NULL,	
  CONSTRAINT FK_BiletTipiId FOREIGN KEY (BiletTipiId) REFERENCES BiletTuru(id),
  CONSTRAINT FK_ZiyaretciId FOREIGN KEY (ZiyaretciId) REFERENCES Ziyaretci(id),
);


CREATE TABLE Gorev (
  id int IDENTITY(1,1) PRIMARY KEY,						
  Ad varchar(35) default NULL,	
);

CREATE TABLE Muze (
  id int IDENTITY(1,1) PRIMARY KEY,						
  Ad varchar(35) default NULL,
  Adres varchar(100) default NULL,
  YazSezonuAcilis date default NULL,
  YazSezonuKapanis date default NULL,
  KisSezonuAcilis date default NULL,
  KisSezonuKapanis date default NULL

);

CREATE TABLE Salon (
  id int IDENTITY(1,1) PRIMARY KEY,						
  Ad varchar(35) default NULL,
  MuzeId int default NULL,
  EtkinlikId int default NULL,
  CONSTRAINT FK_MuzeId FOREIGN KEY (MuzeId) REFERENCES Muze(id)
);

CREATE TABLE Personel (
  id int IDENTITY(1,1) PRIMARY KEY,							
  Ad varchar(35) default NULL,
  Soyad varchar(35) default NULL,
  MuzeId int default NULL,
  IseBaslamaTarihi date default NULL,
  GorevId int default NULL,
  SalonId int default NULL,
  Maas money default NULL,
  Aktiflik int default NULL --aktiflik durumunu belirtir
					--aktif ise 1
					--aktif deðil ise 0
  CONSTRAINT FK_GorevId FOREIGN KEY (GorevId) REFERENCES Gorev(id),
   CONSTRAINT FK_MuzeId_1 FOREIGN KEY (MuzeId) REFERENCES Muze(id)
);

CREATE TABLE Etkinlik (
  id int IDENTITY(1,1) PRIMARY KEY,						
  EtkinlikAdý varchar(35) default NULL,
  BaslamaTarihi date default NULL,
  BitisTarihi date default NULL,
  ZiyaretciSayisi int default NULL,
  BiletTipiId int default NULL,
  MuzeId int default NULL,
  CONSTRAINT FK_BiletTipi FOREIGN KEY (BiletTipiId) REFERENCES BiletTuru(id),
  CONSTRAINT FK_MuzeId_2 FOREIGN KEY (MuzeId) REFERENCES Muze(id)
);	




CREATE TABLE EserTipi (
  id int IDENTITY(1,1) PRIMARY KEY,						
  TipAdý varchar(35) default NULL,	
);

CREATE TABLE Sanatçý (
  id int IDENTITY(1,1) PRIMARY KEY,						
  Ad varchar(35) default NULL,
  Soyad varchar(35) default NULL,
  DogumTarihi date default NULL,
  OlumTarihi date default NULL,
);

CREATE TABLE Uygarlýk (
 id int IDENTITY(1,1) PRIMARY KEY,						
  Ad varchar(35) default NULL,
  BaslangýcYili varchar(35) default NULL,
  BitisYili varchar(35) default NULL,
);

CREATE TABLE Dönem (
  id int IDENTITY(1,1) PRIMARY KEY,						
  DonemAdi varchar(35) default NULL,	
);

CREATE TABLE YapýlýþTekniði (
  id int IDENTITY(1,1) PRIMARY KEY,						
  TeknikAdi varchar(35) default NULL,	
);

CREATE TABLE Materyal (
  id int IDENTITY(1,1) PRIMARY KEY,						
  MateryalAdi varchar(35) default NULL,	
);

CREATE TABLE Kaþif (
  id int IDENTITY(1,1) PRIMARY KEY,						
  Ad varchar(35) default NULL,
  Soyad varchar(35) default NULL,
  DogumTarihi date default NULL,
  OlumTarihi date default NULL,
);

CREATE TABLE Ülke (
  id int IDENTITY(1,1) PRIMARY KEY,						
  Ad varchar(35) default NULL,	

);

CREATE TABLE Bölge (
  id int IDENTITY(1,1) PRIMARY KEY,						
  Ad varchar(35) default NULL,	

);

CREATE TABLE Keþif (
  id int IDENTITY(1,1) PRIMARY KEY,	
  KasifId int default NULL,
  BolgeId int default NULL,
  UlkeId int default NULL,
  KesifTarihi date default NULL,
  CONSTRAINT FK_KasifId FOREIGN KEY (KasifId) REFERENCES Kaþif(id),
  CONSTRAINT FK_BolgeId FOREIGN KEY (BolgeId) REFERENCES Bölge(id),
  CONSTRAINT FK_UlkeId FOREIGN KEY (UlkeId) REFERENCES Ülke(id)
);

CREATE TABLE GeliþÞekli (
  id int IDENTITY(1,1) PRIMARY KEY	,					
  GeliþÞekliAdi varchar(35) default NULL,	

);

CREATE TABLE Eser (
  id int IDENTITY(1,1) PRIMARY KEY,							
  Ad varchar(35) default NULL,
  RafNo integer default NULL,
  Agirlik integer default NULL,
  Boy integer default NULL,
  En integer default NULL,
  Aciklama varchar(200) default NULL,
  EserYili date default NULL,
  SalonId int default NULL,
  EtkinlikId int default NULL,
  EserTipiId int default NULL,
  SanatçýId int default NULL,
  UygarlýkId int default NULL,
  DönemId int default NULL,
  YapýlýsTeknigiId int default NULL,
  MateryalId int default NULL,
  KesifId int default NULL,
  GelisSekliId int default NULL,
  Aktiflik int default NULL --aktiflik durumunu belirtir
					--aktif ise 1
					--aktif deðil ise 0
  CONSTRAINT FK_GelisSekliId FOREIGN KEY (GelisSekliId) REFERENCES GeliþÞekli(id),
  CONSTRAINT FK_KesifId FOREIGN KEY (KesifId) REFERENCES Keþif(id),
  CONSTRAINT FK_MateryalId FOREIGN KEY (MateryalId) REFERENCES Materyal(id),
  CONSTRAINT FK_YapýlýsTeknigiId FOREIGN KEY (YapýlýsTeknigiId) REFERENCES YapýlýþTekniði(id),
  CONSTRAINT FK_DönemId FOREIGN KEY (DönemId) REFERENCES Dönem(id),
  CONSTRAINT FK_UygarlýkId FOREIGN KEY (UygarlýkId) REFERENCES Uygarlýk(id),
  CONSTRAINT FK_SanatçýId FOREIGN KEY (SanatçýId) REFERENCES Sanatçý(id),
  CONSTRAINT FK_EserTipiId FOREIGN KEY (EserTipiId) REFERENCES EserTipi(id),
  CONSTRAINT FK_EtkinlikId FOREIGN KEY (EtkinlikId) REFERENCES Etkinlik(id),
  CONSTRAINT FK_SalonId_3 FOREIGN KEY (SalonId) REFERENCES Salon(id)
);

CREATE TABLE Kira (
  id int IDENTITY(1,1) PRIMARY KEY,
  EserId int default NULL,
  Ücret integer default NULL,
  BaslangicTarihi date default NULL,
  BitisTarihi date default NULL,
  HasarDurumu varchar(35) default NULL,
  MuzeId int default NULL,
  CONSTRAINT FK_MuzeId_3 FOREIGN KEY (MuzeId) REFERENCES Muze(id),
  CONSTRAINT FK_EserId FOREIGN KEY (EserId) REFERENCES Eser(id) ON DELETE CASCADE

);

ALTER TABLE Personel
	ADD CONSTRAINT FK_SalonId_4 FOREIGN KEY (SalonId) REFERENCES Salon(id);


ALTER TABLE Salon
	ADD CONSTRAINT FK_EtkinlikId_3 FOREIGN KEY (EtkinlikId) REFERENCES Etkinlik(id);