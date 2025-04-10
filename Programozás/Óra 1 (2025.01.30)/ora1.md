# 1. óra

## `input` használata
```python
szam = int(input("Adj meg egy számot: ")) # Ha számot szeretnénk beolvasni
szoveg = input("Adj meg egy szöveget: ") # Ha szöveget szeretnénk beolvasni
```

## Kiíratás

### Kiíratás összefűzéssel `(+)`
```python
print("Ez egy szám: " + str(szam))
print("Ez egy szöveg: " + szoveg)
```

### Kiíratás `format`-al
```python
print("Ez egy szám: {}".format(szam))
print("Ez egy szöveg: {}".format(szoveg))

# Több változó használata
print("Összesen {} diák jött be {} órára.".format(diakok_szama, ora))
print("Összesen {0} diák jött be {1} órára.".format(diakok_szama, ora))
print("Összesen {1} diák jött be {0} órára.".format(ora, diakok_szama))
```

### Kiíratás `fstring`-el
```python
print(f"Ez egy szám: {szam}")
print(f"Ez egy szöveg: {szoveg}")
print(f"Összesen {diakok_szama} diák jött be {ora} órára.")
```

### Kiíratás egysorban
```python
print("Alma", end=" ")
print("Banán")
```

Output:
```
Alma Banán
```

## Feltételek `(if)`
```python
if feltétel1:
    utasítás1
elif feltétel2:
    utasítás2

...

elif feltételN:
    utasításN
else:
    utasításVégső
```

Két szám ellenőrzése:
```python
if a>b:
    print("Az első szám nagyobb, mint a második")
elif a<b:
    print("Az első szám kisebb, mint a második")
else:
    print("A két szám egyenlő")
```

## Ciklusok
### `while` ciklus
Akkor futnak le az utasítások, ha a feltétel igaz
```python
while feltétel:
    utasítás1
    utasítás2
    ...
    utasításN
```

Például számok kiírása 1-től 10-ig:
```python
i = 1
while i<=10:
    print(i)
    i = i + 1
```

### `for` ciklus
Egy ciklusváltozóval végigmegyünk egy bizonyos adatszerkezeten (`string`, `lista`, `range`)
### String
```python
szoveg = "mitokondrium"
for betu in szoveg:
    print(betu)
```
Output:
```
m
i
t
o
k
o
n
d
r
i
u
m
```

### Lista
```python
lista = ["alma", "banán", "citrom", "dinnye"]
for i in lista:
    print(i)
```

Output:
```
alma
banán
citrom
dinnye
```

### Range
```python
range(mettől, meddig, lépésköz) # Utolsó elemet nem veszi bele!!!
```
---
```python
for i in range(10): #0-tól 9-ig írja ki a számokat egyesével
    print(i)
```

Output:
```
0
1
2
3
4
5
6
7
8
9
```
---
```python
for i in range(1, 6, 2): #1-től 5-ig írja ki a számokat kettesével
    print(i)
```
Output:
```
1
3
5
```
---
```python
for i in range(5, 0, -1): #5-től 1-ig írja ki a számokat visszafele
    print(i)
```
Output:
```
5
4
3
2
1
```

### Egybeágyazott ciklusok, szorzótábla
```python
for i in range(1,10):
    for j in range(1,10):
        print(i*j, end=" ")
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


## Random szám generálása
```python
import random

szam = random.randint(1,100) # 1 és 100 között generál egy számot, beletartozik az 1 és a 100 is
```

## Számkitalálós játék
```python
import random

randomszam = random.randint(1,100)
tipp = int(input("Tipp: "))
proba = 1

while tipp != randomszam:
    
    if tipp > randomszam:
        print("Kisebbet tippelj.")
    elif tipp < randomszam:
        print("Nagyobbat tippelj.")
    
    tipp = int(input("Tipp: "))
    proba = proba + 1
    
    if proba == 10:
        break

if tipp == randomszam:
    print("Kitaláltad a számot!")
else:
    print("Elfogytak a próbalehetőségek!")
