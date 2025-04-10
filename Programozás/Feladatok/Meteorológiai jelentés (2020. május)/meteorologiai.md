## Meteorológiai jelentés (2020. május)
### Feladat: [link](Meteorológiai-jelentés.pdf)
### Forrás: [link](tavirathu13.txt)
### Megoldás:
```python
f = open("tavirathu13.txt")
adatok = []
for sor in f:
    adatok.append(sor.strip().split())
f.close()

# 2. feladat
print("2. feladat")
kod = input("Adja meg egy település kódját! Település: ")

# 1. megoldás
for i in range(len(adatok)):
    if adatok[i][0] == kod:
        meres = adatok[i]

print(f"Az utolsó mérési adat a megadott településről {meres[1][:2]}:{meres[1][2:]}-kor érkezett.")

# 2. megoldás
for i in range(len(adatok) - 1, -1, -1):
    if adatok[i][0] == kod:
        print(f"Az utolsó mérési adat a megadott településről {adatok[i][1][:2]}:{adatok[i][1][2:]}-kor érkezett.")
        break

# 3. feladat
print("3. feladat")
maximum = adatok[0]
minimum = adatok[0]

for i in range(len(adatok)):
    if int(adatok[i][3]) < int(minimum[3]):
        minimum = adatok[i]
    if int(adatok[i][3]) > int(maximum[3]):
        maximum = adatok[i]

print(f"A legalacsonyabb hőmérséklet: {minimum[0]} {minimum[1][:2]}:{minimum[1][2:]} {minimum[3]} fok.")
print(f"A legmagasabb hőmérséklet: {maximum[0]} {maximum[1][:2]}:{maximum[1][2:]} {maximum[3]} fok.")

# 4. feladat
print("4. feladat")
szelcsend = True
for i in range(len(adatok)):
    if adatok[i][2] == '00000':
        print(f"{adatok[i][0]} {adatok[i][1][:2]}:{adatok[i][1][2:]}")
        szelcsend = False
if szelcsend == True:
    print("Nem volt szélcsend a mérések idején")

# 5. feladat
print("5. feladat")
kozephomerseklet = {}
meresek = {}
ingadozas = {}

# Inicializálás
for i in range(len(adatok)):
    if adatok[i][0] not in kozephomerseklet:
        # Az összhőmérséklet, és a mérések száma
        kozephomerseklet[adatok[i][0]] = [0, 0]
        # 1, 7, 13, 19 órakor volt mérés
        meresek[adatok[i][0]] = [False, False, False, False]
        # Minimum és maximum letárolása
        ingadozas[adatok[i][0]] = [int(adatok[i][3]), int(adatok[i][3])]

# Megvizsgáljuk, hogy az adott órákban volt-e mérés
for i in range(len(adatok)):
    if adatok[i][1][0:2] == "01":
        meresek[adatok[i][0]][0] = True
    if adatok[i][1][0:2] == "07":
        meresek[adatok[i][0]][1] = True
    if adatok[i][1][0:2] == "13":
        meresek[adatok[i][0]][2] = True
    if adatok[i][1][0:2] == "19":
        meresek[adatok[i][0]][3] = True

# Összhőmérséklet és mérésszám számolása
for i in range(len(adatok)):
    if adatok[i][1][0:2] in ['01', '07', '13', '19']:
        kozephomerseklet[adatok[i][0]][0] += int(adatok[i][3])
        kozephomerseklet[adatok[i][0]][1] += 1

# Ingadozás számítása
for i in range(len(adatok)):
    # Minimumkeresés
    if ingadozas[adatok[i][0]][0] > int(adatok[i][3]):
        ingadozas[adatok[i][0]][0] = int(adatok[i][3])
    # Maximumkeresés
    if ingadozas[adatok[i][0]][1] < int(adatok[i][3]):
        ingadozas[adatok[i][0]][1] = int(adatok[i][3])

# Kiírás
for varos in kozephomerseklet.keys():
    # Ha 1, 7, 13, 19 órakor volt mérés
    if meresek[varos] == [True, True, True, True]:
        # Osszuk az összhőmérsékletet a mérések számával és ezt kerekítjük. Az ingadozás pedig a maximum-minimum.
        print(
            f"{varos} Középhőmérséklet: {round(kozephomerseklet[varos][0] / kozephomerseklet[varos][1])}; Hőmérséklet-ingadozás: {ingadozas[varos][1] - ingadozas[varos][0]}")
    else:
        print(f"{varos} NA; Hőmérséklet-ingadozás: {ingadozas[varos][1] - ingadozas[varos][0]}")

# 6. feladat
telepulesek = list(kozephomerseklet.keys())  # Kiszedjük a településkódokat a középhőmérséklet kulcs értékeiből.
for telepules in telepulesek:  # Településenként végigmegyünk az egész adatsoron és létrehozunk külön fájlokat.
    f = open(f"{telepules}.txt", "w")
    f.write(telepules + "\n")
    for i in range(len(adatok)):
        if adatok[i][0] == telepules:
            # ÓÓ:PP és a szélerősség az utolsó két karakter. Lehet úgyis, hogy adatok[i][2][4:5]
            f.write(f"{adatok[i][1][:2]}:{adatok[i][1][2:]} {"#" * int(adatok[i][2][-2:])}\n")
    f.close()
```