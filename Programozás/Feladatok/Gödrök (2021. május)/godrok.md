## Gödrök (2021. május)
### Feladat: [link](godrok.pdf)
### Forrás: [link](melyseg.txt)
### Megoldás:
```python
f = open("melyseg.txt")
adatok = []
for sor in f:
    adatok.append(sor.strip())
f.close()
print(f"1. feladat\nA fájl adatainak száma: {len(adatok)}\n")

# 2. feladat
print("2. feladat")
tav = int(input("Adjon megy egy távolságértéket! "))
print(f"Ezen a helyen a felszín {adatok[tav]} mélyen van.\n")

# 3. feladat
print("3. feladat")
erintetlen = 0
for i in range(len(adatok)):
    if adatok[i] == '0':
        erintetlen += 1
print(f"Az érintetlen terület aránya {erintetlen / len(adatok) * 100:.2f}%\n")

# 4-5. feladat
godrok = 0  # 5
f = open("godrok.txt", "w")
for i in range(len(adatok) - 1):
    if adatok[i] != '0' and adatok[i + 1] != '0':
        f.write(f"{adatok[i]} ")
    elif adatok[i] != '0' and adatok[i + 1] == '0':
        f.write(f"{adatok[i]}\n")
        godrok += 1  # 5

if adatok[-1] != '0':
    f.write(f"{adatok[-1]}\n")
    godrok += 1  # 5
f.close()

print(f"5. feladat\nA gödrök száma: {godrok}\n")

# 6. feladat
print("6. feladat")
if adatok[tav] == "0":
    print("Az adott helyen nincs gödör.")
else:
    # a)
    for i in range(tav, -1, -1):
        if adatok[i] == "0":
            kezdeti = i + 1
            break
    for i in range(tav, len(adatok)):
        if adatok[i] == "0":
            vege = i - 1
            break

    print(f"a)\nA gödör kezdete: {kezdeti + 1} méter, a gödör vége: {vege + 1} méter.")

    # b)
    print("b)")
    melyul = True
    folyamatos = True
    for i in range(kezdeti, vege + 1):
        if int(adatok[i]) <= int(adatok[i + 1]):  # Ha a gödör mélyül
            pass  # Akkor jók vagyunk
        else:  # De ha nem
            # Elérünk egy maximumhelyet, többet nem mélyülhet
            melyul = False

        # Ha már nem mélyülhet, de még mélyül
        if not melyul and int(adatok[i]) <= int(adatok[i + 1]):
            print("Nem mélyül folyamatosan.")
            folyamatos = False  # Nem folyamatos
            break

    if folyamatos:  # Ha nem lépett be a második if-be, akkor:
        print("Folyamatosan mélyül.")

    # c)
    print("c)")
    maximum = int(adatok[0])
    for i in range(kezdeti, vege + 1):
        if int(adatok[i]) > maximum:
            maximum = int(adatok[i])
    print(f"A legnagyobb mélysége {maximum} méter.")

    # d)
    print("d)")
    terfogat = 0
    for i in range(kezdeti, vege + 1):
        terfogat += int(adatok[i])
    print(f"A térfogata {terfogat * 10} m^3.")

    # e)
    print("e)")
    print(f"A vízmennyiség {(terfogat - (vege - kezdeti + 1)) * 10} m^3.")
```