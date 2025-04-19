# Második óra (2025.04.11.)
### Hány különböző téma van?
```sql
select count(DISTINCT tema)
from konyv
```
> [!NOTE]
> Csak a különböző témákat akarjuk megszámolni, ezért a `DISTINCT tema`-kat számoljuk meg.

## Kapcsolatok
### Listázzuk ki, hogy az egyes tagok hány napra kölcsönözték ki a könyveket. Legyen vezetéknév, keresztnév, könyv azonosító, és a napszám megjelenítve, és napok alapján csökkenő sorrendbe rendezve.
#### 1. megoldás
```sql
select vezeteknev, keresztnev, leltari_szam, hany_napra
from tag join kolcsonzes
on tag.olvasojegyszam = kolcsonzes.tag_azon
order by hany_napra DESC
```
> [!IMPORTANT]
> Két táblát a `join` művelettel tudunk összekapcsolni. Itt például megadjuk hogy a `tag` táblát összekapcsoljuk a `kolcsonzes` táblával. Viszont meg kell adni, hogy mi alapján kapcsoljuk össze az `on` kulcsszóval. Tehát úgy kapcsoljuk össze a két táblát, hogy a `tag.olvasojegyszam` mező megegyezik a `kolcsonzes.tag_azon` mezővel.

#### 2. megoldás
```sql
select vezeteknev, keresztnev, leltari_szam, hany_napra
from tag, kolcsonzes
where tag.olvasojegyszam = kolcsonzes.tag_azon
order by hany_napra DESC
```

> [!IMPORTANT]
> Lehet két táblát összekapcsolni `join` kulcsszó nélkül. Ilyenkor a két táblának a `Descartes` szorzatát kapjuk, ami azt jelenti, hogy mindegyik mező mindegyik mezővel meg lesz jelenítve. Például:
>
> **Típus tábla:**
> | tipus_azon | nev      |
> | ---------- | -------- |
> | 1          | gyümölcs |
> | 2          | zöldség  |
>
> **Termék tábla:**
> | termek_azon | nev  | tipus |
> | ----------- | ---- | ----- |
> | 1           | alma | 1     |
> | 2           | répa | 2     |
>
> Ilyenkor a két tábla Descartes-szorzata:
> | tipus_azon | nev | termek_azon | nev | tipus |
> | ---------- | --- | ----------- | --- | ----- |
> | 1 | gyümölcs | 1 | alma | 1 |
> | 1 | gyümölcs | 2 | répa | 2 |
> | 2 | zöldség | 1 | alma | 1 |
> | 2 | zöldség | 2 | répa | 2 |
> 
> Ezt a két táblát úgy tudjuk összekapcsolni rendesen, ha még egy `where` feltétellel megmondjuk, hogy ne az összeset párosítsa az összessel, hanem csak azokat, ahol a két érték megegyezik. Ebben az esetben, ahol a `tipus.tipus_azon = termek.tipus`

### Hány könyvet írtak a szerzők?
#### 1. megoldás
```sql
SELECT vezeteknev, keresztnev, count(konyv_azon)
FROM konyvszerzo JOIN szerzo
ON konyvszerzo.szerzo_azon = szerzo.szerzo_azon
GROUP BY vezeteknev, keresztnev
ORDER BY count(konyv_azon) DESC;
```
#### 2. megoldás
```sql
SELECT vezeteknev, keresztnev, count(konyv_azon) as db
FROM konyvszerzo, szerzo
WHERE konyvszerzo.szerzo_azon = szerzo.szerzo_azon
GROUP BY vezeteknev, keresztnev
ORDER BY db DESC;
```

### Listázzuk ki, hogy az egyes tagok hány könyvet kölcsönöztek ki. A lista tartalmazza az tagok teljes nevét, nemét, valamint azt, hogy hány könyvet kölcsönöztek eddig.

```sql
SELECT vezeteknev, keresztnev, nem, count(konyv.konyv_azon)
FROM kolcsonzes JOIN tag
ON tag.olvasojegyszam = kolcsonzes.tag_azon
JOIN konyvtari_konyv 
ON kolcsonzes.leltari_szam = konyvtari_konyv.leltari_szam
JOIN konyv
ON konyvtari_konyv.konyv_azon = konyv.konyv_azon
GROUP BY olvasojegyszam, vezeteknev, keresztnev, nem
ORDER BY vezeteknev DESC, keresztnev DESC;
```

