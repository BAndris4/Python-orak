# Első óra (2025.04.10.)
## Könyvtár
Bemásoljuk az SQL panelbe az [adatbázis létrehozó kódot](konyvtar_sema.sql).

## Mező listázása
### Listázza a könyv táblát
```sql
SELECT *
FROM konyv;
```
### Listázzuk a könyv címeit
```sql
SELECT cim
FROM konyv;
```
### Listázzuk a könyv címét, árát, oldalszámát és oldalankénti árát
```sql
SELECT cim, ar, oldalszam, ar/oldalszam as "Ár oldalanként"
FROM konyvtar.konyv;
```
> [!NOTE]
> `as` kulcsszóval tudunk átnevezni mezőket. Elhagyható, viszont ha több szóból áll az átnevezés, akkor `""`-t kell használni.

## Rendezés
### Listázzuk a könyvketet ár szerint növekvően rendezve
```sql
SELECT *
FROM konyv
ORDER BY ar ASC;
```
> [!NOTE]
> `ASC` kulcsszó elhagyható, alapértelmezetten növekvően rendez az `ORDER BY`

### Listázzuk a tagokat vezetékneveik alapján csökkenő, keresztneveik alapján pedig növekvő sorrendben

```sql
SELECT *
FROM tag
ORDER BY vezeteknev DESC, keresztnev ASC;
```

### Listázzuk a szerőket úgy, hogy a legfiatalabbik legyen elől

```sql
SELECT *
FROM szerzo
ORDER BY szuletesi_datum DESC;
```

## Összefűzés
```sql
SELECT CONCAT(vezeteknev, ' ', keresztnev) nev
FROM tag
ORDER BY nev;
```
> [!IMPORTANT]
> `ORDER BY`-nál lehet átnevezett mezőt megadni, míg `WHERE`, `HAVING`, `GROUP BY`-nál nem.

## Feltételes lekérdezések
### Listázzuk a női tagokat
```sql
SELECT *
FROM tag
WHERE nem = 'n';
```
### Listázzuk a krimi és sci-fi témájú könyveket ár szerint növekvően
```sql
SELECT *
FROM konyv
WHERE tema = 'sci-fi' OR tema = 'krimi'
ORDER BY ar;
```

### Listázzuk azokat a könyveket, amelyeknek az ára 1500 és 2000 között van
#### 1. megoldás
```sql
SELECT *
FROM konyv
WHERE ar>=1500 AND ar<=2000
ORDER BY ar;
```

#### 2. megoldás
```sql
SELECT *
FROM konyv
WHERE ar BETWEEN 1500 AND 2000
ORDER BY ar;
```
> [!IMPORTANT]
> A `BETWEEN`-nél a két szélső érték is belekerül a tartományba.

### Listázzuk a sci-fi, krimi és horror könyveket.
#### 1. megoldás
```sql
SELECT *
FROM konyv
WHERE tema = 'sci-fi' or tema = 'krimi' or tema = 'horror';
```
#### 2. megoldás
```sql
SELECT *
FROM konyv
WHERE tema in ('sci-fi', 'krimi', 'horror');
```

### Listázzuk a győri tagokat. Rendezzük besorolás, azon belül pedig teljes név szerint.

## `LIKE` használata
### Listázzuk az `A` betűvel kezdődő könyvcímeket.
```sql
SELECT *
FROM konyv
WHERE cim LIKE 'A%';
```

> [!IMPORTANT]
> A `%` azt jelenti, hogy 0 vagy több karakter. Tehát `A` után bármennyi karakter lehet még.

### Listázzuk az `A` betűvel végződő könyvcímeket.
```sql
SELECT *
FROM konyv
WHERE cim LIKE '%a';
```
> [!NOTE]
> MySQL-ben mindegy, hogy kis vagy nagybetűvel írjuk a karaktereket.

### Listázzuk azokat a könyvcímeket, amelyeknek második betűje `A` betű.
```sql
SELECT *
FROM konyv
WHERE cim LIKE '_a%'
```
> [!IMPORTANT]
> A `_` 1 karaktert jelent. Tehát van egy valamilyen betű, utána egy `a` betű, és utána meg bármennyi betű.

### Listázzuk azokat a könyvcímeket, amelyekben legalább 2 `a` betű van.
```sql
SELECT *
FROM konyv
WHERE cim LIKE '%a%a%';
```

### Listázzuk azokat a könyvcímeket, amelyekben PONTOSAN 2 `a` betű van.
```sql
SELECT *
FROM konyv
WHERE cim LIKE '%a%a%' AND cim NOT LIKE '%a%a%a%';
```

> [!NOTE]
> Tehát legalább 2 `a` betű van benne, de nincs benne legalább 3 `a` betű.

