CREATE DATABASE konyvtar;
USE konyvtar;

DROP TABLE IF EXISTS kolcsonzes;
DROP TABLE IF EXISTS konyvtari_konyv;
DROP TABLE IF EXISTS tag;
DROP TABLE IF EXISTS konyvszerzo;
DROP TABLE IF EXISTS konyv;
DROP TABLE IF EXISTS szerzo;

CREATE TABLE szerzo (
  szerzo_azon      INT PRIMARY KEY,
  vezeteknev       VARCHAR(30),
  keresztnev       VARCHAR(20),
  szuletesi_datum  DATE
);

CREATE TABLE konyv (
  konyv_azon      INT PRIMARY KEY,
  cim             VARCHAR(200) NOT NULL,
  isbn            VARCHAR(13) UNIQUE,
  kiado           VARCHAR(200),
  kiadas_datuma   DATE,
  ar              DECIMAL(8,2),
  tema            VARCHAR(30),
  oldalszam       INT
);

CREATE TABLE konyvszerzo (
  szerzo_azon     INT,
  konyv_azon      INT,
  honorarium      DECIMAL(10,2),
  PRIMARY KEY (szerzo_azon, konyv_azon),
  FOREIGN KEY (szerzo_azon) REFERENCES szerzo(szerzo_azon),
  FOREIGN KEY (konyv_azon) REFERENCES konyv(konyv_azon)
);

CREATE TABLE tag (
  olvasojegyszam      VARCHAR(20) PRIMARY KEY,
  vezeteknev          VARCHAR(30),
  keresztnev          VARCHAR(20),
  szuletesi_datum     DATE,
  nem                CHAR(1),
  cim                VARCHAR(200),
  beiratkozasi_datum DATE,
  tagdij             DECIMAL(7,2),
  besorolas          VARCHAR(20)
);

CREATE TABLE konyvtari_konyv (
  leltari_szam    VARCHAR(20) PRIMARY KEY,
  konyv_azon      INT NOT NULL,
  ertek           DECIMAL(10,2),
  FOREIGN KEY (konyv_azon) REFERENCES konyv(konyv_azon)
);

CREATE TABLE kolcsonzes (
  tag_azon           VARCHAR(20),
  leltari_szam       VARCHAR(20),
  kolcsonzesi_datum  DATE,
  hany_napra         INT DEFAULT 30,
  visszahozasi_datum DATE,
  kesedelmi_dij      DECIMAL(6,2),
  PRIMARY KEY (tag_azon, leltari_szam, kolcsonzesi_datum),
  FOREIGN KEY (tag_azon) REFERENCES tag(olvasojegyszam),
  FOREIGN KEY (leltari_szam) REFERENCES konyvtari_konyv(leltari_szam)
);

