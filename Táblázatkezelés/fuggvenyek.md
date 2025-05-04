# Függvények
## Egyszerűbb függvények
| Függvény | Leírás | Példa |
| -------- | ------ | ----- |
| SZUM(tartomány) | Megadott tartomány alapján összeadja a számokat | SZUM(A1:A5) <br>SZUM(A1, A2, A3) <br> SZUM(A1:A5, B3:B7) |
| ÁTLAG(tartomány) | Megadott tartomány alapján átlagot számít a számokból | ÁTLAG(A1:A5), <BR>ÁTLAG(A1, A2, A3) <br> SZUM(A1:A5, B3:B7) |
| DARAB(tartomány) | Megszámolja, hogy a megadott tartományban hány ***szám*** van | DARAB(A1:A5), ...|
| DARAB2(tartomány) | Megszámolja, hogy a megadott tartományban hány ***nem üres*** cella van | DARAB2(A1:A5), ...
| MAX(tartomány) | A tartományon belül visszaadja a legnagyobb értéket. | MAX(A1:A5), ... |
| MIN(tartomány) | A tartományon belül visszaadja a legkisebb értéket. | MIN(A1:A5), ... |

## Matematikai függvények
| Függvény | Leírás | Példa |
| -------- | ------ | ----- |
| KEREKÍTÉS(szám; hány_számjegy) | Egy számot adott számjegyre kerekít a matematika szabályai alapján | KEREKÍTÉS(2,5; 0) = 3 <BR> KEREKÍTÉS(3,14; 1) = 3,1 <BR> KEREKÍTÉS(3,27; 1) = 3,3 <BR> KEREKÍTÉS(17; -1) = 20
| KEREK.FEL(szám; hány_számjegy) | Egy számot minden esetben felfelé kerekít | KEREK.FEL(2,5; 0) = 3 <BR> KEREK.FEL(3,14; 1) = 3,2 <BR> KEREK.FEL(1,1; 0) = 2 <BR> KEREK.FEL(13; -1) = 20
| KEREK.LE(szám; hány_számjegy) | Egy számot minden esetben lefelé kerekít | KEREK.LE(2,5; 0) = 2 <BR> KEREK.LE(1,9; 0) = 1 <BR> KEREK.LE(5,18; 1) = 5,1 <BR> KEREK.LE(19; -1) = 10 | 
HATVÁNY(szám; kitevő) | Egy számot egy adott kitevőre emel | HATVÁNY(5; 2) = 25 <BR> HATVÁNY(5; -1) = 0,2 |
MARADÉK(szám; osztó) | Egy számot az osztóval való elosztás utáni maradékot adja vissza | MARADÉK(5; 3) = 2 <BR> MARADÉK(26; 2) = 0
VÉLETLEN.KÖZÖTT(alsó; felső) | Egy véletlen számot generál az alsó és a felső korlátok között a korlátokkal is beleszámítva. | VÉLETLEN.KÖZÖTT(1; 5) - 1 és 5 között egy random számot választ.

