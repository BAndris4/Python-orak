# 3. óra

## Házik
1. Adott egy lista:
    `lista = [10, 20, 50, 90, 0, 30, 40]`

    - Írasd ki, hogy hány szám van a listában.
    - Mennyi lesz a számok összege?
    - Mennyi lesz a számok átlaga?
    - Mi lesz a legnagyobb elem, és hanyadik?
    - Mi lesz a legkisebb elem, és hanyadik?
    - Rendezd le a listát
    
    Ha lefuttatod a programot így nézzen ki a kimenet:

    Megoldás:

    ```python
    lista = [10, 20, 50, 90, 0, 30, 40]

    # Hány szám van a listában?
    print(f"Összesen {len(lista)} szám van a listában.")

    # A számok összege
    osszeg = 0
    for i in range(len(lista)):
        osszeg = osszeg + lista[i]
    print(f"A számok összege: {osszeg}")

    # A számok átlaga
    print(f"A számok átlaga: {osszeg/len(lista)}")

    # Legnagyobb elem hanyadik, legkisebb elem hanyadik
    min = lista[0]
    max = lista[0]
    mini = 0
    maxi = 0

    for i in range(len(lista)):
        if min>lista[i]:
            min = lista[i]
            mini = i
        if max<lista[i]:
            max = lista[i]
            maxi = i

    print(f"A legnagyobb elem a {max}, ami a(z) {maxi+1}. helyen van.")
    print(f"A legkisebb elem a {min}, ami a(z) {mini+1}. helyen van.")

    # Rendezés
    lista.sort()
    print("A rendezett lista: ", end="")
    for i in range(len(lista)):
        print(lista[i], end=" ")
    ```

2. Írj egy olyan **függvényt**, ami kiszámolja két elem szorzatát!
    ```python
    def szorzat(a,b):
        return a*b

    print(szorzat(5,3)) # 15
    print(szorzat(-2,5)) # -10
    ```

3. Írj egy olyan **eljárást**, ami paraméterként kér két számot: egy kisebbet és egy nagyobbat. Az eljárásnak ki kell írnia a számokat a legkisebbtől a legnagyobbig, mindkét számot beleértve.

    ```python
    def kiirat(a,b):
        for i in range(a,b+1):
            print(i,end=" ")
        print() # Miután kiírta az összes számot végezzen el egy sortörést

    kiirat(5,12) # 5 6 7 8 9 10 11 12
    kiirat(-5, 5) # -5 -4 -3 -2 -1 0 1 2 3 4 5
    ```

## Lebegőpontos számok N tizedesjegynyi pontossággal

```python
atlag = 240/7 # 34.285714285714285...
```

### 1. módszer: `round(szám, tizedesjegy)`
- Ez egy beépített függvény, ami kerekíteni fogja a megadott számot. Például:

```python
print(round(atlag, 2)) # 34.29
print(round(atlag, 1)) # 34.3
print(round(atlag, 0)) # 34.0
print(round(atlag, -1)) # 30.0
```

> [!IMPORTANT]
> Ha emelten olyan kérdeznek, hogy jelenítsd meg 2 (vagy bármennyi) tizedesjegy pontossággal, akkor ne ezt használd mert ezért nem jár pont, mert kerekítünk 

### 2. módszer: `:.2f`
- Ez egy formázási metódus, ilyenkor az érték nem fog megváltozni, csak a kiiratás fog kinézni máshogy

```python
# Két tizedesjegyre
print("Atlag: {:.2f}".format(atlag)) # .format-tal 
print(f"Atlag: {atlag:.2f}") # fstringgel

# Három tizedesjegyre
print("Átlag: {:.3f}".format(atlag))
print(f"Átlag: {atlag:.3f}")
```

> [!NOTE]
> Ezt használhatod nyugodtan, ezt fix el fogják fogadni, de ha nem jutna eszedbe akkor van még egy 3. módszer

### 3. módszer (matekes)
- Előszőr ahány tizedesjegyre szeretnénk megjeleníttetni a számot, annyival toljuk arrébb a vesszőt.

```python
atlag = atlag * 100 # Két tizedesjeggyel eltoljuk
atlag = atlag * 1000 # Három tizedesjeggyel eltoljuk
```

- Ezután a számot `float` típusról átalakítjuk `int` típusra, így a szám többi része elveszlik

