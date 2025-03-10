# 4-5. óra

## Házi megoldása
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

## Épitményadó (2022. május)

### Feladat: [link](/Óra%204-5%20(2025.03.05-2025.03.06)/epitmenyado/Építményadó.pdf)
### Forrás: [link](/Óra%204-5%20(2025.03.05-2025.03.06)/epitmenyado/utca.txt)

### Megoldás:
```python
f = open("utca.txt")
adatok = []
for sor in f:
    adatok.append(sor.strip().split())
f.close()

# Kiszedjük külön az adósávokért fizetendő összeget
adok = adatok[0]
adatok.pop(0)

# 2. feladat
print(f"2. feladat. A mintában {len(adatok)} telek szerepel.")

# 3. feladat
adoszam = "68396" # input("3. feladat. Egy tulajdonos adószáma: ")
talalt = 0
for i in range(len(adatok)):
    if adoszam == adatok[i][0]:
        talalt += 1
        print(f"{adatok[i][1]} utca {adatok[i][2]}")

if talalt == 0:
    print("Nem szerepel az adatállományban.")

# 4. feladat
def ado(adosav, alapterulet):
    if adosav == "A":
        fizetendoAdo = int(adok[0])
    elif adosav == "B":
        fizetendoAdo = int(adok[1])
    elif adosav == "C":
        fizetendoAdo = int(adok[2])

    if fizetendoAdo * int(alapterulet) < 10000:
        return 0
    return fizetendoAdo*int(alapterulet)

# 5. feladat
darabszam = [0,0,0]
osszeg = [0,0,0]
for i in range(len(adatok)):
    if adatok[i][3] == "A":
        darabszam[0] += 1
        osszeg[0] += ado(adatok[i][3], adatok[i][4])
    if adatok[i][3] == "B":
        darabszam[1] += 1
        osszeg[1] += ado(adatok[i][3], adatok[i][4])
    if adatok[i][3] == "C":
        darabszam[2] += 1
        osszeg[2] += ado(adatok[i][3], adatok[i][4])

print("5. feladat")
print(f"A sávba {darabszam[0]} telek esik, az adó {osszeg[0]} Ft.")
print(f"B sávba {darabszam[1]} telek esik, az adó {osszeg[1]} Ft.")
print(f"C sávba {darabszam[2]} telek esik, az adó {osszeg[2]} Ft.")

# 6. feladat
print(f"6. feladat: A több sávba sorolt utcák: ")
utcak = []
for i in range(len(adatok)-1):
    if adatok[i][1] == adatok[i+1][1] and adatok[i][3] != adatok[i+1][3]:
        utcak.append(adatok[i][1])

utcak = list(set(utcak))

for utca in utcak:
    print(utca)

# 7. feladat
adotulajdonosonkent = {}
for i in range(len(adatok)):
    if adatok[i][0] not in adotulajdonosonkent:
        adotulajdonosonkent[adatok[i][0]] = ado(adatok[i][3], adatok[i][4])
    else:
        adotulajdonosonkent[adatok[i][0]] += ado(adatok[i][3], adatok[i][4])

f = open("fizetendo.txt", "w")
for kulcs, ertek in adotulajdonosonkent.items():
    f.write(f"{kulcs} {ertek}\n")
f.close()
```

## Sorozatok (2020. október)
### Feladat: [link](/Óra%204-5%20(2025.03.05-2025.03.06)/sorozatok/e_inf_20okt_fl-10-11.pdf)
### Forrás: [link](/Óra%204-5%20(2025.03.05-2025.03.06)/sorozatok/lista.txt)
### Megoldás:
```python
# 1. feladat
f = open("lista.txt", "r")
adatok = []

# Órán így csináltuk
''' 
seged = []
hossz = 0
for sor in f:
    seged.append(sor.strip())
    hossz += 1
    if hossz == 5:
        adatok.append(seged)
        seged = []
        hossz = 0
'''

# De meg lehet csinálni hossz változó nélkül is
seged = []
for sor in f:
    seged.append(sor.strip())
    if len(seged) == 5:
        adatok.append(seged)
        seged = []

# 2. feladat
ismert = 0
for i in range(len(adatok)):
    if adatok[i][0] != "NI":
        ismert += 1

print(f"2. feladat\nA listában {ismert} db vetítési dátummal rendelkező epizód van.\n")

# 3. feladat
latta = 0
for i in range(len(adatok)):
    if adatok[i][4] == "1":
        latta += 1
print(f"3. feladat\nA listában lévő epizódok {latta / len(adatok) * 100:.2f}%-át látta.\n")

# 4. feladat
percek = 0
for i in range(len(adatok)):
    if adatok[i][4] == "1":
        percek += int(adatok[i][3])

ora = percek // 60
perc = percek % 60
nap = ora // 24
ora = ora % 24

print(f"4. feladat\nSorozatnézéssel {nap} napot {ora} órát és {perc} percet töltött.")

# 5. feladat
datum = "2017.10.18"#input("5. feladat\nAdjon meg egy dátumot! Dátum= ")
for i in range(len(adatok)):
    if adatok[i][0] <= datum and adatok[i][4] == "0":
        print(f"{adatok[i][2]}\t{adatok[i][1]}")


# 6. feladat
def hetnapja(ev, ho, nap):
    napok = ["v", "h", "k", "sze", "cs", "p", "szo"]
    honapok = [0, 3, 2, 5, 0, 3, 5, 1, 4, 6, 2, 4]
    if ho < 3:
        ev -= 1
    return napok[(ev + ev // 4 - ev // 100 + ev // 400 + honapok[ho - 1] + nap) % 7]

# 7. feladat
napnev = input("\n7. feladat\nAdja meg a hét egy napját (például cs)! Nap= ")
sorozatok = []
for i in range(len(adatok)):
    if adatok[i][0] != "NI":
        ev, ho, nap = adatok[i][0].split(".")
        nap = int(nap)
        ho = int(ho)
        ev = int(ev)
        if hetnapja(ev, ho, nap) == napnev:
            sorozatok.append(adatok[i][1])

sorozatok = list(set(sorozatok))
for sorozat in sorozatok:
    print(sorozat)

# 8. feladat (Ezt órán átnézzük, addig próbáld megérteni, hogy hogyan működik)
# ----------------------------------------------------------------------------
sorozatok = {}
for i in range(len(adatok)):
    if adatok[i][1] not in sorozatok:
        sorozatok[adatok[i][1]] = [int(adatok[i][3]), 1] # [percek, darabszám]
    else:
        percek = sorozatok[adatok[i][1]][0]
        darabszam = sorozatok[adatok[i][1]][1]
        sorozatok[adatok[i][1]] = [percek+int(adatok[i][3]), darabszam+1]

f = open("summa.txt", "w")
for kulcs, ertek in sorozatok.items():
    f.write(f"{kulcs} {ertek[0]} {ertek[1]}\n")
f.close()
```

## Házi
### Gödrök (2021. május)
#### Feladat: [link](/Óra%204-5%20(2025.03.05-2025.03.06)/godrok/godrok.pdf)
#### Forrás: [link](/Óra%204-5%20(2025.03.05-2025.03.06)/godrok/melyseg.txt)
> [!NOTE] 
> A beolvasásnál nem kell megijedni, csak egyszerűen egy for ciklussal végigmész a fájlon, és belerakod a sor.strip()-et a listába, nem kell splittelni itt.