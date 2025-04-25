## Virágágyások (2022. október)

### Feladat: [link](Virágágyások.pdf)
### Forrás: [link](felajanlas.txt)

### Megoldás:
```python
f = open("felajanlas.txt")
adatok = []
for sor in f:
    adatok.append(sor.strip().split())
db = adatok.pop(0)[0]
f.close()

# 2. feladat
print(f"2. feladat\nA felajánlások száma: {len(adatok)}\n")

# 3. feladat
print("3. feladat")
print("A bejárat mindkét oldalán ültetők: ", end="")
for i in range(len(adatok)):
    adatok[i][0] = int(adatok[i][0])
    adatok[i][1] = int(adatok[i][1])

for i in range(len(adatok)):
    if adatok[i][0] > adatok[i][1]:
        print(i + 1, end=" ")

# 4. feladat
print("\n\n4. feladat")
agyas = 100#int(input("Adja meg az ágyás sorszámát! "))

def beultetett(kezdo, veg, mit):
    kezdo = int(kezdo)
    veg = int(veg)
    if kezdo < veg:
        if kezdo <= mit <= veg:
            return True
    else:
        if 0 <= mit <= veg or kezdo <= agyas <= int(db):
            return True
    return False

# a
felajanlasok = 0
for i in range(len(adatok)):
    if beultetett(adatok[i][0], adatok[i][1], agyas):
        felajanlasok+=1
print(f"A felajánlók száma: {felajanlasok}")

# b
for i in range(len(adatok)):
    if beultetett(adatok[i][0], adatok[i][1], agyas):
        print(f"A virágágyás színe, ha csak az első ültet: {adatok[i][2]}")
        break

# c
szinek = set()
for i in range(len(adatok)):
    if beultetett(adatok[i][0], adatok[i][1], agyas):
        szinek.add(adatok[i][2])
print(f"A virágágyás színei: ", end='')
for szin in szinek:
    print(szin, end=' ')

# 5. feladat
print("\n\n5. feladat")
agyasok = {}
for i in range(len(adatok)):
    if int(adatok[i][0])<int(adatok[i][1]):
        for agyas in range(int(adatok[i][0]), int(adatok[i][1])+1):
            if agyas not in agyasok:
                agyasok[agyas] = 1
            else:
                agyasok[agyas] += 1
    else:
        for agyas in range(0, int(adatok[i][1]+1)):
            if agyas not in agyasok:
                agyasok[agyas] = 1
            else:
                agyasok[agyas] += 1
        for agyas in range(int(adatok[i][0]), int(db)+1):
            if agyas not in agyasok:
                agyasok[agyas] = 1
            else:
                agyasok[agyas] += 1

jelentkezok = 0
for agyas in agyasok.keys():
    jelentkezok+=agyasok[agyas]

if len(agyasok.keys()) == int(db) and jelentkezok == int(db):
    print("Minden ágyás beültetésére van jelentkező.")
elif jelentkezok >= int(db):
    print("Átszervezéssel megoldható a beültetés.")
else:
    print("A beültetés nem oldható meg.")

# 6. feladat
f = open("szinek.txt", "w")
for agyas in range(1, int(db)+1):
    beultetve = False
    for i in range(len(adatok)):
        if beultetett(adatok[i][0], adatok[i][1], agyas):
            beultetve = True
            f.write(f"{adatok[i][2]} {i+1}\n")
            break
    if not beultetve:
        f.write(f"# 0\n")
f.close()
```