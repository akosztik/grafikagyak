# grafikagyak
ELTE IK processing

gyakorlat anyaga:
http://vision.sztaki.hu/~danini


https://docs.google.com/document/d/1zThlwJ_6LSQq0fXjUeiYIawrdtK3U5lIFhgNaAGgrBw/edit#

2017-2018-1 Esti
2D Grafika Beadandó Feladatok

1.) 2D Rajzoló program!

Cél
2D primitívek rajzolása és transzformációja. Billentyű és egér-események kezelése.
Feladat
Az alkalmazás indításakor jelenjen meg egy világosszürkés hátterű rajzterület (2%). A felhasználónak erre kell tudnia különböző alakzatokat rajzolnia:
szakasz: A felhasználó a rajzterületen belül kattintva először a szakasz kezdőpontját, majd még egyszer kattintva a szakasz végpontját jelölheti ki. (4%)
ellipszis/kör: A felhasználó a rajzterületen belül kattintva először az ellipszis középpontját adhatja meg, majd adott középpontban jelenjen meg az alakzat. Amennyiben a felhasználó lenyomja a CTRL billentyűt a megjelenő alakzat legyen egy kör, aminek a sugara a kurzor távolsága a középponttól. A CTRL billentyű lenyomása nélkül egy ellipszis jelenik meg, melyen X tengely menti sugara az a kurzor távolsága a középponttól X tengely mentén, és ugyanígy az Y tengely menti sugár. A felhasználó újbóli kattintással jelölheti, hogy végzett a rajzolással. (10%)
téglalap: A felhasználó a canvasen belül kattintva először a téglalap első pontját, majd a másodikat tudja kijelölni (4%)
poligon: A felhasználó tetszőleges számú pontból (legalább 3) készíthet poligon olyan módon, hogy a sarokpontokat helyezheti el a színtéren. (5%)
tetszőleges görbült alakzat: A felhasználó egy poligont helyez el a színtéren, amelyre egy bezárt Catmull-Rom Spline-t illeszt a program. (10%)

Rajzolás módja:
Az alakzatok -és így a rajzolás módjának- kiválasztása rendre az 1, 2, 3 billentyűkkel történjen, a 0 billentyű kapcsolja ki a rajzolást! Abban az esetben ne jöjjön létre alakzat, hogy ha az adott alakzat rajzolása közben a felhasználó lenyomja a jobb egérgombot, vagy ha a 0 billentyűvel ki van kapcsolva a rajzolás (5%).

Lehessen a színt állítani. Ez a szín befolyásolja a következőnek létrehozandó alakzat kontúrjának a színét is (5%), illetve kör, és téglalap esetén a kitöltési színt (5%). Az aktuális kontúr és kitöltési színeket a program jelezze ki egy sematikus ábrával (pl. kör, aminek a körvonala és a területe a megfelelő színű) (5%) Az ábra mellett helyezkedjen el egy 9 színből álló paletta, tartalmazva a fekete és fehér színeket külön-külön kis téglalapok formájában. A téglalapokra kattintva lehessen állítani a színt! (5%) 
A felhasználó egy adott objektumra kattintva ki tudja azt jelölni és ez látszódjon is vizuálisan! (5%). A kijelölt objektumot tudja manipulálni:
mozgatni az bal egérgomb nyomvatartása közben (5%).
forgatni a jobb egérgomb nyomvatartása közben (5%).
skálázni egy tetszőleges tengely mentén a mindkét gomb nyomvatartása közben! (5%).
Az ‘U’ gomb lenyomásával a kijelölt alakzat minden más alakzat fölé kerül (képernyőből kifele mutató tengely szerint) (5%). A kijelölt alakzatot a ‘Delete’ billentyű lenyomásával lehet törölni (5%), és a ‘D’ billentyűvel duplikálni. Ilyenkor létrejön egy az adott alakzattal megegyező forma, de az adott alakzathoz képest kicsit eltolva, fedve annak egy részét. (5 %). 

Az elkészült rajzokat az ‘F’ betű segítségével lehessen fájlba kimenteni (5%). 

Pluszpontok / Extra:
A fájlba elmentett rajzot be lehessen tölteni, alakzatai szerkesztését pedig így folytatni (+10%). 

Ponthatárok: 0-39%: 1; 40-54%: 2; 55-69%: 3; 70-84%: 4; 85-100+%: 5


2.) 2D Játék (Angry Worms!)
Cél
2D primitívek rajzolása és transzformációja egy interaktív rendszerben. Billentyű és egér-események kezelése. Mindezt játékos töltettel!
Feladat
Az alkalmazás háttere legyen égszínkék (2%). A játék két emberi játékossal játszható. (5%) A játékmenet legyen körökre osztott, ahol egy-egy lövés után az ellenfél következik. A cél egymás “Hajítógépének” eltalálása. (5%) Ha ez bekövetkezik, a lövedéket hajító játékos nyer, ezt pedig szövegesen közli a program, majd bezárja magát 5 másodperc múlva (5%). A játék rendelkezzen a következő elemekkel, képességekkel:
Lövedékek: Formájukban emlékeztessenek valamilyen színes “kukac” formára (5%). Röppályájuk parabolikus legyen! (5%) A lövedék repülés közben forogjon! (5%)
Hajítógép: Emlékeztessen egy csúzli formára és a pálya szélétől 200 px-re legyen! (5%) A lövedék a csúzliban helyezkedjen el, célzáskor pedig animáltan mozogjon együtt vele! (5%) A csúzli gumija legyen piros! (5%) A célzás egérrel történjen: egy nyíl jelezze, hogy milyen irányban fog repülni a lövedék! (5%) A célzás elindításához a hajítógépre kell kattintani, majd egy bizonyos távolságra húzni a lövedéket. Az egérgombot felengedve a lövedék elrepül. A lövedék kezdősebességét a egér-húzás mértéke befolyásolja. (5%)
Pálya: Két 2D rétegből álljon: távoli dombok (5%), talaj (5%). A pálya mindig csak egy adott része látszódjon! (5%) A távoli dombok 2000 pixel széles textúra legyen, magassága a képernyőével azonos. (5%) A talaj a képernyő alsó ⅓-ig tartson és legyen 2500 pixel széles. A csúzlik alapja a talajban legyen. (5%) A pályát a nyíl billentyűk segítségével lehessen követni, ekkor a rétegek pedig egymás előtt folyamatosan csúszva mozogjanak. (A “szélesebb” rétegnek gyorsabb mozgás kell, hogy azonos idő alatt jussunk el a széléig, mint a “keskenynek”.) (5%) Ha a talajt éri a lövedék, a talaj változzon meg! (10%)
Minden játékosnak külön-külön 3 lövedéke van. Ha találat nélkül ér véget a játék, ezt írja ki a program! (3%)
Pluszpontok / Extra:
Becsapódás után a lövedék visszapattan még egyszer, újra parabolikus pályán. (15%)
A pályán dobozok helyezkednek el véletlenül, melyet eltalálva a következő körből kimarad az ellenfél. (5%)
Hatékony pálya-megjelenítéshez és módosításhoz (lövedék-becsapódások helye) használj Quadtree-t! (15%)

Ponthatárok: 0-39%: 1; 40-54%: 2; 55-69%: 3; 70-84%: 4; 85-100+%: 5