```python
atlag = int(atlag)
```

- Utána visszaosztjuk a számot amennyivel eltoltuk
```python
atlag = atlag / 100 # Két tizedesjegy
atlag = atlag / 1000 # Három tizedesjegy
```

- Egysorban: 
```python
atlag = int(atlag*100)/100 # Két tizedesjegy
atlag = int(atlag*1000)/1000 # Három tizedesjegy
```

> [!NOTE]
> Ez megváltoztatja a szám értékét, de ezt is elfogadják emelten ha nem jutna eszedbe a `:.2f` módszer, de lehetőleg azt használd

## `.join()`
- Ha van egy `string`-eket tartalmazó listánk, és ezeknek a tartalmát ki szeretnénk iratni, akkor ehhez használható a `.join()` metódus.
- Előre kerül az, hogy mivel szeretnénk elválasztani a listaelemeket egymástól, utána a `join`-ba kerül a lista.
```python
gyumolcsok = ["alma", "banán", "citrom", "dinnye"]
print(" ".join(gyumolcsok)) # alma banán citrom dinnye
print(", ".join(gyumolcsok)) # alma, banán, citrom, dinnye
print(":".join(gyumolcsok)) # alma:banán:citrom:dinnye
```

> [!WARNING]
> Csak akkor használjuk a `.join` ha csak `string`-ek szerepelnek a listában, ha esetleg nem akkor az összeset át kell alakítnai, különben hibát fog dobni.

## Fájlbeolvasás
- Fájlt megnyitni az `open()` fügvénnyel lehet. Ennek meg kell adni kettő paramétert:

   - A fájl elérési útja (**abszolút** / **relatív**)
   - A fájl megnyitási módja (alapértelmezetten `r`, vagyis olvasásra nyissa meg)
- Ha a fájl ugyanabban a mappában található, mint a `.py` fájl, akkor csak a fájl nevére hivatkozva el lehet érni. Ha nem akkor abszolút hivatkozást kell használni, például:

```python
f = open("file.txt", "r")
f = open("C:/Users/Default/Documents/projekt/file.txt", "r")
```

> [!NOTE]
> Ha a `.py` file a `C:/Users/Default/Documents/projekt` mappában van, akkor a két beolvasás között nincs különbség

> [!TIP]
> Ajánlom, hogy mindig húzd be a bementi fájlt abba a mappába ahol vagy. Így nem kellesz majd máshova hivatkozni, hanem csak simán a fájl nevét beírod.

## Beolvasás típusok
- Mindegyik beolvasást valahogy így fog kinézni:
```python
f = open("bemenet.txt", "r")
adatok = [] # Egy listában letároljuk az adatokat

for sor in f: # Soronként végigmengyünk a fájlon
    # Itt beolvassuk az adatokat és hozzárendeljük a listához

f.close() # Lezárjuk a fájlt
```
> [!IMPORTANT]
> Minden szöveges fájl sorának a végén szerepel egy `\n` sortörés karakter, ezeket le kell szedni a `strip()` függvénnyel. A dátumokat és a számokat `string`-ként lesznek elmentve

### Táblázatos beolvasás (leggyakoribb)
- Ilyenkor a bemeneti fájl valahogy így néz ki:
```
Csorba Ede 16:30 2017.10.28-18:48
Fodor Zsuzsanna 16:50 2017.10.28-18:51
Csorba Ede 16:40 2017.10.28-19:56
Barna Eszter 16:30 2017.10.28-19:57
Beke Bianka 16:40 2017.10.28-19:58
```

Ezeket így lehet beolvasni:
```python
f = open("bemenet.txt", "r")
adatok = []

for sor in f:
    adatok.append(sor.strip().split())
    # Beolvassuk a sort, leszedjük a \n karaktert, felosszuk whitespace (szóköz, tabulátor) alapján

f.close()

print(adatok) # Egy kétdimenziós listát fogunk kapni
# [['Csorba', 'Ede', '16:30', '2017.10.28-18:48'], ['Fodor', 'Zsuzsanna', '16:50', '2017.10.28-18:51'], ... ]
```

### Soronként 1 elem (legegyszerűbb, de legritkább)
- Ilyenkor a bemeneti fájl valahogy így néz ki:
```
0
0
0
0
0
0
2
2
2
2
```

