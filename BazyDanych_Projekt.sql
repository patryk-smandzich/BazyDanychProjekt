/*
TWORZENIE STRUKTURY BAZY DANYCH    
*/

CREATE DATABASE KURIER;


CREATE TABLE Klient (
ID_nadawca NUMBER(10) NOT NULL  PRIMARY KEY,
Imie_nadawca VARCHAR2(50) NOT NULL ,
Nazwisko_nadawca VARCHAR2(50) NOT NULL ,
Tel_nadawca VARCHAR2(12) NOT NULL ,
Ulica_nadawca VARCHAR2(50) NOT NULL ,
Nr_domu_nadawca VARCHAR2(12)  ,
Kod_pocztowy_nadawca VARCHAR2(12) NOT NULL ,
Nr_mieszkania_nadawca VARCHAR2(12)
);


CREATE TABLE Zamowienie (
ID_Zamowienie NUMBER(10) NOT NULL PRIMARY KEY,
ID_nadawca  NUMBER(10) NOT NULL ,
Ubezpieczenie   NUMBER(10) NOT NULL ,
ID_Paczka   NUMBER(10) NOT NULL , 
Koszt_netto   BINARY_DOUBLE NOT NULL , 
Koszt_bruto BINARY_DOUBLE NOT NULL 
);


CREATE TABLE Paczka (
ID_Paczka NUMBER(10) NOT NULL  PRIMARY KEY,
Waga BINARY_DOUBLE NOT NULL ,
Szerokosc BINARY_DOUBLE NOT NULL ,
Glebokosc BINARY_DOUBLE NOT NULL ,
Dlugosc BINARY_DOUBLE NOT NULL ,
Tel_odbiorca VARCHAR2(12) NOT NULL ,
Uwagi VARCHAR2(200),
Ulica_odbiorca VARCHAR2(50) NOT NULL ,
Nr_domu_odbiorca VARCHAR2(12)  ,
Kod_pocztowy_odbiorca VARCHAR2(12) NOT NULL ,
Nr_mieszkania_odbiorca VARCHAR2(12),
Imie_odbiorca VARCHAR2(50) NOT NULL ,
Nazwisko_odbiorca VARCHAR2(50) NOT NULL ,
Stan NUMBER(10) NOT NULL ,
Koszt_paczki BINARY_DOUBLE NOT NULL ,
Data_rozpoczecia_trasy DATE,
Data_zakonczenia_trasy DATE,
Trasa_id NUMBER(10) NOT NULL
);

CREATE TABLE Trasa (
Trasa_id NUMBER(10) NOT NULL PRIMARY KEY,
Data_odbiorOdKlienta DATE,
Data_dostawaDoCentrumLog DATE,
Data_odbiorOdCentrumLog DATE,
ID_samochod NUMBER(10) NOT NULL ,
Data_dostawaDoKlienta DATE 
);


CREATE TABLE Samochod (
ID_samochod NUMBER(10) NOT NULL PRIMARY KEY,
Marka VARCHAR2(50) NOT NULL,
Aktualny_Przebieg BINARY_DOUBLE NOT NULL,
Nastepny_przeglad DATE NOT NULL,
Awaria VARCHAR2(200)
);

CREATE TABLE Pracownik (
ID_pracownik NUMBER(10) NOT NULL PRIMARY KEY,
ID_samochod NUMBER(10) NOT NULL,
Imie_pracownik VARCHAR2(50) NOT NULL,
Nazwisko_pracownik VARCHAR2(50) NOT NULL,
Tel_pracownik VARCHAR2(12) NOT NULL,
haslo VARCHAR2(20),
Wyplata_id NUMBER(10) NOT NULL
);

CREATE TABLE Wyplata (
Wyplata_id NUMBER(10) NOT NULL PRIMARY KEY,
Wyplata_brutto BINARY_DOUBLE,
Wyplata_netto BINARY_DOUBLE,
Wyplata_data DATE NOT NULL

);



ALTER TABLE Zamowienie
ADD CONSTRAINT FK_KlientZamowienie
FOREIGN KEY (ID_nadawca) REFERENCES Klient(ID_nadawca);

ALTER TABLE Zamowienie
ADD CONSTRAINT FK_PaczkaZamowienie
FOREIGN KEY (ID_Paczka) REFERENCES Paczka(ID_Paczka);