```


## Stringműveletek
### String hossza
```python
szoveg = "mitokondrium"
print(len(szoveg)) # 12
```

### Stringre hivatkozás
```python
szoveg = "mitokondrium"
print(szoveg[0]) # m
print(szoveg[1]) # i
print(szoveg[-1]) # m
print(szoveg[-2]) # u
print(szoveg[0:4]) # mito
print(szoveg[:4]) # mito
print(szoveg[4:8]) # kond
print(szoveg[4:]) # kondrium
print(szoveg[4:len(szoveg)]) # kondrium
print(szoveg[::2]) # mtknru
print(szoveg[1::2]) # ioodim
print(szoveg[1:8:2]) # iood
print(szoveg[::-1]) # muirdnokotim
```

### Split
```python
szoveg = "alma,banan,citrom,dinnye"
lista = szoveg.split(",") # Vessző alapján felosztja a szöveget és egy listát állít elő
print(lista) # ["alma", "banan", "citrom", "dinnye"]
```

## Listaműveletek
### Új lista létrehozása
```python
lista = []
```
### Új elem hozzáadása
```python
lista = []
print(lista) # []
lista.append("alma")
print(lista) # ["alma"]
```
### Egy elem kiszedése
```python
lista = ["alma", "banán"]
lista.remove("banán")
print(lista) # ["alma"]
```

```python
lista = ["alma", "banán"]
lista.pop(1)
print(lista) # ["alma"]
```

### Lista rendezése
#### `.sort`
```python
lista = [5, 3, 23, 8, 1, 9, 6, 177, 4]
lista.sort()
print(lista) # [1, 3, 4, 5, 6, 8, 9, 23, 177]
lista.sort(reverse=True)
print(lista) # [177, 23, 9, 8, 6, 5, 4, 3, 1]
```
#### `sorted()`
```python
lista = [5, 3, 23, 8, 1, 9, 6, 177, 4]
rendezettlista = sorted(lista)
rendezettlista2 = sorted(lista, reverse=True)
print(rendezettlista) # [1, 3, 4, 5, 6, 8, 9, 23, 177]
print(rendezettlista2) # [177, 23, 9, 8, 6, 5, 4, 3, 1]
```

### Maximumkeresés
```python
lista = [5, 3, 23, 8, 1, 9, 6, 177, 4]
maximum = lista[0]
for i in range(len(lista)):
    if lista[i]>maximum:
        maximum = lista[i]
print(maximum) # 177
```

### Minimumkeresés
```python
lista = [5, 3, 23, 8, 1, 9, 6, 177, 4]
minimum = lista[0]
for i in range(len(lista)):
    if lista[i]<minimum:
        minimum = lista[i]
print(minimum) # 1
```

### Összegzés
```python
lista = [5, 3, 23, 8, 1, 9, 6, 177, 4]
osszeg = 0
for i in range(len(lista)):
    osszeg = osszeg+lista[i]
print(osszeg) # 236
```

## Házi
- Írj egy programot ami bekér egy pozitív számot, és azt kiirja visszafele.
  - Például: 1977 -> 7791
- Kérj be a felhasználótól 5 számot, és számold ki az összegüket!
- Kérj be egy szöveget és egy számot a felhasználótól, majd írasd ki a szöveget annyiszor, ahányat megadott!
  - Bemenet:

    ```
    Szó: mitokondrium
    Szám: 3
    ```

  - Kimenet:

    ```
    mitokondrium
    mitokondrium
    mitokondrium
    ```
- Kérj be egy szöveget a felhasználótól, és írasd ki belőle minden második betűt!
- Adott egy lista: `lista = [5, 3, 23, 8, 1, 9, 6, 177, 4]`. Számold ki a számok átlagát.
- Adott egy lista: `lista = [5, 3, 23, 8, 1, 9, 6, 177, 4]`. Számold ki a számok mediánját.

  *A medián a sorba rendezett adatok közül a középső érték; vagy másképpen: a medián az az érték, amely a sorba rendezett adatokat két egyenlő részre osztja.*

  Például:
  ```python
  [1, 2, 3, 4, 5] # 3
  [3, 1, 2, 5, 3] # 3
  [1, 300, 2, 200, 1] # 2
  [3, 6, 20, 99, 10, 15] # 12.5
  ```

    > Ez nehezebb, nem gond ha nem megy még