## Limit
### Listázzuk a legidősebb tag adatait.
```sql
SELECT *
FROM tag
ORDER BY szuletesi_datum
LIMIT 1;
```
> [!IMPORTANT]
> Növekvő sorrendbe rendezzük a tagok születési dátumát növekvő sorrendbe, így legfelül a legidősebb tag lesz. Nekünk csak a legidősebb tag kell, ezért a `LIMIT`-el megmondjuk, hogy csak az első elemre vagyunk kiváncsiak.

### Melyik a legdrágább könyv?
```sql
SELECT *
FROM konyv
ORDER BY ar DESC
LIMIT 1;
```

## Beágyazott SELECT-ek
### Listázzuk a legidősebb tag adatait.
```sql
select *
from tag
where szuletesi_datum = (
                        select min(szuletesi_datum)
                        from tag);
```
> [!IMPORTANT]
> Azokat a tagokat listázzuk, akiknek a születési dátuma megegyezik a **LEGRÉGEBBI SZÜLETÉSI DÁTUMMAL**. Egy belső lekérdezésben pedig kiderítjük, hogy mi lesz a legrégebbi születési dátum.
### Melyik a legdrágább könyv
```sql
select *
from konyv
where ar = (
	select max(ar)
	from konyv);
```

### Listázza azokat a szerzőket, akik egy könyven dolgoztak Csonkaréti Károllyal.
```sql
select vezeteknev, keresztnev
from szerzo join konyvszerzo
on szerzo.szerzo_azon = konyvszerzo.szerzo_azon
where konyv_azon in
    (select konyv_azon
    from konyvszerzo join szerzo
    on konyvszerzo.szerzo_azon = szerzo.szerzo_azon
	where keresztnev= 'Károly' and vezeteknev = 'Csonkaréti')
and keresztnev != 'Károly' and vezeteknev !='Csonkaréti'; 
```

> [!IMPORTANT]
> Előszőr is megnézzük egy belső lekérdezésben, hogy milyen könyveken dolgozott Csonkaréti Károly:
> ```sql
> select konyv_azon
> from konyvszerzo join szerzo
> on konyvszerzo.szerzo_azon = szerzo.szerzo_azon
> where keresztnev = 'Károly' and vezeteknev = 'Csonkaréti'
> ```
> A külső lekérdezésben meg azokra a szerzőkre vagyunk kiváncsiak, akik dolgoztak egy olyan könyven (`where konyv_azon in`), amin Csonkaréti Károly is dolgozott (`a belső lekérdezés`)

## Halmazműveletek (mindenesetre tudd ezt is, valszeg enélkül is boldogulsz)
> [!NOTE]
> `paros` tábla:    
> |szam|
> |----|
> |0|
> |2|
> |4|
> |6|
> |8|
> |10|
> |12|
>
> `oszthato3` tábla:
> |szam|
> |----|
> |0|
> |3|
> |6|
> |9|
> |12|

### Intersect
```sql
select szam
from paros
intersect
select szam
from oszthato3
```
> [!IMPORTANT]
> Az `intersect` mezőnként metszet műveletet végez el, tehát azokat hagyja meg, amely értékek mindkét táblában szerepelnek, vagyis a 6-al osztható számokat. Ennek eredménye:
> |szam|
> |----|
> |0|
> |6|
> |12|

### Union all
```sql
select szam
from paros
intersect
select szam
from oszthato3
```

> [!IMPORTANT]
> A `union all` a két tábla értékeit úniózza, és egymás alá rakja az értékeket. Ennek eredménye:
> |szam|
> |----|
> |0|
> |2|
> |4|
> |6|
> |8|
> |10|
> |12|
> |0|
> |3|
> |6|
> |9|
> |12|

### Union
```sql
select szam
from paros
union
select szam
from oszthato3
```

> [!IMPORTANT]
> A `union` ugyanazt csinálja, mint a `union all` csak minden értéket egyszer vesz. Ennek eredménye:
> |szam|
> |----|
> |0|
> |2|
> |4|
> |6|
> |8|
> |10|
> |12|
> |3|
> |9|