INSERT INTO konyv VALUES(1116152201, 'Tíz kicsi néger', '9789630788984', 'EURÓPA KÖNYVKIADÓ KFT.', STR_TO_DATE('2010-01-01', '%Y-%m-%d'), 2090, 'krimi', 266);
INSERT INTO konyv VALUES(1116152202, 'A váratlan vendég', '9789635490479', 'EURÓPA KÖNYVKIADÓ KFT.', STR_TO_DATE('2004-01-01', '%Y-%m-%d'), 1406, 'krimi', 200);
INSERT INTO konyv VALUES(1116152203, 'És eljő a halál...', '9789630786430', 'EURÓPA KÖNYVKIADÓ KFT.', STR_TO_DATE('2007-01-01', '%Y-%m-%d'), 1900, 'krimi', 292);
INSERT INTO konyv VALUES(1116152204, 'Tűzvarázs', '9789639300347', 'FABYEN KIADÓ', STR_TO_DATE('2010-01-01', '%Y-%m-%d'), 1836, 'krimi', 488);
INSERT INTO konyv VALUES(1116152205, 'A bankár', '9789632544137', 'ULPIUS-HÁZ KÖNYVKIADÓ KFT.', STR_TO_DATE('2011-09-22', '%Y-%m-%d'), 2799, 'krimi', NULL);
INSERT INTO konyv VALUES(1116152206, 'Vészbejárat', '9789639300279', 'Fabyen Kiadó', STR_TO_DATE('2008-01-01', '%Y-%m-%d'), 2095, 'krimi', 472);
INSERT INTO konyv VALUES(1116152207, 'Ébredj velem!', '9639300200', 'Tóthágas Kiadó', STR_TO_DATE('2007-01-01', '%Y-%m-%d'), 1668, 'krimi', 490);
INSERT INTO konyv VALUES(1116152208, 'Holtak könyvtára', '9789639973114', 'GEOPEN KÖNYVKIADÓ KFT.', STR_TO_DATE('2010-01-01', '%Y-%m-%d'), 3316, 'krimi', 400);
INSERT INTO konyv VALUES(1116152209, 'A vád tanúja', '963841345X', 'Hunga-Print', STR_TO_DATE('1994-01-01', '%Y-%m-%d'), 3000, 'krimi', 254);
INSERT INTO konyv VALUES(1116152210, 'A tűzgyújtó', '9789630786836', 'EURÓPA KÖNYVKIADÓ KFT.', STR_TO_DATE('2010-01-01', '%Y-%m-%d'), 3040, 'krimi', 520);
INSERT INTO konyv VALUES(1116152211, 'Álomcsapda', '9630779501', 'EURÓPA KÖNYVKIADÓ KFT.', STR_TO_DATE('2006-01-01', '%Y-%m-%d'), 1870, 'sci-fi', 752);
INSERT INTO konyv VALUES(1116152212, 'Hasznos holmik', '9630778246', 'EURÓPA KÖNYVKIADÓ KFT.', STR_TO_DATE('2005-01-01', '%Y-%m-%d'), 1683, 'horror', 720);
INSERT INTO konyv VALUES(1116152213, 'Dolores', '9600781875', 'EURÓPA KÖNYVKIADÓ KFT.', STR_TO_DATE('2006-01-01', '%Y-%m-%d'), 2125, 'thriller', 264);
INSERT INTO konyv VALUES(1116152214, 'Fagyos éden', '9789639828605', 'METROPOLIS MEDIA GROUP', STR_TO_DATE('2010-01-01', '%Y-%m-%d'), 3791, 'sci-fi', 460);
INSERT INTO konyv VALUES(1116152215, 'Fény a horizonton', '9789639566873', 'CHERUBION KÖNYVKIADÓ ÉS SZOLG.', STR_TO_DATE('2010-01-01', '%Y-%m-%d'), 1753, 'sci-fi', 344);
INSERT INTO konyv VALUES(1116152216, 'Fényözön', '9639346888', 'Cherubion Könyvkiadó', STR_TO_DATE('2003-01-01', '%Y-%m-%d'), 1444, 'sci-fi', 392);
INSERT INTO konyv VALUES(1116152217, 'A vénusz óceánjai', '9637429174', 'Cédrus Kiadó', STR_TO_DATE('1992-01-01', '%Y-%m-%d'), 1036, 'sci-fi', 158);
INSERT INTO konyv VALUES(1116152218, 'A biológia rövid története', '11111111111', 'Gondolat Kiadó', STR_TO_DATE('1972-01-01', '%Y-%m-%d'), 1200, 'természettudomány', 278);
INSERT INTO konyv VALUES(1116152219, 'A Hold tragédiája', '22222222222', 'Kozmosz Könyvek', STR_TO_DATE('1979-01-01', '%Y-%m-%d'), 1500, 'szépirodalom', 310);
INSERT INTO konyv VALUES(1116152220, 'Hazám, hazám, te mindenem', '9789632511993', 'SZALAY-PANNON-LITERATÚRA KFT.', STR_TO_DATE('2010-01-01', '%Y-%m-%d'), 2660, 'történelem', 128);
INSERT INTO konyv VALUES(1116152221, 'Az Osztrák-Magyar Monarchia tengerészeti repülői 1911-1918', '9789633275092', 'ZRÍNYI KIADÓ', STR_TO_DATE('2010-01-01', '%Y-%m-%d'), 4741, 'történelem', 112);
INSERT INTO konyv VALUES(1116152222, 'A magyar királyi honvédség légvédelme 1920-1945', '9789633274989', 'EURÓPA KÖNYVKIADÓ KFT.', STR_TO_DATE('2010-01-01', '%Y-%m-%d'), 4741, 'történelem', 150);
INSERT INTO konyv VALUES(1116152223, 'Napóleon', '9500274612', 'EURÓPA KÖNYVKIADÓ KFT.', STR_TO_DATE('2004-04-01', '%Y-%m-%d'), 2300, 'történelem', 653);
INSERT INTO konyv VALUES(1116152224, 'Napóleon', '963280256X', 'Gondolat', STR_TO_DATE('1975-01-01', '%Y-%m-%d'), 1500, 'történelem', 783);
INSERT INTO konyv VALUES(1116152225, 'A Föld enciklopédiája', '9789630961615', 'KOSSUTH KIADÓ ZRT.', STR_TO_DATE('2010-01-01', '%Y-%m-%d'), 9491, 'természettudomány', 608);
INSERT INTO konyv VALUES(1116152226, 'Éjféltájt', '9789630786249', 'EURÓPA KÖNYVKIADÓ KFT.', STR_TO_DATE('2008-01-01', '%Y-%m-%d'), 1900, 'krimi', 272);
INSERT INTO konyv VALUES(1116152227, 'Az élet erőpróbái', '9638227117', 'PARK KÖNYVKIADÓ KFT.', STR_TO_DATE('1994-01-01', '%Y-%m-%d'), 1701, 'természettudomány', 326);
INSERT INTO konyv VALUES(1116152228, 'Az élő bolygó - a föld mai arculata', '9635300077', 'PARK KÖNYVKIADÓ KFT.', STR_TO_DATE('1994-01-01', '%Y-%m-%d'), 2081, 'természettudomány', 324);
INSERT INTO konyv VALUES(1116152229, 'Az első édenkert', '9630267217', 'PARK KÖNYVKIADÓ KFT.', STR_TO_DATE('1989-01-01', '%Y-%m-%d'), 1200, 'természettudomány', 238);
INSERT INTO konyv VALUES(1116152230, 'Az óceán', '9789639693456', 'Mérték Kiadó', STR_TO_DATE('2007-01-01', '%Y-%m-%d'), 11042, 'természettudomány', 512);
INSERT INTO konyv VALUES(1116152231, 'Az univerzum', '963-967-800-7', 'IKAR Kiadó', STR_TO_DATE('2007-01-01', '%Y-%m-%d'), 11042, 'természettudomány', 512);
INSERT INTO konyv VALUES(1116152232, 'A gyevi törvény - Tanulságos mesék, mondák Mátyás királyról', '9789639581197', 'NAGYKÖNYV KIADÓ', STR_TO_DATE('2010-01-01', '%Y-%m-%d'), 1511, 'mesekönyv', 48);
INSERT INTO konyv VALUES(1116152233, 'A nagyhatalmú sündisznócska', '9789633468814', ' HOLNAP KIADÓ KFT.', STR_TO_DATE('2010-01-01', '%Y-%m-%d'), 1615, 'mesekönyv', 14);
INSERT INTO konyv VALUES(1116152234, 'Aranykoporsó', '9789630779180', 'EURÓPA KÖNYVKIADÓ KFT.', STR_TO_DATE('2005-01-01', '%Y-%m-%d'), 808, 'szépirodalom', 472);
INSERT INTO konyv VALUES(1116152235, '1848 - a magyar szabadságharcz 1848-49-ben', '9789630960519', 'KOSSUTH KIADÓ ZRT.', STR_TO_DATE('2009-01-01', '%Y-%m-%d'), 6641, 'történelem', 476);
INSERT INTO konyv VALUES(1116152236, 'A kőszívű ember fiai', '9789636451004', 'EURÓPA KÖNYVKIADÓ KFT.', STR_TO_DATE('2006-01-01', '%Y-%m-%d'), 758, 'szépirodalom', 442);
INSERT INTO konyv VALUES(1116152237, 'A .NET 4.0 és a Visual Studio 2010-01-01', '9789639453259', 'SZALAY KIADÓ', STR_TO_DATE('2011-01-01', '%Y-%m-%d'), 2495, 'programozás', 268);
insert into konyv values(1116152238, 'Java-fejtörők - Csapdák, buktatók és szélsőséges esetek', '9789639637702', 'KISKAPU KIADÓ', STR_TO_DATE('2010-01-01', '%Y-%m-%d'), 5220, 'informatika', 270);
insert into konyv values(1116152239, 'Az XML-kézikönyv', '9789639131712', 'EURÓPA KÖNYVKIADÓ KFT.', STR_TO_DATE('2005-01-01', '%Y-%m-%d'), 10260, 'informatika', 758);
insert into konyv values(1116152240, 'Java alapú webszolgáltatások - XML, SOAP, WSDL, UDDI', '9789639301047', 'KISKAPU KIADÓ', STR_TO_DATE('2002-01-01', '%Y-%m-%d'), 4741, 'informatika', 644);
insert into konyv values(1116152241, 'Refactoring - Kódjavítás újratervezéssel', '9639637130', 'Kiskapu Kiadó', STR_TO_DATE('2006-01-01', '%Y-%m-%d'), 5525, 'informatika', 372);
insert into konyv values(1116152242, 'Domain-Specific Languages', '9780321712943', 'Addison-Wesley Professional', STR_TO_DATE('2010-01-10', '%Y-%m-%d'), 8735, 'informatika', 640);
insert into konyv values(1116152243, 'Design Patterns: Elements of Reusable Object-Oriented Software', '9780201633610', 'Addison-Wesley Professional', STR_TO_DATE('1994-11-10', '%Y-%m-%d'), 5980, 'informatika', 416);
insert into konyv values(1116152244, 'Programtervezési minták - Újrahasznosítható elemek objektumközpontú programokhoz', '9639301779', 'Kiskapu - Addison-Wesley', STR_TO_DATE('2004-01-01', '%Y-%m-%d'), 5980, 'informatika', 421);

