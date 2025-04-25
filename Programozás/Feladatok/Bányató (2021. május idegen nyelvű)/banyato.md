## Bányató (2021. május idegen nyelvű)

### Feladat: [link](banyato_prog.pdf)
### Forrás: [link](melyseg-banya.txt)

### Megoldás:
```python
f = open("melyseg-banya.txt")
adatok = []
for sor in f:
    adatok.append(sor.strip().split())
f.close()

# Nem muszáj ezeket lementeni, de ki kell szedni a nagy listából
sorok = adatok.pop(0)
oszlopok = adatok.pop(0)

# 2. feladat
print("2. feladat")
sor = int(input("A mérés sorának azonosítója="))
oszlop = int(input("A mérés oszlopának azonosítója="))
# Levonunk 1-et mert 0-tól kezdődik a számozás
print(f"A mért mélység az adott helyen {adatok[sor-1][oszlop-1]} dm")

#3. feladat
print("3. feladat")
felszin = 0
melysegosszeg = 0
for i in range(len(adatok)):
    for j in range(len(adatok[i])):
        if adatok[i][j] != '0':
            felszin += 1
            melysegosszeg += int(adatok[i][j])

print(f"A tó felszíne: {felszin} m2, átlagos mélysége: {(melysegosszeg/10)/felszin:.2f} m")

#4. feladat
print("4. feladat")
maxmelyseg = int(adatok[0][0])
# Ha mindegyik helyett ki kell iratni előszőr megkeressük a maximumot, utána pedig ahol egyezik az érték, kiirjuk a sor, oszlop párokat.
for i in range(len(adatok)):
    for j in range(len(adatok[i])):
        if maxmelyseg < int(adatok[i][j]):
            maxmelyseg = int(adatok[i][j])
print(f"A tó legnagyobb mélysége: {maxmelyseg} dm")

print("A legmélyebb helyek sor-oszlop koordinátái:")
for i in range(len(adatok)):
    for j in range(len(adatok[i])):
        if int(adatok[i][j]) == maxmelyseg:
            print(f"({i+1}; {j+1})", end="\t")

#5. feladat
print("\n5. feladat")
partvonal = 0
for sor_index in range(len(adatok)-1):
    for oszlop_index in range(len(adatok[sor_index])-1):
        # Jelenlegi 0 és tőle jobbra lévő nem 0, vagy jelenlegi nem 0 és tőle jobbra lévő 0.
        if adatok[sor_index][oszlop_index] == '0' and adatok[sor_index][oszlop_index+1] != '0' or adatok[sor_index][oszlop_index] != '0' and adatok[sor_index][oszlop_index+1] == '0':
            partvonal+=1
        # Jelenlegi 0 és alatta nem 0, vagy jelenlegi nem 0 és alatta 0.
        if adatok[sor_index][oszlop_index] == '0' and adatok[sor_index+1][oszlop_index] != '0' or adatok[sor_index][oszlop_index] != '0' and adatok[sor_index+1][oszlop_index] == '0':
            partvonal+=1

print(f"A tó partvonala {partvonal} m hosszú")

#6. feladat
print("6. feladat")
oszlopazon = int(input("A vizsgált szelvény oszlopának azonosítója="))
oszlopazon-=1 # 0-tól számozunk
f = open("diagram.txt", "w")
for sor in range(len(adatok)):
    if len(str(sor+1))==1:
        sorszam = "0"+str(sor+1)
    else:
        sorszam = str(sor+1)
    f.write(f"{sorszam}{"*"*round(int(adatok[sor][oszlopazon])/10)}\n")
f.close()
```