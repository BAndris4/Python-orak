# Állóképesség (2022. október)
### Feladat: [link](Állóképesség.pdf)
### Forrás: [link](allokep_forras.sql)

### Megoldás:
```sql
-- 2
select letszam
from megye
where nev = 'Vas';
-- 3
select sum(aerob.letszam)
from megye join aerob
on megye.kod = aerob.mkod
where nev = 'Somogy';
-- 4
select sum(aerob.letszam)
from megye join aerob
on megye.kod = aerob.mkod
join allapot
on allapot.kod = aerob.allkod
where allapot.nev = 'egészséges' and nem = 1 and megye.nev = 'Zala';
-- 5
select count(kod)
from megye
where letszam < (
                select letszam
                from megye
                where nev = 'Heves')

-- 6
select sum(aerob.letszam)/megye.letszam
from megye join aerob
on megye.kod = aerob.mkod
where megye.nev = "Pest"
-- 7
select megye.nev, aerob.letszam
from megye join aerob
on megye.kod = aerob.mkod
join allapot
on allapot.kod = aerob.allkod
where allapot.nev = 'egészséges' and nem = 0
order by aerob.letszam desc
-- 8
select megye.nev, sum(aerob.letszam)/megye.letszam arany
from megye join aerob
on megye.kod = aerob.mkod
group by megye.kod, megye.nev
order by arany desc
limit 1
-- 9
select megye.nev "Megyenév", sum(aerob.letszam)/max(megye.letszam) "Arány"
from megye join aerob
on megye.kod = aerob.mkod
join allapot
on allapot.kod = aerob.allkod
where allapot.nev != 'egészséges'
group by megye.kod, megye.nev
having sum(aerob.letszam)/max(megye.letszam) > 0.25