## Feltételes függvények
| Függvény | Leírás | Példa |
| -------- | ------ | ----- |
| HA(logikai_vizsgálat; érték_ha_igaz; érték_ha_hamis) | Ha a megadott logikai kifejezés igaz, akkor az igaz értéket adja vissza, egyébként pedig a hamis értéket | HA(A1 > A2;  "nagyobb"; "kisebb") <br> HA(MARADÉK(A1; 2) = 0; "páros"; "páratlan")
ÉS(logikai1; logikai2; ...) | Ha minden logikai kifejezés IGAZ, visszatérési értéke IGAZ, különben HAMIS | ÉS(MARADÉK(A1; 2) = 0; MARADÉK(A1; 3) = 0) - A1 osztható 2-vel és 3-mal is.
VAGY(logikai1; logikai2; ...) | Ha legalább az egyik logikai kifejezés IGAZ, visszatérési értéke IGAZ, különben HAMIS | VAGY(MARADÉK(A1; 2) = 0; MARADÉK(A1; 3) = 0) - A1 osztható vagy 2-vel vagy 3-mal.
VÁLASZT(index; érték1; érték2; ...) | Az indexben megadott indexű értéket adja vissza | VÁLASZT(2; "alma"; "banán"; "citrom") = "banán" <br> VÁLASZT(HÉT.NAPJA(A1, 1); "hétfő"; "kedd"; "szerda"; "csütörtök"; "péntek"; "szombat"; "vasárnap") - visszaadja az A1-ben megadott dátumra azt, hogy melyik napra esik.
| SZUMHA(tartomány; kritérium; [összeg_tartomány]) | Csak azokat a **tartomány**ban mezőket összegzi, amelyek megfelelnek a kritériumnak. Ha nem a **tartomány** mezőket kell összegezni, akkor az **összeg_tartomány** mezőben meg kell adni, hogy mit fogunk összegezni. | SZUMHA(A1:A5; >3) - a háromnál nagyobb számokat összegzi. <br> SZUMHA(A1:A5; 1; B1:B5) - azokat a számokat összegzi a B1:B5 mezőben, ahol a megfelelő A oszlopban szereplő érték 1.
| ÁTLAGHA(tartomány; kritérium; [átlag_tartomány]) | Csak azokat a **tartomány**ban mezőket átlagolja, amelyek megfelelnek a kritériumnak. Ha nem a **tartomány** mezőket kell átlagolni, akkor az **átlag_tartomány** mezőben meg kell adni, hogy mit fogunk összegezni. | ÁTLAGHA(A1:A5; >3) - a háromnál nagyobb számokat átlagolja. <br> ÁTLAGHA(A1:A5; 1; B1:B5) - azokat a számokat átlagolja a B1:B5 mezőben, ahol a megfelelő A oszlopban szereplő érték 1.ű
| DARABHA(tartomány; kritérium) <br> DARABTELI(tartomány; kritérium) | Azokat a nem üres cellákat számolja meg, amelyek megfelelnek a kritériumnak | DARABHA(A1:A5; "nő") - megszámolja a nők számát
> [!IMPORTANT]
> A SZUMHA, ÁTLAGHA, DARABHA/DARABTELI függvényeknél ha a kritériumban függvényt is használunk, akkor az ÖSSZEFŰZ függvényt kell használni! <br>SZUMHA(A1:A5; ÖSSZEFŰZ(">"; ÁTLAG(A1:A5))) - azokat a számokat adja össze, amelyek meghaladják az átlagot.

## Szövegfüggvények
| Függvény | Leírás | Példa |
| -------- | ------ | ----- |
| HOSSZ(szöveg) | Megadja hogy hány karakterből áll egy szöveg | HOSSZ("alma") = 4
| BAL(szöveg; n) | Egy szövegből kiszedi az első n karaktert | BAL("mitokondrium"; 5) = "mitok"
| JOBB(szöveg; n) | Egy szövegből kiszedi az utolsó n karaktert | JOBB("mitokondrium"; 5) = "drium"
| KÖZÉP(szöveg; honnantól; n) | Egy szövegből kiszed a kezdőkaraktertől n karaktert | KÖZÉP("mitokondrium"; 3; 5) = "tokon"
| ÖSSZEFŰZ(szöveg1; szöveg2; ...) | Több szövegdarabot egy szöveggé fűz össze | ÖSSZEFŰZ("alma"; "fa") = "almafa"
| KARAKTER(szám) | Visszaadja egy megadott szám UNICODE karakterét | KARAKTER(59) = ";"
| UNICODE(szöveg) | Visszaadja egy UNICODE karakter számát | UNICODE(";") = 59

## Dátumfüggvények
> [!NOTE]
> Az EXCEL a dátumokat 1900.01.01-től számolja. Tehát 1 = 1900.01.01, 2 = 1900.01.02, stb...

| Függvény | Leírás | Példa |
| -------- | ------ | ----- |
| MA() | Visszaadja a mai dátumot | - |
| MOST() | Vissaadja a mai dátumot időponttal együtt | - |
| DÁTUM(év; hónap; nap) <br> IDŐ(óra; perc; másodperc) | Átalakítja a megadott értékeket dátumformátumúvá | DÁTUM(2025; 5; 4) = 45781 (vagyis 2025. 05. 04.)<br>IDŐ(13; 30; 0) = 0,5625 (vagyis 13:30:00)
| HÉT.NAPJA(időérték; eredmény_típusa) | Visszaadja, hogy egy dátum melyik napra esett. <br> Eredménytípusa: <br> 1: vasárnap - 1, hétfő - 2, ..., szombat - 7 <br> 2: hétfő - 1, kedd - 2, ..., vasárnap - 7 <br> 3: hétfő - 0, kedd - 1, ..., vasárnap - 6 | HÉT.NAPJA(DÁTUM(2025; 5; 4); 2) = 7, azaz vasárnap
| ÉV(időérték) <br> HÓNAP(időérték) <br> NAP(időérték) <br> ÓRA(időérték) <br> PERCEK(időérték) <br> MPERC(időérték) | Az időértékből kiszedi az évet/hónapot/napot/percet/másodpercet | ÉV(MA()) = 2025