ALTER TABLE Trasa
ADD CONSTRAINT FK_TrasaSamochod
FOREIGN KEY (ID_samochod) REFERENCES Samochod(ID_samochod);

ALTER TABLE Paczka
ADD CONSTRAINT FK_TrasaPaczka
FOREIGN KEY (Trasa_id) REFERENCES Trasa(Trasa_id);

ALTER TABLE Pracownik
ADD CONSTRAINT FK_SamochodPracownik
FOREIGN KEY (ID_samochod) REFERENCES Samochod(ID_samochod);

ALTER TABLE Pracownik
ADD CONSTRAINT FK_WyplataPracownik
FOREIGN KEY (Wyplata_id) REFERENCES Wyplata(Wyplata_id);


/*
5 X INSERT  DO WSZYSTKICH TABEL
*Początkowo struktura bazy była w MySQL zmieniłem ją na Oracle, dlatego niektóre inserty mogą sie nie zgadzać.
*/

INSERT INTO Klient (ID_nadawca, Imie_nadawca, Nazwisko_nadawca, Tel_nadawca, Ulica_nadawca,Nr_domu_nadawca,Kod_pocztowy_nadawca,Nr_mieszkania_nadawca) VALUES ('000001', 'Michal', 'Jakubiak' , '999111222' , '1 maja','3','45-876','');
INSERT INTO Klient (ID_nadawca, Imie_nadawca, Nazwisko_nadawca, Tel_nadawca, Ulica_nadawca,Nr_domu_nadawca,Kod_pocztowy_nadawca,Nr_mieszkania_nadawca) VALUES  ('000002', 'Jan', 'Kowalki' , '888999444' , 'Polna','55c','45-333','');
INSERT INTO Klient (ID_nadawca, Imie_nadawca, Nazwisko_nadawca, Tel_nadawca, Ulica_nadawca,Nr_domu_nadawca,Kod_pocztowy_nadawca,Nr_mieszkania_nadawca) VALUES  ('000003', 'Krzysztof', 'Urbaniec' , '98765421' , 'Wyzwolenia','32','45-444','');
INSERT INTO Klient (ID_nadawca, Imie_nadawca, Nazwisko_nadawca, Tel_nadawca, Ulica_nadawca,Nr_domu_nadawca,Kod_pocztowy_nadawca,Nr_mieszkania_nadawca) VALUES  ('000004', 'Anna', 'Reka' , '123456789' , 'Chemiczna','','45-555','44/2');
INSERT INTO Klient (ID_nadawca, Imie_nadawca, Nazwisko_nadawca, Tel_nadawca, Ulica_nadawca,Nr_domu_nadawca,Kod_pocztowy_nadawca,Nr_mieszkania_nadawca) VALUES  ('000005', 'Beata', 'Nowak' , '444555444' , 'Obozowa','','45-666','55/7');


INSERT INTO Wyplata (Wypłata_brutto, Wypłata_netto, Wypłata_data, Wypłata_id) VALUES ('2000.9', '1995.6', CONVERT(DATETIME, '12-10-2017', 102), '0001')
INSERT INTO Wyplata (Wypłata_brutto, Wypłata_netto, Wypłata_data, Wypłata_id) VALUES ('2200.9', '1995.6', CONVERT(DATETIME, '12-11-2017', 102), '0002')
INSERT INTO Wyplata (Wypłata_brutto, Wypłata_netto, Wypłata_data, Wypłata_id) VALUES ('2300.9', '1995.6', CONVERT(DATETIME, '12-12-2017', 102), '0003')
INSERT INTO Wyplata (Wypłata_brutto, Wypłata_netto, Wypłata_data, Wypłata_id) VALUES ('2400.9', '1995.6', CONVERT(DATETIME, '12-12-2017', 102), '0004')
INSERT INTO Wyplata (Wypłata_brutto, Wypłata_netto, Wypłata_data, Wypłata_id) VALUES ('2300.9', '1995.6', CONVERT(DATETIME, '12-12-2017', 102), '0005')