Ezt így lehet beolvasni:

```python
f = open("bemenet.txt", "r")
adatok = []

for sor in f:
    adatok.append(sor.strip())
    # Beolvassuk a sort, leszedjük a \n karaktert

f.close()

print(adatok) # Egydimenziós listát kapunk
# ['0', '0', '0', '0', '0', '0', '2', '2', '2', '2']
```

### Soronként 1 adat, de csoportosítani kell őket (gyakori, nehezebb)
- Ez valahogy így néz ki:
```
2017.07.16
Games
7x01
60
1
2017.07.23
Games
7x02
60
1
2017.07.30
Games
7x03
60
1
```

> [!NOTE]
> Még nem néztünk ilyet, kövi órán ránézünk :D

### +1: 3D listába olvasás (legnehezebb)
> [!NOTE]
> Ránézünk majd az érettségihez közel, eddig csak egyszer kértek ilyet, remélem többet nem fognak :|

## Kétdimenziós listák
- Olyan listák, amelyeknek elemei szintén listákat tartalmaznak. Legkönnyebb táblázatént elképzelni. Például egy szorzótábla kétdimenziós listában így néz ki:
```python
szorzotabla = [
    [1, 2, 3, 4, 5, 6, 7, 8, 9],
    [2, 4, 6, 8,10,12,14,16,18],
    [3, 6, 9,12,15,18,21,24,27],
    [4, 8,12,16,20,24,28,32,36],
    [5,10,15,20,25,30,35,40,45],
    [6,12,18,24,30,36,42,48,54],
    [7,14,21,28,35,42,49,56,63],
    [8,16,24,32,40,48,56,64,72],
    [9,18,27,36,45,54,63,72,81]
]
```
- Hivatkozni úgy tudunk rá, hogy előszőr a nagy listából a kis listákra hivatkozunk, azon belül pedig az elemeire.
- Ha táblázatos módon akarjuk megfogalmazni, akkor előszőr a sorszámra, utána az oszlopszámra hivatkozunk.
- Például:
```python
print(szorzotabla[0]) # [1, 2, 3, 4, 5, 6, 7, 8, 9]
print(szorzotabla[3]) # [4, 8, 12, 16, 20, 24, 28, 32, 36]
print(szorzotabla[-1]) # [9, 18, 27, 36, 45, 54, 63, 72, 81]
print(szorzotabla[0][0]) # 1
print(szorzotabla[3][4]) # 20
print(szorzotabla[-1][0]) # 9
print(szorzotabla[-1][-1]) # 81
```

- Kétdimenziós lista kiiratása:
```python
for sor in range(len(szorzotabla)):
    for oszlop in range(len(szorzotabla[sor])):
        print(szorzotabla[sor][oszlop], end=" ")
    print()
```

Output:
```
1 2 3 4 5 6 7 8 9 
2 4 6 8 10 12 14 16 18 
3 6 9 12 15 18 21 24 27 
4 8 12 16 20 24 28 32 36 
5 10 15 20 25 30 35 40 45 
6 12 18 24 30 36 42 48 54 
7 14 21 28 35 42 49 56 63 
8 16 24 32 40 48 56 64 72 
9 18 27 36 45 54 63 72 81 
```

> [!IMPORTANT]
> A `len(szorzotabla)` a tábla sorainak számát adja vissza, vagyis azt, hogy hány kis listát tartalmaz a nagy lista.
> 
> A `len(szorzotabla[sor])` a tábla megadott sorának az oszlopszámát adja vissza, vagyis azt, hogy a kis listában hány elem van.


## Feladatok megoldása az `orarend.txt` fájllal
A fájl egy osztály órarendjét tartalmazza, első oszlopban van a tantárgy neve, utána nap neve, kezdeti és befejező időpont, tanár vezeték- és keresztneve.

```
Algebra Hetfo 08:00 08:45 Kovacs Andras
Fizika Hetfo 08:55 09:40 Toth Gyorgy
Irodalom Hetfo 09:50 10:35 Nagy Eva
```

1. Olvassuk be a fájl és irassuk ki hány óra van egy héten.

    - Beolvasás: 

        ```python
        f = open("orarend.txt", "r")
        adatok = []
        for sor in f:
            adatok.append(sor.strip().split())
        f.close()
        ```

    - Kiiratás
        
        ```python
        print(f"Összesen {len(adatok)} óra van egy héten")
        ```

