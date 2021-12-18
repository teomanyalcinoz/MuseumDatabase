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
  �cret integer default NULL,
 
);



CREATE TABLE Bilet (
  id int IDENTITY(1,1) PRIMARY KEY,							
  BiletTipiId int default NULL,
  ZiyaretciId int default NULL,
  Baslang�cTarihi date default NULL,
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
					--aktif de�il ise 0
  CONSTRAINT FK_GorevId FOREIGN KEY (GorevId) REFERENCES Gorev(id),
   CONSTRAINT FK_MuzeId_1 FOREIGN KEY (MuzeId) REFERENCES Muze(id)
);

CREATE TABLE Etkinlik (
  id int IDENTITY(1,1) PRIMARY KEY,						
  EtkinlikAd� varchar(35) default NULL,
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
  TipAd� varchar(35) default NULL,	
);

CREATE TABLE Sanat�� (
  id int IDENTITY(1,1) PRIMARY KEY,						
  Ad varchar(35) default NULL,
  Soyad varchar(35) default NULL,
  DogumTarihi date default NULL,
  OlumTarihi date default NULL,
);

CREATE TABLE Uygarl�k (
 id int IDENTITY(1,1) PRIMARY KEY,						
  Ad varchar(35) default NULL,
  Baslang�cYili varchar(35) default NULL,
  BitisYili varchar(35) default NULL,
);

CREATE TABLE D�nem (
  id int IDENTITY(1,1) PRIMARY KEY,						
  DonemAdi varchar(35) default NULL,	
);

CREATE TABLE Yap�l��Tekni�i (
  id int IDENTITY(1,1) PRIMARY KEY,						
  TeknikAdi varchar(35) default NULL,	
);

CREATE TABLE Materyal (
  id int IDENTITY(1,1) PRIMARY KEY,						
  MateryalAdi varchar(35) default NULL,	
);

CREATE TABLE Ka�if (
  id int IDENTITY(1,1) PRIMARY KEY,						
  Ad varchar(35) default NULL,
  Soyad varchar(35) default NULL,
  DogumTarihi date default NULL,
  OlumTarihi date default NULL,
);

CREATE TABLE �lke (
  id int IDENTITY(1,1) PRIMARY KEY,						
  Ad varchar(35) default NULL,	

);

CREATE TABLE B�lge (
  id int IDENTITY(1,1) PRIMARY KEY,						
  Ad varchar(35) default NULL,	

);

CREATE TABLE Ke�if (
  id int IDENTITY(1,1) PRIMARY KEY,	
  KasifId int default NULL,
  BolgeId int default NULL,
  UlkeId int default NULL,
  KesifTarihi date default NULL,
  CONSTRAINT FK_KasifId FOREIGN KEY (KasifId) REFERENCES Ka�if(id),
  CONSTRAINT FK_BolgeId FOREIGN KEY (BolgeId) REFERENCES B�lge(id),
  CONSTRAINT FK_UlkeId FOREIGN KEY (UlkeId) REFERENCES �lke(id)
);

CREATE TABLE Geli��ekli (
  id int IDENTITY(1,1) PRIMARY KEY	,					
  Geli��ekliAdi varchar(35) default NULL,	

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
  Sanat��Id int default NULL,
  Uygarl�kId int default NULL,
  D�nemId int default NULL,
  Yap�l�sTeknigiId int default NULL,
  MateryalId int default NULL,
  KesifId int default NULL,
  GelisSekliId int default NULL,
  Aktiflik int default NULL --aktiflik durumunu belirtir
					--aktif ise 1
					--aktif de�il ise 0
  CONSTRAINT FK_GelisSekliId FOREIGN KEY (GelisSekliId) REFERENCES Geli��ekli(id),
  CONSTRAINT FK_KesifId FOREIGN KEY (KesifId) REFERENCES Ke�if(id),
  CONSTRAINT FK_MateryalId FOREIGN KEY (MateryalId) REFERENCES Materyal(id),
  CONSTRAINT FK_Yap�l�sTeknigiId FOREIGN KEY (Yap�l�sTeknigiId) REFERENCES Yap�l��Tekni�i(id),
  CONSTRAINT FK_D�nemId FOREIGN KEY (D�nemId) REFERENCES D�nem(id),
  CONSTRAINT FK_Uygarl�kId FOREIGN KEY (Uygarl�kId) REFERENCES Uygarl�k(id),
  CONSTRAINT FK_Sanat��Id FOREIGN KEY (Sanat��Id) REFERENCES Sanat��(id),
  CONSTRAINT FK_EserTipiId FOREIGN KEY (EserTipiId) REFERENCES EserTipi(id),
  CONSTRAINT FK_EtkinlikId FOREIGN KEY (EtkinlikId) REFERENCES Etkinlik(id),
  CONSTRAINT FK_SalonId_3 FOREIGN KEY (SalonId) REFERENCES Salon(id)
);

CREATE TABLE Kira (
  id int IDENTITY(1,1) PRIMARY KEY,
  EserId int default NULL,
  �cret integer default NULL,
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