INSERT INTO Samochod (ID_samochod, Marka, Aktualny_Przebieg, Nastepny_przeglad,  Awaria) VALUES ('0001', 'Fiat', '19997',CONVERT(DATETIME, '12-10-2018', 102),'');
INSERT INTO Samochod (ID_samochod, Marka, Aktualny_Przebieg, Nastepny_przeglad,  Awaria) VALUES ('0002', 'Fiat', '19997', CONVERT(DATETIME, '02-04-2018', 102),'Hamulec');
INSERT INTO Samochod (ID_samochod, Marka, Aktualny_Przebieg, Nastepny_przeglad,  Awaria) VALUES ('0003', 'Fiat', '111244',CONVERT(DATETIME, '12-10-2018', 102),'');
INSERT INTO Samochod (ID_samochod, Marka, Aktualny_Przebieg, Nastepny_przeglad,  Awaria) VALUES ('0004', 'Fiat', '45437',CONVERT(DATETIME, '12-10-2018', 102),'Sprzęgło');
INSERT INTO Samochod (ID_samochod, Marka, Aktualny_Przebieg, Nastepny_przeglad,  Awaria) VALUES ('0005', 'Fiat', '6544447',CONVERT(DATETIME, '05-01-2018', 102),'');


INSERT INTO Pracownik (ID_samochod, ID_pracownik, Imie_pracownik, Nazwisko_pracownik, Tel_pracownik, haslo, Wypłata_id) VALUES ('0001', '0001', 'Krzysztof', 'Urbaniec', '333000999' , 'qwerty','0001');
INSERT INTO Pracownik (ID_samochod, ID_pracownik, Imie_pracownik, Nazwisko_pracownik, Tel_pracownik, haslo, Wypłata_id) VALUES ('0002', '0002', 'Andrzej', 'Młyn', '123321456' , 'haslo','0002');
INSERT INTO Pracownik (ID_samochod, ID_pracownik, Imie_pracownik, Nazwisko_pracownik, Tel_pracownik, haslo, Wypłata_id) VALUES ('0003', '0003', 'Julia', 'Kupka', '070000833' , 'passat19tdi','0003');
INSERT INTO Pracownik (ID_samochod, ID_pracownik, Imie_pracownik, Nazwisko_pracownik, Tel_pracownik, haslo, Wypłata_id) VALUES ('0004', '0004', 'Christoph', 'Kolumb', '778664229' , '0101pamela','0004');
INSERT INTO Pracownik (ID_samochod, ID_pracownik, Imie_pracownik, Nazwisko_pracownik, Tel_pracownik, haslo, Wypłata_id) VALUES ('0005', '0005', 'Wiesław', 'Wszywka', '756433555' , 'piwko','0005');

INSERT INTO Trasa (Trasa_id, Data_odbiorOdKlienta, Data_dostawaDoCentrumLog, Data_odbiorOdCentrumLog,ID_samochod, Data_dostawaDoKlienta) VALUES ('0001',CONVERT(DATETIME, '01-12-2017', 102) ,CONVERT(DATETIME, '01-11-2017', 102) ,CONVERT(DATETIME, '02-11-2017', 102) ,'0001',CONVERT(DATETIME, '02-11-2017', 102) );
INSERT INTO Trasa (Trasa_id, Data_odbiorOdKlienta, Data_dostawaDoCentrumLog, Data_odbiorOdCentrumLog,ID_samochod, Data_dostawaDoKlienta) VALUES ('0002',CONVERT(DATETIME, '01-12-2017', 102) ,CONVERT(DATETIME, '01-12-2017', 102) ,CONVERT(DATETIME, '01-12-2017', 102) ,'0002',CONVERT(DATETIME, '02-12-2017', 102) );
INSERT INTO Trasa (Trasa_id, Data_odbiorOdKlienta, Data_dostawaDoCentrumLog, Data_odbiorOdCentrumLog,ID_samochod, Data_dostawaDoKlienta) VALUES ('0003',CONVERT(DATETIME, '09-12-2017', 102) ,CONVERT(DATETIME, '09-12-2017', 102) ,CONVERT(DATETIME, '09-12-2017', 102) ,'0003',CONVERT(DATETIME, '10-12-2017', 102) );
INSERT INTO Trasa (Trasa_id, Data_odbiorOdKlienta, Data_dostawaDoCentrumLog, Data_odbiorOdCentrumLog,ID_samochod, Data_dostawaDoKlienta) VALUES ('0004',CONVERT(DATETIME, '12-12-2017', 102) ,CONVERT(DATETIME, '12-12-2017', 102) ,CONVERT(DATETIME, '12-12-2017', 102) ,'0004',CONVERT(DATETIME, '12-12-2017', 102) );
INSERT INTO Trasa (Trasa_id, Data_odbiorOdKlienta, Data_dostawaDoCentrumLog, Data_odbiorOdCentrumLog,ID_samochod, Data_dostawaDoKlienta) VALUES ('0005',CONVERT(DATETIME, '12-10-2017', 102) ,CONVERT(DATETIME, '12-10-2017', 102) ,CONVERT(DATETIME, '12-10-2017', 102) ,'0005',CONVERT(DATETIME, '12-11-2017', 102) );