### Listázzuk a győri tagokat. Rendezzük besorolás, azon belül teljes név szerint.
```sql
SELECT *
FROM tag
WHERE cim LIKE '____ Győr,%'
ORDER BY besorolas , vezeteknev, keresztnev;
```

> [!NOTE]
> A cím úgy néz ki, hogy van egy 4 jegyű irányítószám, utána egy space karakter, utána a város neve, vesszővel elválasztva pedig a cím további része.

## Dátumfüggvények
### Listázzuk ki a mai dátumot
```sql
SELECT now()
FROM dual;
```
> [!NOTE]
> `now()` helyett lehet használni a `sysdate()`-et is. A `dual` tábla egy egysoros tábla, itt lehet számolgatni. MySQL-ben nem kötelező odaírni.

### Hány nap telt el a könyvek kiadásának dátuma óta?
```sql
SELECT *, DATEDIFF(now(), kiadas_datuma)
FROM konyv;
```

> [!IMPORTANT]
> A `DATEDIFF(későbbi_dátum, korábbi_dátum)` megadja a két dátum közötti napok számát.

### Hány év/hónap/nap/óra/perc/másodperc telt el a könyvek kiadásának dátuma óta?
```sql
SELECT *, TIMESTAMPDIFF(YEAR, kiadas_datuma, now())
FROM konyv;
```

> [!IMPORTANT]
> A `TIMESTAMPDIFF(egység, korábbi_dátum, későbbi_dátum)` megadja hogy hány egységnyi idő telt el a két dátum között. Egységnek lehet használni a `YEAR`, `MONTH`, `DAY`, `HOUR`, `MINUTE`, `SECOND` kifejezéseket.

### Időegységek kinyerése dátumból
```sql
SELECT now(), YEAR(now()), MONTH(now()), DAY(now()), HOUR(now()), MINUTE(now()), SECOND(now())
FROM dual;
```

### Listázzuk ki a 30 évnél idősebb tagokat. Legyen rendezve név szerint
```sql
SELECT *
FROM tag 
WHERE timestampdiff(YEAR, szuletesi_datum, now())>30
ORDER BY vezeteknev, keresztnev;
```

### Listázzuk azokat a tagokat, akik ebben a hónapban születtek
```sql
SELECT * 
FROM tag
WHERE MONTH(szuletesi_datum)=MONTH(now());
```

## Csoportképző függvények
### Mennyi a könyvek átlagára?
```sql
SELECT avg(ar)
FROM konyv;
```
### Hány darab könyv van a táblában?
```sql
SELECT count(*)
FROM konyv;
```
> [!NOTE]
> `count(*)` helyett lehet használni a `count(konyv_azon)`-t abban az esetben, ha a `konyv_azon` **elsődleges kulcs.**

### Mennyibe kerül a legdrágább és legolcsóbb könyv?
```sql
SELECT min(ar), max(ar)
FROM konyv;
```

### Mennyi a könyvek összára?
```sql
SELECT sum(ar)
FROM konyv;
```

## `GROUP BY` és `HAVING` használata
### Az egyes témákból hány könyv van?
```sql
SELECT tema, count(*)
FROM konyv
GROUP BY tema;
```
> [!NOTE]
> Témánként csoportosítunk, és azon belül megszámoljuk hogy hány könyv található abban a bizonyos témában.

> [!IMPORTANT]
> `GROUP BY` után a `SELECT` részbe már csak olyan kifejezést lehet írni, ami szerepel a `GROUP BY`-ban vagy csoportképző függvény.

### Listázzuk a témákat, mindegyiket csak egyszer
#### 1. megoldás
```sql
SELECT tema
FROM konyv
GROUP BY tema;
```

#### 2. megoldás
```sql
SELECT DISTINCT tema
FROM konyv
```

> [!IMPORTANT]
> A `DISTINCT` kiszedi az ismétlődő sorokat, inkább ezt használjuk ilyen feladatoknál.

### Listázzuk azokat a témákat, amelyekhez 3-nál több könyv tartozik
```sql
SELECT tema
FROM konyv
GROUP BY tema
HAVING count(*)>3;
```

> [!IMPORTANT]
> A `HAVING` részbe olyan feltételeket írunk, ami már csoportosítás **után** történt.

### Listázza azokat a besorolásokat, amelyekhez 3-nál több nő tartozik.
```sql
SELECT besorolas, count(*)
FROM tag
WHERE nem ='n'
GROUP BY besorolas
HAVING count(*)>3;
```

> [!IMPORTANT]
> A nőket kiszűrjűk még a csoportosítás **előtt** egy `WHERE` kulcsszóval, és a csoportosítás **után** rászűrűnk a `HAVING` részben arra, hogy csak azok a besorolások érdekelnek, amelyeknél a létszám több mint 3.

## Utasítások sorrendje
```sql
SELECT
FROM
WHERE
GROUP BY
HAVING
ORDER BY
LIMIT
```




