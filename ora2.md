# 2. óra

## Házik

- Írj egy programot ami bekér egy pozitív számot, és azt kiirja visszafele.
 
```python
# Fontos, hogy stringként olvassuk be, mert így meg tudjuk fordítani
szam = input("Szám=") 
print(szam[::-1])
```

- Kérj be a felhasználótól 5 számot, és számold ki az összegüket!

```python
osszeg = 0
for i in range(5): # A ciklus így ötször fog lefutni
    a = int(input("Szám: ")) # Mindig bekérünk egy új számot, amit eltárolunk
    osszeg = osszeg + a # hozzáadjuk az eltárolt számot az összegző változóhoz
print(osszeg)"""
```

- Kérj be egy szöveget és egy számot a felhasználótól, majd írasd ki a szöveget annyiszor, ahányat megadott!

```python
szoveg = input("Szó: ")
szam = int(input("Szám: "))
for i in range(szam): # A ciklus szam-szor fog lefutni
    print(szoveg) # és kiirja szam-szor a szoveg-et
```

- Kérj be egy szöveget a felhasználótól, és írasd ki belőle minden második betűt!

```python
szoveg = input()
print(szoveg[::2])
```

- Adott egy lista: `lista = [5, 3, 23, 8, 1, 9, 6, 177, 4]`. Számold ki a számok átlagát.

  - Első megoldás

    ```python
    lista = [5, 3, 23, 8, 1, 9, 6, 177, 4]
    osszeg = 0
    for i in lista: # Az i változó ilyenkor felveszi 5, 3, 23, ... értékeit
        osszeg = osszeg + i # és ezeket hozzádja az összegző változóhoz
    print(osszeg/len(lista)) # végül az összeget elosszuk a lista elemszámával vagyis a lista hosszával
    ```
  
  - Második megoldás

    ```python
    lista = [5, 3, 23, 8, 1, 9, 6, 177, 4]
    osszeg = 0
    for i in range(len(lista)): # Az i változó a lista pozícióit fogja felvenni
        osszeg = osszeg + lista[i] # és a lista[0], lista[1], ... értékeket fogja hozzáadni
    print(osszeg/len(lista)) # végül az összeget elosszuk a lista elemszámával vagyis a lista hosszával
    ```

- Adott egy lista: `lista = [5, 3, 23, 8, 1, 9, 6, 177, 4]`. Számold ki a számok mediánját.

```python
lista = [3, 6, 20, 99, 10, 15]
lista.sort() # Kirendezzük a listát növekvő sorrendbe
print(lista) # [3, 6, 10, 15, 20, 99]
# Kétféle lehetőség van, ha a lista hossza páros, vagy páratlan
# Ha páros, akkor a két középső elem átlagát kell venni.
# Például, ha a lista hossza 8, akkor a 4. és 5. elem átlaga lesz a medián
# Ha páratlan, akkor a középső elem lesz a medián.
# Például, ha a lista hossza 7, akkor a 4. elem lesz a medián.
if len(lista) % 2 == 0: # A lista hosszának kettővel való osztási maradéka 0 (páros)
    kozepso1 = lista[len(lista)//2-1] # Az egyik középső elem, ez a 10 lesz
    kozepso2 = lista[len(lista)//2] # A másik középső elem, ez a 15 lesz
    print((kozepso1 + kozepso2)/2) # A két szám átlaga
else: # Ha a maradék 1 (páratlan)
    print(lista[len(lista)//2]) # A középső elem
```

## Osztási műveletek

### `//` - maradék nélküli osztás

```python
print(4//2) # 2 (a 4-ben a 2 kétszer van meg)
print(5//3) # 1 (az 5-ben a 3 egyszer van meg)
print(9//2) # 4 (a 9-ben a 2 négyszer van meg)
```

### `%` - maradékos osztás

```python
print(4%2) # 0 (4//2=2, maradék 0)
print(10%3) # 1 (10//3=3, maradék 1)
print(150%100) # 50 (150//100=1, maradék 50)
```

### `/` - egyszerű osztás (mindig `float` típus lesz a végeredmény)
```python
print(4/2) # 2.0
print(5/2) # 2.5
print(12/5) # 2.4
```

## Csere

- Adott két változó:
    - `a = "alma"`
    - `b = "banán"`
  
  Legyen az `a` változó tartalma `"banán"`, a `b` változó tartalma `"alma"`

- Első módszer (fontos!!!):

    ```python
    # Bevezetünk egy harmadik változót, amiben eltároljuk az egyik változó tartalmát
    temp = a
    ```
    ```python
    # Most hogy az "a" változó tartalmát eltároltuk, felül lehet írni
    a = b
    ```
    ```python
    # Ezután már csak a "b" változó helyére tesszük az eltárolt tartalmat.
    b = temp
    ```
    Vagyis:
    ```python
    a = "alma"
    b = "banán"

    temp = a
    a = b
    b = temp

    print(a) # banán
    print(b) # alma
    ```
- Második módszer
  ```python
  a = "alma"
  b = "banán"

  a,b = b,a # Párhuzamos értékadás, csak pythonban működik

  print(a) # banán
  print(b) # alma
  ```