INSERT INTO Paczka (Waga, Szerokosc, Glebokosc, Dlugosc, Tel_odbiorca, Uwagi, Ulica_odbiorca, Nr_domu_odbiorca, Kod_pocztowy_odbiorca, Nr_mieszkania_odbiorca, Imie_odbiorca, Nazwisko_odbiorca, ID_Paczka, Stan, Koszt_paczki, Data_rozpoczecia_trasy,Data_zakonczenia_trasy, Trasa_id) VALUES ('33.3', '33.3' , '33.3','5.5', '0988088', 'brak','Wyzwolenia','32','45-444','' , 'Jan', 'Wołwoczyk' , '0001' ,'1', '8','02-11-2017', '05-11-2017','0001');
INSERT INTO Paczka (Waga, Szerokosc, Glebokosc, Dlugosc, Tel_odbiorca, Uwagi, Ulica_odbiorca, Nr_domu_odbiorca, Kod_pocztowy_odbiorca, Nr_mieszkania_odbiorca, Imie_odbiorca, Nazwisko_odbiorca, ID_Paczka, Stan, Koszt_paczki, Data_rozpoczecia_trasy,Data_zakonczenia_trasy, Trasa_id) VALUES ('33.3', '33.3' , '33.3','5.5', '09808585', 'Szkło','Chemiczna','','45-555','44/2', 'Jan', 'Wołwoczyk' , '0002','2', '8','02-11-2017', '05-11-2017','0002');
INSERT INTO Paczka (Waga, Szerokosc, Glebokosc, Dlugosc, Tel_odbiorca, Uwagi, Ulica_odbiorca, Nr_domu_odbiorca, Kod_pocztowy_odbiorca, Nr_mieszkania_odbiorca, Imie_odbiorca, Nazwisko_odbiorca, ID_Paczka, Stan, Koszt_paczki, Data_rozpoczecia_trasy,Data_zakonczenia_trasy, Trasa_id) VALUES ('6.87', '42.3' , '32.1','22.97', '88877999', 'brak', 'Obozowa','','45-666','55/7', 'Laura', 'Kowalska', '0003','1', '8.9','02-11-2017', '05-11-2017','0003');
INSERT INTO Paczka (Waga, Szerokosc, Glebokosc, Dlugosc, Tel_odbiorca, Uwagi, Ulica_odbiorca, Nr_domu_odbiorca, Kod_pocztowy_odbiorca, Nr_mieszkania_odbiorca, Imie_odbiorca, Nazwisko_odbiorca, ID_Paczka, Stan, Koszt_paczki, Data_rozpoczecia_trasy,Data_zakonczenia_trasy, Trasa_id) VALUES ('1.8', '54' , '12','5.5', '00099000', 'brak', '1 maja','3','45-876','', 'Halina', 'Jureczko', '0004','1', '10','02-11-2017', '05-11-2017','0004');
INSERT INTO Paczka (Waga, Szerokosc, Glebokosc, Dlugosc, Tel_odbiorca, Uwagi, Ulica_odbiorca, Nr_domu_odbiorca, Kod_pocztowy_odbiorca, Nr_mieszkania_odbiorca, Imie_odbiorca, Nazwisko_odbiorca, ID_Paczka, Stan, Koszt_paczki, Data_rozpoczecia_trasy,Data_zakonczenia_trasy, Trasa_id) VALUES ('0.2', '56.65' , '356', '12', '21244323', 'brak','Polna','55c','45-333','', 'Grzegorz', 'Wloch', '0005','1', '6.9','02-11-2017', '05-11-2017','0005');