insert into konyv values(1116152245, 'Nostradamus', '9637905146', 'Média Kiadó', STR_TO_DATE('1991-01-01', '%Y-%m-%d'), 260, null, 362);
insert into konyv values(1116152246, 'A Biblia kódja', '9639069817', 'Vince Kiadó Kft.', STR_TO_DATE('1999-01-01', '%Y-%m-%d'), 1495, null, 239);
insert into konyv values(1116152247, 'A vaskirály', '33333333333', null, null, null, null, null);
insert into konyv values(1116152248, 'A megfojtott királyné', '44444444444', null, null, null, null, null);
insert into konyv values(1116152249, 'Az ősi törvény', '55555555555', null, null, null, null, null);
insert into konyv values(1116152250, 'Liliom és oroszlán', '66666666666', null, null, null, null, null);
insert into konyv values(1116152251, 'Az országvesztő', '77777777777', null, null, null, null, null);

commit;



insert into szerzo values(2005182601, 'Christie', 'Agatha', STR_TO_DATE('1890-09-15', '%Y-%m-%d'));
insert into szerzo values(2005182602, 'Frei', 'Tamás', STR_TO_DATE('1966-05-21', '%Y-%m-%d'));
insert into szerzo values(2005182603, 'Fable', 'Vavyan', STR_TO_DATE('1956-03-20', '%Y-%m-%d'));
insert into szerzo values(2005182604, 'Cooper', 'Glenn', null);
insert into szerzo values(2005182605, 'King', 'Stephen', STR_TO_DATE('1947-09-21', '%Y-%m-%d'));
insert into szerzo values(2005182606, 'Harrison', 'Harry', STR_TO_DATE('1925-03-12', '%Y-%m-%d'));
insert into szerzo values(2005182607, 'Nemes', 'István', null);
insert into szerzo values(2005182608, 'Asimov', 'Isaac', STR_TO_DATE('1920-01-02', '%Y-%m-%d'));
insert into szerzo values(2005182609, 'Géczi', 'Zoltán', null);
insert into szerzo values(2005182610, 'Kelemen', 'József', null);
insert into szerzo values(2005182611, 'Nemere', 'István', STR_TO_DATE('1944-11-08', '%Y-%m-%d'));
insert into szerzo values(2005182612, 'Szabó', 'Zsolt', null);
insert into szerzo values(2005182613, 'Csonkaréti', 'Károly', null);
insert into szerzo values(2005182614, 'Sárhidai', 'Gyula', null);
insert into szerzo values(2005182615, 'Dr. Barczy', 'Zoltán', null);
insert into szerzo values(2005182616, 'Castelot', 'André', STR_TO_DATE('1911-01-23', '%Y-%m-%d'));
insert into szerzo values(2005182617, 'Lefebvre', 'Georges', STR_TO_DATE('1874-08-06', '%Y-%m-%d'));
insert into szerzo values(2005182618, 'Allaby', 'Michael', STR_TO_DATE('1933-01-01', '%Y-%m-%d'));
insert into szerzo values(2005182619, 'Dr. Coenraads', 'Robert R.', null);
insert into szerzo values(2005182620, 'Hutchinson', 'Robert', STR_TO_DATE('1957-11-12', '%Y-%m-%d'));
insert into szerzo values(2005182621, 'Mcghee', 'Karen', null);
insert into szerzo values(2005182622, 'Dr. O''Byrne', 'John', null);
insert into szerzo values(2005182623, 'Dr. Rubin', 'Ken', null);
insert into szerzo values(2005182624, 'Attenborough', 'David', STR_TO_DATE('1926-05-08', '%Y-%m-%d'));
insert into szerzo values(2005182625, 'Sparks', 'John', STR_TO_DATE('1943-01-01', '%Y-%m-%d'));
insert into szerzo values(2005182626, 'Beatty', 'Richard', null);
insert into szerzo values(2005182627, 'Bryan', 'Kim', null);
insert into szerzo values(2005182628, 'Burnie', 'David', null);
insert into szerzo values(2005182629, 'Dinwiddie', 'Robert', STR_TO_DATE('1963-07-27', '%Y-%m-%d'));
insert into szerzo values(2005182630, 'Dipper', 'Frances', null);
insert into szerzo values(2005182631, 'Eales', 'Philip', STR_TO_DATE('1970-01-01', '%Y-%m-%d'));
insert into szerzo values(2005182632, 'Halls', 'Monty', null);
insert into szerzo values(2005182633, 'Scott', 'Sue', null);
insert into szerzo values(2005182634, 'Scott', 'Mike', null);
insert into szerzo values(2005182635, 'Cousteau', 'Fabien', STR_TO_DATE('1890-09-15', '%Y-%m-%d'));
insert into szerzo values(2005182636, 'Rees', 'Martin', null);
insert into szerzo values(2005182637, 'Hughes', 'David', null);
insert into szerzo values(2005182638, 'Nicolson', 'Iain', null);
insert into szerzo values(2005182639, 'Ridpath', 'Ian', null);
insert into szerzo values(2005182640, 'Sparrow', 'Giles', null);
insert into szerzo values(2005182641, 'Spence', 'Pam', null);
insert into szerzo values(2005182642, 'Stott', 'Carole', null);
insert into szerzo values(2005182643, 'Tildsley', 'Kevin', null);
insert into szerzo values(2005182644, 'Jókai', 'Mór', STR_TO_DATE('1825-02-18', '%Y-%m-%d'));
insert into szerzo values(2005182645, 'Móra', 'Ferenc', STR_TO_DATE('1879-07-19', '%Y-%m-%d'));
insert into szerzo values(2005182646, 'Bródy', 'Sándor', null);
insert into szerzo values(2005182647, 'Rákosi', 'Viktor', null);
insert into szerzo values(2005182648, 'Mackey', 'Alex', null);
insert into szerzo values(2005182649, 'Bloch', 'Joshua', null);
insert into szerzo values(2005182650, 'Gafter', 'Neal', null);
insert into szerzo values(2005182651, 'Bradley', 'Neil', null);
insert into szerzo values(2005182652, 'Graham', 'Steve', null);
insert into szerzo values(2005182653, 'Simeonov', 'Simeon', null);
insert into szerzo values(2005182654, 'Fowler', 'Martin', STR_TO_DATE('1963-01-01', '%Y-%m-%d'));
insert into szerzo values(2005182655, 'Gamma', 'Erich', STR_TO_DATE('1961-01-01', '%Y-%m-%d'));
insert into szerzo values(2005182656, 'Helm', 'Richard', null);
insert into szerzo values(2005182657, 'Johnson', 'Ralph', null);
insert into szerzo values(2005182658, 'Vlissides', 'John M.', null);

