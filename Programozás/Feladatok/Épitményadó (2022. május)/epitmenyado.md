## Épitményadó (2022. május)

### Feladat: [link](Építményadó.pdf)
### Forrás: [link](utca.txt)

### Megoldás:
```python
f = open("utca.txt")
adatok = []
for sor in f:
    adatok.append(sor.strip().split())
f.close()

# Kiszedjük külön az adósávokért fizetendő összeget
adok = adatok.pop(0)

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