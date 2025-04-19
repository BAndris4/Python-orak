# Magyar királyok (2024. május idegen nyelvű)
### Feladat: [link](Magyar-királyok.pdf)
### Forrás: [link](kiralyokforras.sql)

### Megoldás:
```sql
-- 2nevek.sql
select nev, ragnev, szul
from uralkodo
where ragnev is not Null
order by szul 

-- 3arpad.sql
select uralkodo.nev, mettol, meddig
from uralkodohaz join uralkodo
on uralkodo.uhaz_az = uralkodohaz.azon
join hivatal
on hivatal.uralkodo_az = uralkodo.azon
where uralkodohaz.nev = 'Árpád-ház'
order by mettol

-- 4koran.sql
select uralkodo.nev
from hivatal join uralkodo
on hivatal.uralkodo_az = uralkodo.azon
where mettol < koronazas;

-- 5XVII.sql
select count(azon)
from hivatal
where meddig>=1601 and mettol<=1700;
/*
Azok akik 1601 előtt uralkodtak, azok biztos nem lesznek jók, 
és azok sem, akik 1700 után kezdtek el uralkodni.

Tehát ez is egy jó megoldás:
where not (meddig < 1601 or mettol > 1700)
*/

-- 6hosszu.sql
select uralkodo.nev, meddig-mettol+1 uralkodas
from uralkodo join hivatal
on uralkodo.azon = hivatal.uralkodo_az
ORDER BY uralkodas DESC
LIMIT 1;

-- 7fiatal.sql
select nev, mettol-szul
from uralkodo join hivatal
on uralkodo.azon = hivatal.uralkodo_az
where mettol-szul < 15
order by mettol-szul

-- 8tobbszor.sql
select nev, sum(meddig-mettol+1)
from uralkodo join hivatal
on uralkodo.azon = hivatal.uralkodo_az
group by uralkodo.azon, nev
having count(hivatal.azon)>1;

-- 9hazak.sql
select uralkodohaz.nev, count(uralkodo.azon) as db
from uralkodohaz join uralkodo
on uralkodohaz.azon=uralkodo.uhaz_az
group by uralkodohaz.azon, uralkodohaz.nev
order by db desc;
```