insert into szerzo values(2005182659, 'Fekete', 'Sándor Pál', null);
insert into szerzo values(2005182660, 'Druon', 'Maurice', STR_TO_DATE('1918-04-23', '%Y-%m-%d'));
commit;



insert into konyvszerzo values(2005182601, 1116152201, null);
insert into konyvszerzo values(2005182601, 1116152202, null);
insert into konyvszerzo values(2005182601, 1116152203, null);
insert into konyvszerzo values(2005182603, 1116152204, null);
insert into konyvszerzo values(2005182602, 1116152205, null);
insert into konyvszerzo values(2005182603, 1116152206, null);
insert into konyvszerzo values(2005182603, 1116152207, null);
insert into konyvszerzo values(2005182601, 1116152209, null);
insert into konyvszerzo values(2005182605, 1116152210, null);
insert into konyvszerzo values(2005182605, 1116152211, null);
insert into konyvszerzo values(2005182605, 1116152212, null);
insert into konyvszerzo values(2005182605, 1116152213, null);
insert into konyvszerzo values(2005182606, 1116152214, null);
insert into konyvszerzo values(2005182607, 1116152215, null);
insert into konyvszerzo values(2005182607, 1116152216, null);
insert into konyvszerzo values(2005182608, 1116152218, null);
insert into konyvszerzo values(2005182608, 1116152219, null);
insert into konyvszerzo values(2005182609, 1116152220, null);
insert into konyvszerzo values(2005182610, 1116152220, null);
insert into konyvszerzo values(2005182613, 1116152221, null);
insert into konyvszerzo values(2005182614, 1116152221, null);
insert into konyvszerzo values(2005182615, 1116152222, null);
insert into konyvszerzo values(2005182614, 1116152222, null);
insert into konyvszerzo values(2005182616, 1116152223, null);
insert into konyvszerzo values(2005182617, 1116152224, null);
insert into konyvszerzo values(2005182618, 1116152225, null);
insert into konyvszerzo values(2005182619, 1116152225, null);
insert into konyvszerzo values(2005182620, 1116152225, null);
insert into konyvszerzo values(2005182621, 1116152225, null);
insert into konyvszerzo values(2005182622, 1116152225, null);
insert into konyvszerzo values(2005182623, 1116152225, null);
insert into konyvszerzo values(2005182601, 1116152226, null);
insert into konyvszerzo values(2005182624, 1116152227, null);
insert into konyvszerzo values(2005182624, 1116152228, null);
insert into konyvszerzo values(2005182624, 1116152229, null);
insert into konyvszerzo values(2005182625, 1116152230, null);
insert into konyvszerzo values(2005182626, 1116152230, null);
insert into konyvszerzo values(2005182627, 1116152230, null);
insert into konyvszerzo values(2005182628, 1116152230, null);
insert into konyvszerzo values(2005182629, 1116152230, null);
insert into konyvszerzo values(2005182631, 1116152230, null);
insert into konyvszerzo values(2005182632, 1116152230, null);
insert into konyvszerzo values(2005182633, 1116152230, null);
insert into konyvszerzo values(2005182634, 1116152230, null);
insert into konyvszerzo values(2005182635, 1116152230, null);
insert into konyvszerzo values(2005182636, 1116152231, null);
insert into konyvszerzo values(2005182629, 1116152231, null);
insert into konyvszerzo values(2005182631, 1116152231, null);
insert into konyvszerzo values(2005182637, 1116152231, null);
insert into konyvszerzo values(2005182638, 1116152231, null);
insert into konyvszerzo values(2005182639, 1116152231, null);
insert into konyvszerzo values(2005182640, 1116152231, null);
insert into konyvszerzo values(2005182641, 1116152231, null);
insert into konyvszerzo values(2005182643, 1116152231, null);
insert into konyvszerzo values(2005182644, 1116152232, null);
insert into konyvszerzo values(2005182645, 1116152232, null);
insert into konyvszerzo values(2005182645, 1116152233, null);
insert into konyvszerzo values(2005182645, 1116152234, null);
insert into konyvszerzo values(2005182644, 1116152235, null);
insert into konyvszerzo values(2005182646, 1116152235, null);
insert into konyvszerzo values(2005182647, 1116152235, null);
insert into konyvszerzo values(2005182644, 1116152236, null);
insert into konyvszerzo values(2005182648, 1116152237, null);
insert into konyvszerzo values(2005182649, 1116152238, null);
insert into konyvszerzo values(2005182650, 1116152238, null);
insert into konyvszerzo values(2005182651, 1116152239, null);
insert into konyvszerzo values(2005182652, 1116152240, null);
insert into konyvszerzo values(2005182653, 1116152240, null);
insert into konyvszerzo values(2005182654, 1116152241, null);
insert into konyvszerzo values(2005182654, 1116152242, null);
insert into konyvszerzo values(2005182655, 1116152243, null);
insert into konyvszerzo values(2005182656, 1116152243, null);
insert into konyvszerzo values(2005182657, 1116152243, null);
insert into konyvszerzo values(2005182658, 1116152243, null);
insert into konyvszerzo values(2005182655, 1116152244, null);
insert into konyvszerzo values(2005182656, 1116152244, null);
insert into konyvszerzo values(2005182657, 1116152244, null);
insert into konyvszerzo values(2005182658, 1116152244, null);

update konyvszerzo k
set honorarium = (
    select max((nvl(konyv.ar, 1000) + nvl(konyv.oldalszam, 100)) * 380) / count(szerzo.szerzo_azon)
    from konyv, szerzo, konyvszerzo b
    where konyv.konyv_azon = b.konyv_azon and szerzo.szerzo_azon = b.szerzo_azon
    group by b.konyv_azon
    having k.konyv_azon = b.konyv_azon);

insert into konyvszerzo values(2005182604, 1116152208, null);
insert into konyvszerzo values(2005182608, 1116152217, null);
insert into konyvszerzo values(2005182611, 1116152220, null);
insert into konyvszerzo values(2005182612, 1116152220, null);
insert into konyvszerzo values(2005182630, 1116152230, null);
insert into konyvszerzo values(2005182642, 1116152231, null);
commit;