> [!IMPORTANT]
> A `len(adatok)` pont az órák számát fogja kiiratni, általában ilyen szokott lenni az első feladat.

2. Irassuk ki a szerdai órákat, és számoljuk meg őket!
    ```python
    orak = 0
    for i in range(len(adatok)): # Végigmegyünk az összes órán
        if adatok[i][1] == "Szerda": # Ha az i.számú óra szerdán van
            print(adatok[i]) # kiiratjuk az órát
            orak = orak + 1
    print(f"Szerdán összesen {orak} óra van.")
    ```

3. Készítsünk egy függvényt, ami átváltja az időt percekké. A függvény paramétere egy `string` legyen, aminek formátuma `óra:perc`.

    ```python
    def percek(ido):
        # Felosszuk az időt a kettőspont alapján, ebből lesz egy tömb és annak első eleme lesz az órák száma.
        ora = int(ido.split(":")[0]) # Átváltjuk számmá, hogy később tudjunk vele számolni
        perc = int(ido.split(":")[1])
        return ora*60+perc
    
    print(percek("10:45")) # 645
    ```

4. Hány percesek az órák? Irassuk ki a képernyőre az óra nevét, napját és időtartamát.

    ```python
    def kulonbseg(ido1, ido2):
        return percek(ido2)-percek(ido1)
    
    for i in range(len(adatok)):
        print(f"{adatok[i][0]} {adatok[i][1]} {kulonbseg(adatok[i][2], adatok[i][3])}")
    ```
    Output:
    ```
    Algebra Hetfo 45
    Fizika Hetfo 45
    Irodalom Hetfo 45
    Tortenelem Hetfo 45
    ...
    ```

5. Hány tárgyat tanítanak? Irasd ki a különböző tárgyak számát és a nevüket.
    - Első megoldás (listás)
    
        ```python
        egyedi = []
        for i in range(len(adatok)):
            if adatok[i][0] not in egyedi: # Ha eddig nem volt ilyen tárgy
                egyedi.append(adatok[i][0]) # akkor beletesszük a listába
        print(f"Összesen {len(egyedi)} különböző tárgy van: {", ".join(egyedi)}")
        ```

    - Második megoldás (halmazos)
        ```python
        targyak = [] # Kiszedjük csak a tárgyak nevét
        for i in range(len(adatok)):
            targyak.append(adatok[i][0])
        
        targyak = list(set(targyak)) # Átalakítjuk halmazzá, ez kiszedi az ismétlődéseket, utána pedig vissza listává.

        print(f"Összesen {len(targyak)} különböző tárgy van: {", ".join(targyak)}")
        ```
> [!NOTE]
> Lehet mindkettőt használni, a halmazos akkor jobb ha egyféle adat van.
## Fájlbaírás
- Ha írni akarunk egy fájlba ugyanúgy az `open()` függvényt használjuk
    
    ```python
    f = open("kimenet.txt", "w")
    ```
    
> [!IMPORTANT]
> Ha nem létezik a `kimenet.txt` akkor automatikusan létrehozódik. Ha pedig van benne valami, akkor a benne lévő tartalom törlődik.
- Ezután a fájlba az `f.write()` paranccsal tudunk írni. Például:

    ```python
    f = open("kimenet.txt", "w")
    f.write("alma")
    f.write("banán")
    f.write("citrom")
    f.close()
    ```

> [!WARNING]
> Az `f.write` nem fog automatikusan sortörést tenni, ezért nekünk a végére kell tenni egy `\n` karaktert. Tehát a fájl tartalma így:

    almabanáncitrom

### Feladatok
- Írjuk egy fájlba a szorzótáblát.

    ```python
    f = open("szorzotabla.txt", "w")
    for i in range(len(szorzotabla)):
        for j in range(len(szorzotabla[i])):
            f.write(f"{szorzotabla[i][j]} ")
        f.write("\n")
    f.close()
    ```
    `szorzotabla.txt` tartalma:
    ```
    1 2 3 4 5 6 7 8 9 
    2 4 6 8 10 12 14 16 18 
    3 6 9 12 15 18 21 24 27 
    4 8 12 16 20 24 28 32 36 
    5 10 15 20 25 30 35 40 45 
    6 12 18 24 30 36 42 48 54 
    7 14 21 28 35 42 49 56 63 
    8 16 24 32 40 48 56 64 72 
    9 18 27 36 45 54 63 72 81 
    ```