## Gyakorló feladat
```python
szoveg = "21,74,11,87,42,16,52,35"

#1. feladat: Hány darab szám szerepel a szövegben?
lista = szoveg.split(",") # Készít egy listát, ami felosztja a szoveg változót vesszőnként
print(len(lista)) # A lista hossza megadja, hogy hány számjegy szerepel a listában

#2. feladat: Mennyi lesz a számok összege?
osszeg = 0
for i in range(len(lista)):
    osszeg = osszeg + lista[i]
print(osszeg)

#3. feladat: Mi lesz a számok maximuma, és hanyadik lesz az?
maximum = lista[0] # Fontos, hogy listabeli elemet adjunk meg kezdőértéknek
maximumhely = 0
for i in range(len(lista)):
    if lista[i]>maximum: # Ha találunk egy olyan elemet, ami nagyobb mint a jelenleg eltárol maximumunk
        maximum = lista[i] # akkor eltároljuk az értékét
        maximumhely = i # és a pozícióját is
print(f"A legnagyobb elem a {maximum}, ami a {maximumhely}. helyen van a listában") # Kiírjuk fstringel

#4. feladat: Adjunk hozzá mindegyik számhoz 1-et
for i in range(len(lista)):
    lista[i] = lista[i] + 1
print(lista) # Kiiratjuk ellenőrzésnek
```

## Függvények / eljárások
Ha sokszor használunk egy kódrészletet, és nem akarjuk újra megírni, akkor függvényeket vagy eljáráosak használunk.

A függvénynek ***van visszatérési értéke***, míg az eljárásnak ***nincs***.

Használata:
```python
def fuggveny(parameter1, parameter2, ..., parameterN):
    # utasítások
    return visszateresi_ertek
```
```python
def eljaras(parameter1, parameter2, ..., parameterN):
    # utasítások
```

- Írjunk olyan **függvényt**, ami összead két számot.

    ```python
    def osszead(a, b):
        return a + b

    print(osszead(5,3)) # Függvénymeghívás, kiírja 5 és 3 összegét
    ```

    Fontos, hogy a `def`-el megadjuk hogy mit csináljon a függvény, alapjáraton nem fog lefutni, ehhez meg kell hívin a függvényt

- Írjunk olyan **eljárást**, ami paraméterként kér egy szöveget és egy számot, majd kiírja a szöveget annyiszor, amilyen szmot megadott
   
    ```python
    def kiiratas(szoveg, szam):
        for i in range(szam):
            print(szoveg)
    
    kiiratas("mitokondrium", 3) # Eljárás meghívása
    
    """
    mitokondrium
    mitokondrium
    mitokondrium
    """
    ```

## Globális és lokális változók

```python
def eljaras():
    szo = "banán" # Lokális változó
    print(szo)

szo = "alma" # Globális változó
eljaras() # banán
print(szo) # alma
```

Tehát az eljáráson kívüli rész nem fogja látni, hogy a `szo` változót felülírtuk `banán`-ra, mert ez egy lokális változó. Szóval az eljárás meghívása után a `szo` értéke még mindig `alma` lesz

- Írjunk egy eljárást, ami kicseréli két változó tartalmát

    ```python
    # Fontos, hogy ne adjunk meg paramétert, mert akkor nem fogja ténylegesen kicserélni a két változó tartalmát
    def csere(): 
        global a # A global kulcsszóval tudunk hozzáférni függvényen belül egy globális változóhoz
        global b

        temp = a
        a = b
        b = temp
    
    a = "alma"
    b = "banán"
    print(a,b) # alma, banán
    csere()
    print(a,b) # banán, alma
    ```
> A `global`-t nem hiszem hogy kérik emelten, egy feladatot nem láttam, ahol használni kellet, csak az a lényeg hogy tudd mi a különbség a globális és a lokális változó között, szóbelin megkérdezhetik.

## Házi

1. Adott egy lista:
    `lista = [10, 20, 50, 90, 0, 30, 40]`

    - Írasd ki, hogy hány szám van a listában.
    - Mennyi lesz a számok összege?
    - Mennyi lesz a számok átlaga?
    - Mi lesz a legnagyobb elem, és hanyadik?
    - Mi lesz a legkisebb elem, és hanyadik?
    - Rendezd le a listát
    
    Ha lefuttatod a programot így nézzen ki a kimenet:


    ```
    Összesen 7 szám van a listában.
    A számok összege: 240
    A számok átlaga: 34,285714285
    A legnagyobb elem a 90, ami a(z) 4. helyen van.
    A legkisebb elem a 0, ami a(z) 5. helyen van.
    A rendezett lista: 0 10 20 30 40 50 90
    ```
    > Pythonban 0-tól kezdődik a számozás, de emberi alakban kell kiiratni, tehát 1-től kezdődjön, ez pozíciónál fontos. 

    > Rendezett lista kiiratásánál ne felejtsd el az `end`-et a `print`-nél

2. Írj egy olyan **függvényt**, ami kiszámolja két elem szorzatát!
3. Írj egy olyan **eljárást**, ami paraméterként kér két számot: egy kisebbet és egy nagyobbat. Az eljárásnak ki kell írnia a számokat a legkisebbtől a legnagyobbig, mindkét számot beleértve.

    Vagyis:
    -   ```
        kiirat(5,12)
        ```
        Kimenet:

        ```
        5 6 7 8 9 10 11 12
        ```
        ---
    -   ```
        kiirat(-5,5)
        ```
        Kimenet:

        ```
        -5 -4 -3 -2 -1 0 1 2 3 4 5
        ```