INSERT INTO Zamówienie (ID_nadawca, ID_Zamowienie, Ubezpieczenie, ID_Paczka, Koszt_netto, Koszt_bruto) VALUES ('000001', '0001','1', '0001', '12.6', '13');
INSERT INTO Zamówienie (ID_nadawca, ID_Zamowienie, Ubezpieczenie, ID_Paczka, Koszt_netto, Koszt_bruto) VALUES ('000002', '0002','1', '0002', '53', '54');
INSERT INTO Zamówienie (ID_nadawca, ID_Zamowienie, Ubezpieczenie, ID_Paczka, Koszt_netto, Koszt_bruto) VALUES ('000003', '0003','1', '0003', '11', '12.7');
INSERT INTO Zamówienie (ID_nadawca, ID_Zamowienie, Ubezpieczenie, ID_Paczka, Koszt_netto, Koszt_bruto) VALUES ('000004', '0004','0', '0004', '33.9', '35');
INSERT INTO Zamówienie (ID_nadawca, ID_Zamowienie, Ubezpieczenie, ID_Paczka, Koszt_netto, Koszt_bruto) VALUES ('000005', '0005','0', '0005', '12.6', '13.7');

/*
3 X SELECT 
*/

SELECT TEL_nadawca, IMIE_NADAWCA
FROM KLIENT
WHERE NAZWISKO_NADAWCA = 'Reka'

SELECT WAGA, SZEROKOSC,ID_PACZKA
FROM PACZKA
WHERE WAGA>10


SELECT TEL_nadawca, IMIE_NADAWCA, Zamówienie.ID_Zamowienie, Paczka.Uwagi
FROM KLIENT 
INNER JOIN Zamówienie ON Klient.ID_nadawca=Zamówienie.ID_nadawca
INNER JOIN Paczka ON Zamówienie.ID_Paczka=Paczka.ID_Paczka
ORDER BY Uwagi;

/*
3 X UPDATE  DO WSZYSTKICH TABEL   
*/

UPDATE klient
SET tel_nadawca = '10000001'
WHERE ID_nadawca= 0001;

UPDATE paczka
SET waga = '55.8'
WHERE ID_PACZKA= 0003;

UPDATE ZAMÓWIENIE
SET Koszt_netto= '9.9'
WHERE ID_ZAMOWIENIE= 001;

/*
3 X DELETE  DO WSZYSTKICH TABEL  
*/

DELETE FROM PRACOWNIK
WHERE Imie_pracownik='Julia' ;


DELETE FROM PRACOWNIK
WHERE haslo='piwko' ;

DELETE FROM PRACOWNIK
WHERE  Tel_pracownik='778664229';

/*
USUWANIE STRUKTURY BAZY DANYCH   
*/

DROP TABLE Pracownik;
DROP TABLE Wyplata;
DROP TABLE Zamówienie;
DROP TABLE Klient;
DROP TABLE Paczka;
DROP TABLE Trasa;
DROP TABLE Samochod;


DROP DATABASE KURIER; 


/*
GENERATOR DANYCH DO UPRZEDNIO STWORZONEJ STRUKTURY BAZY DANYCH (300 WIERSZY)
*/

CREATE SEQUENCE Klient_sequence;
CREATE SEQUENCE Wyplata_sequence;
CREATE SEQUENCE Samochod_sequence;
CREATE SEQUENCE Pracownik_sequence;
CREATE SEQUENCE Trasa_sequence;
CREATE SEQUENCE Paczka_sequence;
CREATE SEQUENCE Zamowienie_sequence;


CREATE OR REPLACE PROCEDURE automatyczneZapelnianie (ileDanych INTEGER) AS

begin

INSERT INTO Klient
SELECT klient_sequence.nextval AS ID_nadawca
     , DBMS_RANDOM.string( 'L',TRUNC( DBMS_RANDOM.value( 2,20 ) ) ) AS Imie_nadawca
     , DBMS_RANDOM.string( 'L',TRUNC( DBMS_RANDOM.value( 2,20 ) ) ) AS Nazwisko_nadawca
	 , TRUNC(DBMS_RANDOM.value( 100000000,999999999 ) ) AS Tel_nadawca
	 , DBMS_RANDOM.string( 'L',TRUNC(DBMS_RANDOM.value( 2,30 ) ) ) AS Ulica_nadawca
     , TRUNC(DBMS_RANDOM.value( 10000,99999 ) ) AS Kod_pocztowy_nadawca
	 , DBMS_RANDOM.string( 'L',TRUNC(DBMS_RANDOM.value( 2,11 ) ) ) AS Nr_domu
	 , DBMS_RANDOM.string( 'L',TRUNC(DBMS_RANDOM.value( 2,11 ) ) ) AS Nr_mieszkania_nadawca
	 --Dual to nic innego jak tabela, która tworzona jest wraz z bazą danych w schemacie SYS
