## Kerítés (2018. október)
### Feladat: [link](e_prog_2018_okt.pdf)
### Forrás: [link](kerites.txt)
### Megoldás:
```python
f = open("kerites.txt")
adatok = []
for sor in f:
    adatok.append(sor.strip().split(" "))
f.close()

# 2. feladat
print("2. feladat")
print(f"Az eladott telkek száma: {len(adatok)}\n")

# Szétszedjük külön listákba a páros és páratlan oldalon lévő telkeket

paros = []
paratlan = []

for i in range(len(adatok)):
    if adatok[i][0] == "0":
        paros.append(adatok[i])
    else:
        paratlan.append(adatok[i])

# 3. feladat
print("3. feladat")
if adatok[-1][0] == "0":
    print("A páros oldalon adták el az utolsó telket.")
    print(f"Az utolsó telek házszáma: {len(paros) * 2}")
else:
    print("A páratlan oldalon adták el az utolsó telket.")
    print(f"Az utolsó telek házszáma: {len(paratlan) * 2 - 1}")

# 4. feladat
print("\n4. feladat")
for i in range(len(paratlan) - 1):
    if paratlan[i][2] != ':' and paratlan[i][2] != '#':
        if paratlan[i][2] == paratlan[i + 1][2]:
            print(f"A szomszédossal egyezik a kerítés színe: {2 * i + 1}\n")
            break

# 5. feladat
print("5. feladat")
paletta = "ABCDEFGHJKLMNOPQRSTUVWXYZ"
hazszam = int(input("Adjon meg egy házszámot! "))
if hazszam % 2 == 0:
    telek = hazszam // 2 - 1
    print(f"A kerítés színe / állapota: {paros[telek][2]}")

    rossz_szinek = [paros[telek][2]]
    if telek != 0:
        rossz_szinek.append(paros[telek - 1][2])
    if telek != len(paros) - 1:
        rossz_szinek.append(paros[telek + 1][2])
    for szin in paletta:
        if szin not in rossz_szinek:
            print(f"Egy lehetséges festési szín: {szin}")
            break
else:
    telek = (hazszam - 1) // 2
    print(f"A kerítés színe / állapota: {paratlan[telek][2]}")
    rossz_szinek = [paratlan[telek][2]]
    if telek != 0:
        rossz_szinek.append(paratlan[telek - 1][2])
    if telek != len(paros) - 1:
        rossz_szinek.append(paratlan[telek + 1][2])
    for szin in paletta:
        if szin not in rossz_szinek:
            print(f"Egy lehetséges festési szín: {szin}")
            break

# 6. feladat
f = open("utcakep.txt", "w")
for i in range(len(paratlan)):
    f.write(paratlan[i][2] * int(paratlan[i][1]))
f.write("\n")
for i in range(len(paratlan)):
    hazszam = str(i * 2 + 1)
    f.write(f"{hazszam}{" " * (int(paratlan[i][1]) - len(hazszam))}")
f.close()
```