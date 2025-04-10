## Sorozatok (2020. október)
### Feladat: [link](e_inf_20okt_fl-10-11.pdf)
### Forrás: [link](lista.txt)
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