FROM   dual
--pseudotabela
CONNECT BY level <= ileDanych ;
COMMIT ;






INSERT INTO Wyplata
SELECT wyplata_sequence.nextval AS Wyplata_id 
, TRUNC( DBMS_RANDOM.value( 15,2000 ) ) AS Wyplata_brutto
, TRUNC( DBMS_RANDOM.value( 15,2000 ) ) AS Wyplata_netto
, TRUNC( SYSDATE + DBMS_RANDOM.value( 0,366 ) ) AS Wyplata_data
FROM   dual
CONNECT BY level <= ileDanych ;
COMMIT ;






INSERT INTO Samochod
SELECT Samochod_sequence.nextval AS ID_samochod
     , DBMS_RANDOM.string( 'L',TRUNC( DBMS_RANDOM.value( 2,20 ) ) ) AS Marka
     , TRUNC( DBMS_RANDOM.value( 15,2000 ) ) AS Aktualny_Przebieg
     , TRUNC( SYSDATE + DBMS_RANDOM.value( 0,366 ) ) AS Nastepny_przeglad
     , DBMS_RANDOM.string( 'L',TRUNC( DBMS_RANDOM.value( 2,100 ) ) ) AS Imie_nadawca
FROM   dual
CONNECT BY level <= ileDanych ;
COMMIT ;






INSERT INTO Pracownik (ID_pracownik, ID_samochod, Imie_pracownik, Nazwisko_pracownik, Tel_pracownik, haslo, Wyplata_id )
SELECT klient_sequence.nextval AS ID_pracownik
     , ID_samochod
     , DBMS_RANDOM.string( 'L',TRUNC( DBMS_RANDOM.value( 2,20 ) ) ) AS Imie_pracownik
     , DBMS_RANDOM.string( 'L',TRUNC( DBMS_RANDOM.value( 2,20 ) ) ) AS Nazwisko_pracownik
     , TRUNC(DBMS_RANDOM.value( 100000000,999999999 ) ) AS Tel_pracownik
     , DBMS_RANDOM.string( 'L',TRUNC( DBMS_RANDOM.value( 2,20 ) ) ) AS haslo
     , Wyplata_id
from   
(
select 
sam.ID_samochod ID_samochod
, wyp.wyplata_id wyplata_id
from Samochod sam, Wyplata wyp
order by dbms_random.value 
)
--Jak wybrać n rekordów z tabeli,
where rownum <= ileDanych ;
COMMIT ;


INSERT INTO Trasa (Trasa_id, Data_odbiorOdKlienta , Data_dostawaDoCentrumLog, Data_odbiorOdCentrumLog, ID_samochod, Data_dostawaDoKlienta )
SELECT Trasa_sequence.nextval AS Trasa_id
     , TRUNC( SYSDATE + DBMS_RANDOM.value( 0,366 ) ) AS Data_odbiorOdKlienta
     , TRUNC( SYSDATE + DBMS_RANDOM.value( 0,366 ) ) AS Data_odbiorOdKlienta
     , TRUNC( SYSDATE + DBMS_RANDOM.value( 0,366 ) ) AS Data_dostawaDoCentrumLog
     , ID_samochod
     , TRUNC( SYSDATE + DBMS_RANDOM.value( 0,366 ) ) AS Data_dostawaDoKlienta
from   
(
select 
sam.ID_samochod ID_samochod
from Samochod sam
order by dbms_random.value 
)
where rownum <= ileDanych ;
COMMIT ;


