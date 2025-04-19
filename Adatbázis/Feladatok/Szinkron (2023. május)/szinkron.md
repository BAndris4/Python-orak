# Szinkron (2023. május)
### Feladat: [link](Szinkron.pdf)
### Forrás: [link](szinkronhangok.sql)

### Megoldás:
```sql
-- 2heltai.sql
select cim, eredeti
from film
where magyarszoveg = 'Heltai Olga';

-- 3szinkrend.sql
select distinct rendezo, szinkronrendezo
from film
where ev > 2000

-- 4szoveg.sql
select magyarszoveg, cim
from film
where rendezo = 'Christopher Nolan'
and studio = 'Mafilm Audio Kft.'
order by magyarszoveg

-- 5anger.sql
select cim, eredeti, szinesz, szerep
from szinkron join film
on szinkron.filmaz = film.filmaz
where hang = 'Anger Zsolt'

-- 6mennyi.sql
select cim, eredeti, count(szinkron.szinkid)
from film join szinkron
on film.filmaz = szinkron.filmaz
group by film.filmaz, cim, eredeti

-- 7rab.sql
select szerep, szinesz, hang
from szinkron
where szerep like '% rab%' or szerep like 'Rab%'

-- 8rendszin.sql
-- 1. megoldás
select distinct szinesz "Színész-rendező"
from szinkron
where szinesz in
        (select rendezo
        from film)

-- 2. megoldás
SELECT DISTINCT rendezo AS "Színész-rendező"
FROM film, szinkron
WHERE rendezo = szinesz;

-- 9pap.sql
select cim, hang
from szinkron join film
on szinkron.filmaz = film.filmaz
where szinkron.filmaz in
        (select filmaz
        from szinkron
        where hang = 'Pap Kati')
and hang != 'Pap Kati'
order by cim, hang

-- 10harom.sql
select szinesz, hang, count(film.filmaz) as db
from szinkron join film
on szinkron.filmaz = film.filmaz
group by szinesz, hang 
having count(film.filmaz) >= 3
order by db desc

-- 11egyev.sql
-- 1. megoldás
select hang, ev
from film join szinkron
on film.filmaz = szinkron.filmaz
where studio = 'Mafilm Audio Kft.'
intersect
select hang, ev
from film join szinkron
on film.filmaz = szinkron.filmaz
where studio != 'Mafilm Audio Kft.'
order by hang

-- 2. megoldás 
/*
szerintem legjobb megoldás, mert a többiben ha a hang és az éven kívül
mást is meg akarnál jeleníteni, az még egy join lenne, így pedig csak odairod
a selectbe
*/
select hang, ev
from film join szinkron
on film.filmaz = szinkron.filmaz
where (hang, ev) in (
        select hang, ev
        from film join szinkron
        on film.filmaz = szinkron.filmaz
        where studio = 'Mafilm Audio Kft.')
and studio != 'Mafilm Audio Kft.'
order by hang

-- 3. megoldás
select distinct MAFILM.hang, MAFILM.ev
from (
    select hang, ev
    from film join szinkron
    on film.filmaz = szinkron.filmaz
    where studio = 'Mafilm Audio Kft.') as MAFILM
join (
    select hang, ev
    from film join szinkron
    on film.filmaz = szinkron.filmaz
    where studio != 'Mafilm Audio Kft.') as NEMMAFILM
on MAFILM.hang = NEMMAFILM.hang and MAFILM.ev = NEMMAFILM.ev
order by MAFILM.hang
```