insert into konyvtari_konyv values('FSZEK/1116152201-1', 1116152201, null);
insert into konyvtari_konyv values('FSZEK/1116152201-2', 1116152201, null);
insert into konyvtari_konyv values('FSZEK/1116152201-3', 1116152201, null);
insert into konyvtari_konyv values('FSZEK/1116152201-4', 1116152201, null);
insert into konyvtari_konyv values('FSZEK/1116152201-5', 1116152201, null);
insert into konyvtari_konyv values('FSZEK/1116152202-1', 1116152202, null);
insert into konyvtari_konyv values('FSZEK/1116152202-2', 1116152202, null);
insert into konyvtari_konyv values('FSZEK/1116152202-3', 1116152202, null);
insert into konyvtari_konyv values('FSZEK/1116152202-4', 1116152202, null);
insert into konyvtari_konyv values('FSZEK/1116152202-5', 1116152202, null);
insert into konyvtari_konyv values('FSZEK/1116152202-6', 1116152202, null);
insert into konyvtari_konyv values('FSZEK/1116152206-1', 1116152206, null);
insert into konyvtari_konyv values('FSZEK/1116152206-2', 1116152206, null);
insert into konyvtari_konyv values('FSZEK/1116152206-3', 1116152206, null);
insert into konyvtari_konyv values('FSZEK/1116152207-1', 1116152207, null);
insert into konyvtari_konyv values('FSZEK/1116152207-2', 1116152207, null);
insert into konyvtari_konyv values('FSZEK/1116152207-3', 1116152207, null);
insert into konyvtari_konyv values('FSZEK/1116152207-4', 1116152207, null);
insert into konyvtari_konyv values('FSZEK/1116152208-1', 1116152208, null);
insert into konyvtari_konyv values('FSZEK/1116152208-2', 1116152208, null);
insert into konyvtari_konyv values('FSZEK/1116152208-3', 1116152208, null);
insert into konyvtari_konyv values('FSZEK/1116152208-4', 1116152208, null);
insert into konyvtari_konyv values('FSZEK/1116152208-5', 1116152208, null);
insert into konyvtari_konyv values('FSZEK/1116152208-6', 1116152208, null);
insert into konyvtari_konyv values('FSZEK/1116152209-1', 1116152209, null);
insert into konyvtari_konyv values('FSZEK/1116152209-2', 1116152209, null);
insert into konyvtari_konyv values('FSZEK/1116152210-1', 1116152210, null);
insert into konyvtari_konyv values('FSZEK/1116152211-1', 1116152211, null);
insert into konyvtari_konyv values('FSZEK/1116152211-2', 1116152211, null);
insert into konyvtari_konyv values('FSZEK/1116152211-3', 1116152211, null);
insert into konyvtari_konyv values('FSZEK/1116152212-1', 1116152212, null);
insert into konyvtari_konyv values('FSZEK/1116152212-2', 1116152212, null);
insert into konyvtari_konyv values('FSZEK/1116152212-3', 1116152212, null);
insert into konyvtari_konyv values('FSZEK/1116152212-4', 1116152212, null);
insert into konyvtari_konyv values('FSZEK/1116152212-5', 1116152212, null);
insert into konyvtari_konyv values('FSZEK/1116152212-6', 1116152212, null);
insert into konyvtari_konyv values('FSZEK/1116152212-7', 1116152212, null);
insert into konyvtari_konyv values('FSZEK/1116152217-2', 1116152217, null);
insert into konyvtari_konyv values('FSZEK/1116152217-3', 1116152217, null);
insert into konyvtari_konyv values('FSZEK/1116152218-1', 1116152218, null);
insert into konyvtari_konyv values('FSZEK/1116152218-2', 1116152218, null);
insert into konyvtari_konyv values('FSZEK/1116152219-1', 1116152219, null);
insert into konyvtari_konyv values('FSZEK/1116152219-2', 1116152219, null);
insert into konyvtari_konyv values('FSZEK/1116152219-3', 1116152219, null);
insert into konyvtari_konyv values('FSZEK/1116152219-4', 1116152219, null);
insert into konyvtari_konyv values('FSZEK/1116152220-1', 1116152220, null);
insert into konyvtari_konyv values('FSZEK/1116152221-1', 1116152221, null);
insert into konyvtari_konyv values('FSZEK/1116152222-1', 1116152222, null);
insert into konyvtari_konyv values('FSZEK/1116152223-1', 1116152223, null);
insert into konyvtari_konyv values('FSZEK/1116152223-2', 1116152223, null);
insert into konyvtari_konyv values('FSZEK/1116152223-3', 1116152223, null);
insert into konyvtari_konyv values('FSZEK/1116152223-4', 1116152223, null);
insert into konyvtari_konyv values('FSZEK/1116152224-1', 1116152224, null);
insert into konyvtari_konyv values('FSZEK/1116152224-2', 1116152224, null);
insert into konyvtari_konyv values('FSZEK/1116152224-3', 1116152224, null);
insert into konyvtari_konyv values('FSZEK/1116152224-4', 1116152224, null);
insert into konyvtari_konyv values('FSZEK/1116152225-1', 1116152225, null);
insert into konyvtari_konyv values('FSZEK/1116152225-2', 1116152225, null);
insert into konyvtari_konyv values('FSZEK/1116152225-3', 1116152225, null);
insert into konyvtari_konyv values('FSZEK/1116152225-4', 1116152225, null);
insert into konyvtari_konyv values('FSZEK/1116152225-5', 1116152225, null);
insert into konyvtari_konyv values('FSZEK/1116152225-6', 1116152225, null);
insert into konyvtari_konyv values('FSZEK/1116152225-7', 1116152225, null);
insert into konyvtari_konyv values('FSZEK/1116152225-8', 1116152225, null);
insert into konyvtari_konyv values('FSZEK/1116152225-9', 1116152225, null);
insert into konyvtari_konyv values('FSZEK/1116152225-10', 1116152225, null);
insert into konyvtari_konyv values('FSZEK/1116152225-11', 1116152225, null);
insert into konyvtari_konyv values('FSZEK/1116152226-1', 1116152226, null);
insert into konyvtari_konyv values('FSZEK/1116152226-2', 1116152226, null);
insert into konyvtari_konyv values('FSZEK/1116152226-3', 1116152226, null);
insert into konyvtari_konyv values('FSZEK/1116152226-4', 1116152226, null);
insert into konyvtari_konyv values('FSZEK/1116152226-5', 1116152226, null);
insert into konyvtari_konyv values('FSZEK/1116152227-1', 1116152227, null);
insert into konyvtari_konyv values('FSZEK/1116152227-2', 1116152227, null);
insert into konyvtari_konyv values('FSZEK/1116152227-3', 1116152227, null);
insert into konyvtari_konyv values('FSZEK/1116152228-1', 1116152228, null);
insert into konyvtari_konyv values('FSZEK/1116152228-2', 1116152228, null);
insert into konyvtari_konyv values('FSZEK/1116152228-3', 1116152228, null);
insert into konyvtari_konyv values('FSZEK/1116152228-4', 1116152228, null);
insert into konyvtari_konyv values('FSZEK/1116152229-1', 1116152229, null);
insert into konyvtari_konyv values('FSZEK/1116152229-2', 1116152229, null);
insert into konyvtari_konyv values('FSZEK/1116152229-3', 1116152229, null);
insert into konyvtari_konyv values('FSZEK/1116152230-1', 1116152230, null);
insert into konyvtari_konyv values('FSZEK/1116152231-1', 1116152231, null);
insert into konyvtari_konyv values('FSZEK/1116152232-1', 1116152232, null);
insert into konyvtari_konyv values('FSZEK/1116152232-2', 1116152232, null);
insert into konyvtari_konyv values('FSZEK/1116152233-1', 1116152233, null);
insert into konyvtari_konyv values('FSZEK/1116152233-2', 1116152233, null);
insert into konyvtari_konyv values('FSZEK/1116152233-3', 1116152233, null);
insert into konyvtari_konyv values('FSZEK/1116152233-4', 1116152233, null);
insert into konyvtari_konyv values('FSZEK/1116152233-5', 1116152233, null);
insert into konyvtari_konyv values('FSZEK/1116152233-6', 1116152233, null);
insert into konyvtari_konyv values('FSZEK/1116152234-3', 1116152234, null);
insert into konyvtari_konyv values('FSZEK/1116152234-4', 1116152234, null);
insert into konyvtari_konyv values('FSZEK/1116152235-1', 1116152235, null);
insert into konyvtari_konyv values('FSZEK/1116152235-2', 1116152235, null);
insert into konyvtari_konyv values('FSZEK/1116152236-1', 1116152236, null);
insert into konyvtari_konyv values('FSZEK/1116152236-2', 1116152236, null);
insert into konyvtari_konyv values('FSZEK/1116152236-3', 1116152236, null);
insert into konyvtari_konyv values('FSZEK/1116152236-4', 1116152236, null);
insert into konyvtari_konyv values('FSZEK/1116152236-5', 1116152236, null);
insert into konyvtari_konyv values('FSZEK/1116152236-6', 1116152236, null);
insert into konyvtari_konyv values('FSZEK/1116152236-7', 1116152236, null);
insert into konyvtari_konyv values('FSZEK/1116152236-8', 1116152236, null);
insert into konyvtari_konyv values('FSZEK/1116152237-1', 1116152237, null);
insert into konyvtari_konyv values('FSZEK/1116152238-1', 1116152238, null);
insert into konyvtari_konyv values('FSZEK/1116152238-2', 1116152238, null);
insert into konyvtari_konyv values('FSZEK/1116152238-3', 1116152238, null);
insert into konyvtari_konyv values('FSZEK/1116152239-1', 1116152239, null);
insert into konyvtari_konyv values('FSZEK/1116152239-2', 1116152239, null);
insert into konyvtari_konyv values('FSZEK/1116152239-3', 1116152239, null);
insert into konyvtari_konyv values('FSZEK/1116152240-2', 1116152240, null);
insert into konyvtari_konyv values('FSZEK/1116152241-1', 1116152241, null);
insert into konyvtari_konyv values('FSZEK/1116152241-2', 1116152241, null);
insert into konyvtari_konyv values('FSZEK/1116152243-1', 1116152243, null);
insert into konyvtari_konyv values('FSZEK/1116152243-2', 1116152243, null);
insert into konyvtari_konyv values('FSZEK/1116152244-1', 1116152244, null);
insert into konyvtari_konyv values('FSZEK/1116152244-2', 1116152244, null);
insert into konyvtari_konyv values('FSZEK/1116152244-3', 1116152244, null);