## Keresőfüggvények
| Függvény | Leírás | Példa|
| -------- | ------ | - |
| NAGY(tábla; k) | Visszaadja a k. legnagyobb értéket | NAGY(A1:A5; 2) - második legnagyobb érték
| KICSI(tábla; k) | Visszaadja a k. legkisebb értéket | KICSI(A1:A5; 2) - második legkisebb érték
| FKERES(keresési_érték; tábla; oszlopindex; [tartományi_keres]) | Az FKERES a tábla **baloldali oszlopában** megkeresi, hogy hol helyezkedik el a keresendő érték, és visszaadja a megfelelő oszlopindexben szereplő ugyanazon sorban helyezkedő értéket. A tartományi keres ha 0, akkor pontos keresést néz, ha 1, akkor a hozzá legközelebbet adja felfelé kerekítve. Alapértelmezetten ez 0, tehát pontosan keres | - |
| VKERES(keresési_érték; tábla; sorindex; [tartományi_keres]) | A VKERES a tábla **felső sorában** megkeresi, hogy hol helyezkedik el a keresendő érték, és visszaadja a megfelelő sorindexben szereplő ugyanazon oszlopban helyezkedő értéket. A tartományi keres ha 0, akkor pontos keresést néz, ha 1, akkor a hozzá legközelebbet adja felfelé kerekítve. Alapértelmezetten ez 0, tehát pontosan keres | - |
INDEX(tábla; sorszám; [oszlopszám]) | Egy táblában visszaadja a megadott sorszámú (és oszlopszámú) értékét | - |
HOL.VAN(keresési_érték; tábla; [egyezés_típus]) | Egy **egysoros/egyoszlopos** táblában megkeresi a keresendő értékét, és visszaadja annak pozícióját. Az egyezés típus ha 0, akkor pontos keresést néz, ha 1, akkor a hozzá legközelebbet adja felfelé kerekítve. Alapértelmezetten ez 0, tehát pontosan keres. | - |

### Példák
1. Példa
    | Gyümölcs | Ár |
    | -- | -- |
    | alma | 500 |
    | banán | 200 |
    | citrom | 350 |
    | dinnye | 700 |

    1. Mennyibe kerül a citrom? <br>
    FKERES: `=FKERES("citrom"; A2:B5; 2)` = 350 <br>
    INDEX, HOL.VAN: `=INDEX(A2:B5; HOL.VAN("citrom"; A2:A5; 0); 2)` = 350
    2. Mi kerül 500-ba? <br>
    FKERES - ezt az FKERES-el nem lehet megoldani, mivel nem a baloldali oszlop értékek között keresünk. <br>
    INDEX, HOL.VAN: `=INDEX(A2:B5; HOL.VAN(500; B2:B5; 0); 1)` = "alma"
    3. Melyik a legdrágább gyümölcs? <br>
    FKERES - ezt az FKERES-el nem lehet megoldani, mivel nem a baloldali oszlop értékek között keresünk. <br>
    INDEX, HOL.VAN: `=INDEX(A2:B5; HOL.VAN(MAX(B2:B5); B2:B5; 0); 1)` = "dinnye"
2. Példa

    | Gyümölcs | alma | banán | citrom | dinnye |
    | - | - | - | - | - |
    | Ár | 500 | 200 | 350 | 700 |

    1. Mennyibe kerül a citrom? <br>
    VKERES: `=VKERES("citrom";B1:E2;2;0)` = 350 <br>
    INDEX, HOL.VAN: `=INDEX(B1:E2;2;HOL.VAN("citrom";B1:E1;0))` = 350

    2. Mi kerül 500-ba? <br>
    VKERES - ezt a VKERES-el nem lehet megoldani, mivel nem a felső sor értékek között keresünk. <br>
    INDEX, HOL.VAN: `=INDEX(B1:E2;1;HOL.VAN(500;B2:E2;0))` = "alma"
    
    3. Melyik a legdrágább gyümölcs? <br>
    VKERES - ezt a VKERES-el nem lehet megoldani, mivel nem a felső sor értékek között keresünk. <br>
    INDEX, HOL.VAN: `=INDEX(B1:E2;1;HOL.VAN(MAX(B2:E2);B2:E2;0))` = "dinnye"

## Adatbázisfüggvények
> [!NOTE]
> Többfeltételes szumha, átlagha, darabha, ezekre majd órán ránézünk. Régen kértek ilyeneket, nem hiszem, hogy most fognak.

## További függvények
Itt vannak még függvények, amiket érdemes megnézni hogy hogy működnek. Ritkán kellenek, de volt már rá példa:
`HAHIBA, CSERE, HELYETTE, KIMETSZ, KISBETŰ, NAGYBETŰ, SZÖVEG.KERES, OSZLOP, SOR, CSONK, ELŐJEL, FAKT, GYÖK, LKO, LKT, NÉGYZETÖSSZEG, FOK, RADIÁN, DARABÜRES`