## Házi
> [!NOTE]
> Találsz ebben a mappában egy `diakok.txt` fájlt, ezzel kellesz dolgoznod.

A `diakok.txt` diákok adatai találhatóak. Egy diák adata az alábbiakból áll: vezetéknév, keresztnév, életkor, osztály, jegyátlag. 

1. Olvasd be a `diakok.txt` fájl, és irasd ki hány diák szerepel a fájlban.
2. Irasd ki a legidősebb diákok nevét.
    
> [!TIP]
> Ide kell egy maximum keresés, és miután megvan az alapján kiiratod azokat, akiknek az életkora megegyezik a maximum életkorral

3. Készíts egy függvényt, amely egy osztály nevét kapja bemenetként, és visszaadja annak évfolyamát. Például:
    ```python
    print(evfolyam("10.A")) # 10
    print(evfolyam("5.B")) # 5
    ```
4. Írd ki a 10. évfolyamos diákok nevét, felhasználva a `evfolyam(osztaly)` függvényt.
5. A `jo_tanulok.txt` fájlba írd be azoknak a diákoknak a nevét és életkorát, akiknek jegyátlaguk meghaladja a 4.0-át.

Miután lefuttatod a kódot a kimenet így nézzen ki:
```
Összesen 40 diák szerepel az adatbázisban.
Legidősebb diákok: 
Barta Kristof
Nagy Anna
Varga David
Feher Marton
Hegedus Mate
Vincze Orsolya
Fulop Patrik
Vass Lili
Pinter Zoltan
Fekete Adrienn
Kantor Norbert
Sarkozi Tamara

10. évfolyamos diákok: 
Kiss Peter 10.A
Toth Lilla 10.A
Molnar Akos 10.A
Lakatos Eniko 10.B
Juhasz Tamas 10.B
Szalai Kitti 10.A
Toth Lilla 10.B
Takacs Melinda 10.A
Bognar Virag 10.B
Illes Attila 10.A
Kelemen Nikolett 10.A
Orosz Gabor 10.B
Sipos Nora 10.A
Biro Richard 10.B
Kallai Bettina 10.A
Zentai Gergo 10.B
```

## Házi megoldása (2025.03.05)
1. Olvasd be a `diakok.txt` fájl, és irasd ki hány diák szerepel a fájlban.
2. Irasd ki a legidősebb diákok nevét.
3. Készíts egy függvényt, amely egy osztály nevét kapja bemenetként, és visszaadja annak évfolyamát.
4. Írd ki a 10. évfolyamos diákok nevét, felhasználva a `evfolyam(osztaly)` függvényt.
5. A `jo_tanulok.txt` fájlba írd be azoknak a diákoknak a nevét és életkorát, akiknek jegyátlaguk meghaladja a 4.0-át.
```python
# 1. feladat
f = open("diakok.txt", "r")
adatok = []
for sor in f:
    adatok.append(sor.strip().split())
f.close()

print(f"Összesen {len(adatok)} diák szerepel az adatbázisban.")

# 2. feladat
maximum = int(adatok[0][2])
for i in range(len(adatok)):
    if int(adatok[i][2]) > maximum:
        maximum = int(adatok[i][2])

print("Legidősebb diákok: ")
for i in range(len(adatok)):
    if int(adatok[i][2]) == maximum:
        print(f"{adatok[i][0]} {adatok[i][1]}")

# 3. feladat
def evfolyam(osztaly):
    ev = osztaly.split(".")[0]
    return ev


# print(evfolyam("10.A")) # 10
# print(evfolyam("5.B")) # 5


# 4. feladat
print("\n10. évfolyamos diákok: ")
for i in range(len(adatok)):
    if evfolyam(adatok[i][3]) == "10":
        print(f"{adatok[i][0]} {adatok[i][1]} {adatok[i][3]}")

# 5. feladat
f = open("jo_tanulok.txt", "w")
for i in range(len(adatok)):
    if float(adatok[i][4])>4:
        f.write(f"{adatok[i][0]} {adatok[i][1]} {adatok[i][2]}\n")
```