insert into konyvtari_konyv values('FSZEK/1116152245-1', 1116152245, null);
insert into konyvtari_konyv values('FSZEK/1116152245-2', 1116152245, null);
insert into konyvtari_konyv values('FSZEK/1116152245-3', 1116152245, null);
insert into konyvtari_konyv values('FSZEK/1116152247-1', 1116152247, null);
insert into konyvtari_konyv values('FSZEK/1116152248-1', 1116152248, null);
insert into konyvtari_konyv values('FSZEK/1116152248-2', 1116152248, null);
insert into konyvtari_konyv values('FSZEK/1116152251-1', 1116152251, null);

UPDATE konyvtari_konyv kk
JOIN konyv k ON k.konyv_azon = kk.konyv_azon
SET kk.ertek = COALESCE(k.ar, 1000) - CAST(RIGHT(kk.leltari_szam, 1) AS UNSIGNED) * 5.3;

insert into konyvtari_konyv values('FSZEK/1116152216-1', 1116152216, null);
insert into konyvtari_konyv values('FSZEK/1116152216-2', 1116152216, null);
insert into konyvtari_konyv values('FSZEK/1116152217-1', 1116152217, null);
insert into konyvtari_konyv values('FSZEK/1116152214-1', 1116152214, null);
insert into konyvtari_konyv values('FSZEK/1116152215-1', 1116152215, null);
insert into konyvtari_konyv values('FSZEK/1116152234-1', 1116152234, null);
insert into konyvtari_konyv values('FSZEK/1116152234-2', 1116152234, null);
insert into konyvtari_konyv values('FSZEK/1116152240-1', 1116152240, null);
insert into konyvtari_konyv values('FSZEK/1116152242-1', 1116152242, null);

commit;