INSERT INTO Paczka (ID_Paczka, Waga , Szerokosc, Glebokosc, Dlugosc, Tel_odbiorca, Uwagi, Ulica_odbiorca, Nr_domu_odbiorca, Kod_pocztowy_odbiorca, Nr_mieszkania_odbiorca, Imie_odbiorca, Nazwisko_odbiorca, Stan, Koszt_paczki, Data_rozpoczecia_trasy , Data_zakonczenia_trasy , Trasa_id)
SELECT Paczka_sequence.nextval AS ID_Paczka
     , TRUNC( DBMS_RANDOM.value( 15,2000 ) ) AS Waga
     , TRUNC( DBMS_RANDOM.value( 15,2000 ) ) AS Szerokosc
     , TRUNC( DBMS_RANDOM.value( 15,2000 ) ) AS  Glebokosc
     , TRUNC( DBMS_RANDOM.value( 15,2000 ) ) AS Dlugosc
     , TRUNC(DBMS_RANDOM.value( 100000000,999999999 ) ) AS Tel_odbiorca
     , DBMS_RANDOM.string( 'L',TRUNC( DBMS_RANDOM.value( 2,199 ) ) ) AS Uwagi
      , DBMS_RANDOM.string( 'L',TRUNC(DBMS_RANDOM.value( 2,30 ) ) ) AS Ulica_odbiorca
      , DBMS_RANDOM.string( 'L',TRUNC(DBMS_RANDOM.value( 2,11 ) ) ) AS Nr_domu_odbiorca
      , TRUNC(DBMS_RANDOM.value( 10000,99999 ) ) AS Kod_pocztowy_odbiorca
     , DBMS_RANDOM.string( 'L',TRUNC(DBMS_RANDOM.value( 2,11 ) ) ) AS Nr_mieszkania_odbiorca
     , DBMS_RANDOM.string( 'L',TRUNC( DBMS_RANDOM.value( 2,20 ) ) ) AS Imie_odbiorca
     , DBMS_RANDOM.string( 'L',TRUNC( DBMS_RANDOM.value( 2,20 ) ) ) AS Nazwisko_odbiorca
     , TRUNC( DBMS_RANDOM.value( 2,9 ) ) AS Stan
      , TRUNC( DBMS_RANDOM.value( 2,1000 ) ) AS Koszt_paczki
      , TRUNC( SYSDATE + DBMS_RANDOM.value( 0,366 ) ) AS Data_rozpoczecia_trasy 
      , TRUNC( SYSDATE + DBMS_RANDOM.value( 0,366 ) ) AS Data_zakonczenia_trasy 
     , Trasa_ID
from   
(
select 
tra.Trasa_id Trasa_id
from Trasa tra
order by dbms_random.value 
)
where rownum <= ileDanych ;
COMMIT ;




INSERT INTO Zamowienie (ID_Zamowienie, ID_nadawca, Ubezpieczenie, ID_Paczka, Koszt_netto, Koszt_bruto)
SELECT Zamowienie_sequence.nextval AS ID_Zamowienie
     , ID_NADAWCA
     , TRUNC( DBMS_RANDOM.value( 2,9 ) )  AS Ubezpieczenie
     , ID_Paczka
     , TRUNC( DBMS_RANDOM.value( 15,2000 ) ) AS KOSZT_BRUTO
     , TRUNC( DBMS_RANDOM.value( 15,2000 ) ) AS KOSZT_NETTO
from   
(
select 
kli.ID_NADAWCA ID_NADAWCA 
, pacz.ID_Paczka ID_Paczka 
from Klient kli, Paczka pacz
order by dbms_random.value 
)
where rownum <= ileDanych ;
COMMIT ;





END;
/
EXECUTE automatyczneZapelnianie (300);

/*
INDEKS ZŁOŻONY
Indeks samochod_indeks ma wypisać następny przegląd samochodu o ID_Samochod równym 3; 
*/

CREATE INDEX samochod_indeks ON Samochod (ID_Samochod, nastepny_przeglad);
select ID_Samochod, nastepny_przeglad from samochod where ID_Samochod=3;


/*
INDEKS FUNKCYJNY
Używam indeksu funkcyjnego w celu zmienienia małych liter na duże w takim celu, by Oracle nie musiał przeszukiwać całej tabeli w poszukiwaniu wiersza.
*/

CREATE INDEX imie_index ON klient (UPPER(Imie_nadawca));
SET AUTOTRACE ON
SELECT * FROM klient WHERE UPPER(Imie_nadawca) ='VVZP';

/*
INDEKS BITMAPOWY
Indeks paczka_indeks ma na celu zliczenie wszystkich rekordów yabeli PACZKA, gdzie STAN jest równy 2.
*/

CREATE BITMAP INDEX paczka_indeks ON PACZKA (STAN);
SELECT COUNT(*) FROM PACZKA WHERE STAN IN (2);