insert into tag values('SZE-2010/151020-01', 'Ácsi', 'Milán', null, 'f', '4032 Debrecen, Budapesti út 3.', null, null, 'diák');
insert into tag values('SZE-2010/151020-02', 'Agyalá', 'Gyula', null, 'f', '1012 Budapest, Debreceni utca 43.', null, null, 'felnőtt');
insert into tag values('SZE-2010/151020-03', 'Alle', 'Glória', null, 'n', '4062 Debrecen, Szegedi körút 12.', null, null, 'felnőtt');
insert into tag values('SZE-2010/151020-04', 'Aloe', 'Vera', null, 'n', '4032 Debrecen, Győri út 26.', null, null, 'nyugdíjas');
insert into tag values('SZE-2010/151020-05', 'Am', 'Erika', null, 'n', '4022 Debrecen, Balatoni út 1.', null, null, 'nyugdíjas');
insert into tag values('SZE-2010/151020-06', 'Arany', 'Áron', null, 'f', '4020 Debrecen, Kossuth utca 8.', null, null, 'nyugdíjas');
insert into tag values('SZE-2010/151020-07', 'Bármi', 'Áron', null, 'f', '1111 Budapest, Szeghalmi sétány 52.', null, null, 'nyugdíjas');
insert into tag values('SZE-2010/151020-08', 'Békés', 'Csaba', null, 'f', '1012 Budapest, Debreceni utca 44.', null, null, 'gyerek');
insert into tag values('SZE-2010/151020-09', 'Bekre', 'Pál', null, 'f', '1234 Budapest, Ököritófülpösi sugárút 34/A.', null, null, 'gyerek');
insert into tag values('SZE-2010/151020-10', 'Bélapátfa', 'Szabolcs', null, 'f', '1234 Budapest, Ököritófülpösi sugárút 34/B.', null, null, 'diák');
insert into tag values('SZE-2010/151020-11', 'Bennes', 'Emmi', null, 'n', '1234 Budapest, Ököritófülpösi sugárút 34/C.', null, null, 'diák');
insert into tag values('SZE-2010/151020-12', 'Berez', 'Elek', null, 'f', '1234 Budapest, Ököritófülpösi sugárút 34/D.', null, null, 'diák');
insert into tag values('SZE-2010/151020-13', 'Borsos', 'Áron', null, 'f', '4032 Debrecen, Budapesti út 6/1.', null, null, 'törzstag');
insert into tag values('SZE-2010/151020-14', 'Cicam', 'Ica', null, 'n', '4032 Debrecen, Budapesti út 6/2.', null, null, 'kedvezményezett');
insert into tag values('SZE-2010/151020-15', 'Címer', 'Feri', null, 'f', '4032 Debrecen, Budapesti út 6/3.', null, null, 'kedvezményezett');
insert into tag values('SZE-2010/151020-16', 'Citad', 'Ella', null, 'n', '4032 Debrecen, Budapesti út 6/4.', null, null, 'törzstag');
insert into tag values('SZE-2010/151020-17', 'Cserepes', 'Virág', null, 'n', '4032 Debrecen, Budapesti út 6/5.', null, null, 'felnőtt');
insert into tag values('SZE-2010/151020-18', 'Ebéd', 'Elek', null, 'f', '3032 Miskolc, Debreceni út 3.', null, null, 'felnőtt');
insert into tag values('SZE-2010/151020-19', 'Elvará', 'Zsolt', null, 'f', '3032 Miskolc, Széchenyi utca 11.', null, null, 'diák');
insert into tag values('SZE-2010/151020-20', 'Futó', 'Rózsa', null, 'n', '3032 Miskolc, Budapesti út 36.', null, null, 'törzstag');
insert into tag values('SZE-2010/151020-21', 'Gaz', 'Ella', null, 'n', '6502 Szeged, Budapesti út 4.', null, null, 'nyugdíjas');
insert into tag values('SZE-2010/151020-22', 'Har', 'Mónika', null, 'n', '6524 Szeged, Békéscsabai út 15.', null, null, 'nyugdíjas');
insert into tag values('SZE-2010/151020-23', 'Heu', 'Réka', null, 'n', '5632 Békéscsaba, Debreceni körút 32.', null, null, 'diák');
insert into tag values('SZE-2010/151020-24', 'Idét', 'Lenke', null, 'n', '6032 Kecskemét, Szolnoki út 56.', null, null, 'kedvezményezett');
insert into tag values('SZE-2010/151020-25', 'Kala', 'Pál', null, 'f', '5008 Szolnok, Budapesti út 103.', null, null, 'törzstag');
insert into tag values('SZE-2010/151020-26', 'Kalim', 'Pál', null, 'f', '5002 Szolnok, Kétpói sugárút 18.', null, null, 'felnőtt');
insert into tag values('SZE-2010/151020-27', 'Kamu', 'Zoltán', null, 'f', '7667 Pécs, Budapesti út 23.', null, null, 'felnőtt');
insert into tag values('SZE-2010/151020-28', 'Karam', 'Ella', null, 'n', '7676 Pécs, Szombathelyi sétány 17.', null, null, 'törzstag');
insert into tag values('SZE-2010/151020-29', 'Kasza', 'Blanka', null, 'n', '7608 Pécs, Kaposvári dűlő 8.', null, null, 'felnőtt');
insert into tag values('SZE-2010/151020-30', 'Kispál', 'Inka', null, 'n', '7400 Kaposvár, Székesfehérvári út 6.', null, null, 'nyugdíjas');
insert into tag values('SZE-2010/151020-31', 'Lepi', 'Pál', null, 'f', '8012 Székesfehérvár, Budapesti út 55.', null, null, 'felnőtt');
insert into tag values('SZE-2010/151020-32', 'Luc', 'Erna', null, 'n', '8000 Székesfehérvár, Balatoni sétány 53.', null, null, 'diák');
insert into tag values('SZE-2010/151020-33', 'Madag', 'Oszkár', null, 'f', '9700 Szombathely, Soproni köz 38.', null, null, 'felnőtt');
insert into tag values('SZE-2010/151020-34', 'Meg', 'Győző', null, 'f', '9700 Szombathely, Soproni köz 39/A.', null, null, 'felnőtt');
insert into tag values('SZE-2010/151020-35', 'Nemoda', 'Buda', null, 'f', '9700 Szombathely, Soproni köz 39/B.', null, null, 'diák');
insert into tag values('SZE-2010/151020-36', 'Nut', 'Ella', null, 'n', '9700 Szombathely, Soproni köz 39/C.', null, null, 'diák');
insert into tag values('SZE-2010/151020-37', 'Para', 'Zita', null, 'n', '9400 Soproni, Soproni út 4.', null, null, 'diák');
insert into tag values('SZE-2010/151020-38', 'Rabsz', 'Olga', null, 'n', '4625 Győröcske, Kossuth út 51.', null, null, 'nyugdíjas');
insert into tag values('SZE-2010/151020-39', 'Rúgka', 'Pál', null, 'f', '9012 Győr, Ausztriai út 2.', null, null, 'nyugdíjas');
insert into tag values('SZE-2010/151020-40', 'Szuper', 'Áron', null, 'f', '9022 Győr, Győröcskei dűlő 14.', null, null, 'nyugdíjas');
insert into tag values('SZE-2010/151020-41', 'Szájbaverj', 'Elek', null, 'f', '9032 Győr, Debrecen-budapesti sétány 74.', null, null, 'diák');
insert into tag values('SZE-2010/151020-42', 'Szalmon', 'Ella', null, 'n', '8900 Zalegerszeg, Zalai út 57/1.', null, null, 'nyugdíjas');
insert into tag values('SZE-2010/151020-43', 'Szav', 'Anna', null, 'n', '8900 Zalegerszeg, Zalai út 57/2.', null, null, 'diák');
insert into tag values('SZE-2010/151020-44', 'Szem', 'Eszter', null, 'n', '8901 Zalegerszeg, Balatoni út 72.', null, null, 'törzstag');
insert into tag values('SZE-2010/151020-45', 'Tavi', 'Rózsa', null, 'n', '9200 Mosonmagyaróvár, Budapesti út 6.', null, null, 'törzstag');
insert into tag values('SZE-2010/151020-46', 'Ügyet', 'Lenke', null, 'n', '9200 Mosonmagyaróvár, Mosoni sétány 59.', null, null, 'diák');
insert into tag values('SZE-2010/151020-47', 'Zsíros', 'B. Ödön', null, 'f', '9200 Mosonmagyaróvár, Magyari köz 1.', null, null, 'kedvezményezett');
insert into tag values('SZE-2010/151020-48', 'Zuhany', 'Rózsa', null, 'n', '9200 Mosonmagyaróvár, Ó utca 2.', null, null, 'törzstag');
insert into tag values('SZE-2010/151020-49', 'Vak', 'Ond', null, 'f', '9200 Mosonmagyaróvár, Vári dűlő 88.', null, null, 'kedvezményezett');

UPDATE tag
SET szuletesi_datum = DATE_SUB(
    CURDATE(), 
    INTERVAL (
        CASE 
            WHEN besorolas = 'diák' THEN 7
            WHEN besorolas = 'felnőtt' THEN 25
            WHEN besorolas = 'nyugdíjas' THEN 62
            WHEN besorolas = 'gyerek' THEN 0
            WHEN besorolas = 'törzstag' THEN 35
            WHEN besorolas = 'kedvezményezett' THEN 50
        END 
        + CAST(LEFT(cim, 1) AS UNSIGNED)
        + CAST(SUBSTRING(cim, 2, 1) AS UNSIGNED)
        + CAST(SUBSTRING(cim, 3, 1) AS UNSIGNED)
        + CAST(SUBSTRING(cim, 4, 1) AS UNSIGNED)
    ) * 365 + 
    (CAST(SUBSTRING(olvasojegyszam, -2, 1) AS UNSIGNED) + 
     CAST(RIGHT(olvasojegyszam, 1) AS UNSIGNED))
    DAY
);

    
UPDATE tag
SET beiratkozasi_datum = DATE_SUB(
    CURDATE(),
    INTERVAL FLOOR(RAND() * DATEDIFF(CURDATE(), szuletesi_datum)) DAY
);

    
UPDATE tag
SET tagdij = CASE 
    WHEN besorolas = 'diák' THEN 1800
    WHEN besorolas = 'felnőtt' THEN 3800
    WHEN besorolas = 'nyugdíjas' THEN 1500
    WHEN besorolas = 'gyerek' THEN 1000
    WHEN besorolas = 'törzstag' THEN 800
    WHEN besorolas = 'kedvezményezett' THEN 1200
END;

    
commit;    
    
        

insert into kolcsonzes values('SZE-2010/151020-01', 'FSZEK/1116152227-2', (SYSDATE() - 8), null, null, null);
insert into kolcsonzes values('SZE-2010/151020-01', 'FSZEK/1116152201-1', (SYSDATE() - (RAND() * 800)), null, null, null);
insert into kolcsonzes values('SZE-2010/151020-01', 'FSZEK/1116152206-1', (SYSDATE() - (RAND() * 800)), null, null, null);
insert into kolcsonzes values('SZE-2010/151020-13', 'FSZEK/1116152227-1', (SYSDATE() - (RAND() * 800)), null, null, null);
insert into kolcsonzes values('SZE-2010/151020-34', 'FSZEK/1116152227-3', (SYSDATE() - (RAND() * 800)), null, null, null);
insert into kolcsonzes values('SZE-2010/151020-34', 'FSZEK/1116152229-2', (SYSDATE() - (RAND() * 800)), null, null, null);
insert into kolcsonzes values('SZE-2010/151020-34', 'FSZEK/1116152229-1', (SYSDATE() - (RAND() * 800)), null, null, null);
insert into kolcsonzes values('SZE-2010/151020-35', 'FSZEK/1116152236-1', (SYSDATE() - (RAND() * 800)), null, null, null);
insert into kolcsonzes values('SZE-2010/151020-35', 'FSZEK/1116152227-2', (SYSDATE() - (RAND() * 800)), null, null, null);
insert into kolcsonzes values('SZE-2010/151020-40', 'FSZEK/1116152236-2', (SYSDATE() - 6), null, null, null);
insert into kolcsonzes values('SZE-2010/151020-42', 'FSZEK/1116152236-3', (SYSDATE() - (RAND() * 800)), null, null, null);
insert into kolcsonzes values('SZE-2010/151020-49', 'FSZEK/1116152236-4', (SYSDATE() - (RAND() * 800)), null, null, null);
insert into kolcsonzes values('SZE-2010/151020-49', 'FSZEK/1116152236-5', (SYSDATE() - (RAND() * 800)), null, null, null);
insert into kolcsonzes values('SZE-2010/151020-49', 'FSZEK/1116152201-3', (SYSDATE() - (RAND() * 800)), null, null, null);
insert into kolcsonzes values('SZE-2010/151020-49', 'FSZEK/1116152202-4', (SYSDATE() - (RAND() * 800)), null, null, null);
insert into kolcsonzes values('SZE-2010/151020-49', 'FSZEK/1116152212-4', (SYSDATE() - (RAND() * 800)), null, null, null);
insert into kolcsonzes values('SZE-2010/151020-49', 'FSZEK/1116152202-5', (SYSDATE() - (RAND() * 800)), null, null, null);
insert into kolcsonzes values('SZE-2010/151020-03', 'FSZEK/1116152201-2', (SYSDATE() - (RAND() * 800)), null, null, null);
insert into kolcsonzes values('SZE-2010/151020-03', 'FSZEK/1116152224-1', (SYSDATE() - (RAND() * 800)), null, null, null);
insert into kolcsonzes values('SZE-2010/151020-16', 'FSZEK/1116152226-2', (SYSDATE() - (RAND() * 800)), null, null, null);

UPDATE kolcsonzes
SET hany_napra = FLOOR(RAND() * (DATEDIFF(CURDATE(), kolcsonzesi_datum) - 1) + 1);

UPDATE kolcsonzes
SET visszahozasi_datum = 
    CASE 
        WHEN RIGHT(tag_azon, 1) IN ('0', '2', '4', '6', '8') 
            THEN DATE_ADD(kolcsonzesi_datum, INTERVAL hany_napra DAY)
        WHEN RIGHT(tag_azon, 1) IN ('3', '6', '9') 
            THEN DATE_ADD(kolcsonzesi_datum, INTERVAL (hany_napra + FLOOR(RAND() * 999) + 1) DAY)
        ELSE NULL
    END;


insert into kolcsonzes values('SZE-2010/151020-38', 'FSZEK/1116152236-2', (SYSDATE() - 21), 7, SYSDATE() - 20, null);
          
update kolcsonzes k
set kesedelmi_dij = (hany_napra - floor(nvl(visszahozasi_datum, SYSDATE()) - kolcsonzesi_datum)) * -1 * 200
where hany_napra - floor(nvl(visszahozasi_datum, SYSDATE()) - kolcsonzesi_datum) < 0;

commit;