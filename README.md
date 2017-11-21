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

----------------------------------------------------------------------------------------------------
3D Grafika Beadandó Feladatok

1.) 3D Snooker!

A háttér legyen babakék, szerepeljen benne perspektív kamera és tartalmazza az alább felsorolt objektumokat. (5%) 3D alakzatok, amelyeket le kell gyártani a programban: (Legyen méretarányos minden egymáshoz képest!)
Snooker asztal: 4 láb (henger), asztallap (zöld téglatest), szegélyek (barna téglatest) (10%)
Textúraként jelenjenek meg a lyukak az asztallapon. (2%)
Snooker golyók: színes gömbök. (4%)
Dákó: keskenyedő henger, lezárt végekkel. (4%)
Funkciók:
Indulás: A fehér golyó legyen a kezdővonalon, a többi golyók (nem kell pontosan lemásolni a játékot!) pedig háromszög alakban a szokásos helyen. (5%)
Célzás: A fehér golyó pozíciója legyen egy koordinátarendszer középpontja, ami körül lehet forgatni a dákót (Balra és Jobbra billentyűk). A dákó és a fehér golyó távolsága legyen változtatható: minél nagyobb a távolság, később annál nagyobb sebességgel indul a golyó. (10%)
Fehér labda indítása: A dákó animáltan mozogjon indításkor. (5%) Miután elért a fehérhez, tűnjön el, a labda pedig induljon el a meghatározott irányba. (5%)
Ütközés golyók között: Két golyó ütközésénél elegendő körök ütközését figyelembe venni. Valamilyen módon pattanjanak le egymásról és folyásolják be egymás sebességét. Mindkettő veszítse sebessége 2%-át ütközéskor. (10%) 
Ütközés a szegélyek és a golyók között: A szegéllyel való ütközésnél, csak pattanjon le a mozgó golyó a falról, veszítve 3%-ot a sebességéből.  (5%)
EXTRA: A fizikai törvényekhez hű ütközés-megvalósítás esetén: +15%.
Golyók mozgása: Legyen egy sebesség-arányos csillapítás (surlódás az asztallal), ami lassítja a golyót. (5%)
Ha a játékos 10 másodpercig nem csinál semmit (nem mozgatja a dákót, se semmilyen interakciót nem végez), akkor automatikusan történjen meg az ütes a dákó aktuális pozíciójától függően. (10%) A visszaszámláló a GUI-n legyen megjelenítve (5%)  
Kameramozgás:
Amíg van golyó-mozgás az asztalon, egy CatmullRom splineon keringjen a kamera az asztal körül, a leggyorsabban mozgó golyót nézve. (10%)
Célzáskor a kamera First Person nézetben legyen a dákó és a játékos. (a kamera hozzá legyen fixálva). (5%)

Ponthatárok: 0-39%: 1; 40-54%: 2; 55-69%: 3; 70-84%: 4; 85-100+%: 5


2.) 3D Aszteroidák!

Forrás: http://en.wikipedia.org/wiki/Asteroids_%28video_game%29

Az alkalmazás indításakor jelenjen meg egy fekete háttér, a közepén egy űrhajóval és két aszteroidával! (5%) A feladatok csak akkor fogadhatóak el, ha az alakzatok 3D-sek.
Az alkalmazás működése közben legyenek láthatóak lövedékek (hengerek), aszteroidák (módosított, torzított gömbök) és egy űrhajó (tetraéder test és egyéb tetszőleges díszítés, https://hu.wikipedia.org/wiki/Tetra%C3%A9der). (5%) A különböző alakzatok eltérő színek segítségével legyenek kirajzolva (kitöltés ill. körvonalak)! (5%)
Megjegyzés: Ha körvonalakat használsz, valamennyire idézze az eredeti “retro” stílust!

(retro style)

Az játéktér az XZ síkon fekszik, tehát mind az aszteroidák, mind az űrhajó az XZ síkon mozog. Az űrhajót lehessen forgatni a jobbra, balra, fel és le billentyűk segítségével a megfelelő irányokba. (5%) Az űrhajó legyen képes előre haladni a jobb egérgomb segítségével. (5%) A szóköz billentyű lenyomására az űrhajó orrából szálljanak lövedékek nagyjából abba az irányba, amerre néz! (5%) Ha többet repültek már, mint 300 egység, semmisítse meg a lövedékeket a program. (5%) Az űrhajó oldalainak háromszögei közül legalább kettőt lásson mindig a kamera. A kamera kövesse az űrhajót mindig azonos távolságból! (5%) Különben, ha azt dinamikusan követi (nem statikus módon rögzített a kamera a térben az űrhajóhoz képest): +5%.

	Az aszteroidák alapja egy-egy gömbfelületről random mintavételezett (normális irányokban eltolt) torzított gömbfelület. Azaz, ha a gömb középpontjától 1 egységre volt egy pont, azt random el lehet tolni az alakzat generálásakor. (5%) Minden aszteroida különböző legyen és random sebességgel forogjanak a különböző irányokban! (5%) Az aszteroidák 3 méretben létezzenek, rendre 7, 6 és 5 “detailedness” felbontásban! (5%) A legnagyobb aszteroida 10 egység sugarú legyen, a kisebbek 7 illetve 4 egység. (5%)

A lövedékek különböző aszteroidákkal érintkezve semmisüljenek meg és a következőket váltsák ki:
Nagy aszteroida: essen 3 közepes aszteroidára, induljanak különböző irányokba! (5%)
Közepes aszteroida: essen 2 kicsi aszteroidára, repüljenek különböző irányokba! (5%)
Kicsi aszteroida: semmisüljön meg! (5%)
Az ütközést gömb (aszteroidát befoglaló gömb) és gömb (a hengert befoglaló gömb) érintkezésvizsgálatával oldd meg! (5%) Ha az asztoroidák távolabb repülnek mint 300 egység: semmisüljenek meg, és generálódjanak újak az űrhajó háta mögött, nem látható területen, a közelben. (5%)

	Tömegvonzás és fizikai szimuláció. Az űrhajó és az aszteroidák rendelkezzenek tömeggel. Ha egy aszteroida kisebb darabokra esik, a kezdeti tömeg osztódjon szét a darabok között! (5%) Az aszteroidák vonzzák egymást a tömegükkel arányosan minden iterációban! (5%) Az aszteroidák az űrhajóra is gyakoroljanak gravitációs erőhatást minden iterációban! (5%)

+10%: Legyenek egymást követő pályák, ahol egyre nagyobbak a tömegek, így egyre erősebb a gravitáció! Legyen pontszámláló is!
+5%: Legyen csillagokkal teli háttér, ami körülveszi a szemlélőt és az űrhajót!


Ponthatárok: 0-39%: 1; 40-54%: 2; 55-69%: 3; 70-84%: 4; 85-100+%: 5


megjegyzés: Hogy mindezt kényelemsen lehessen megvalósítani, minden tárgynak kell rendelkeznie valamilyen sebességgel (“Velocity”), pozícióval (“Position”) és gyorsulással (“Acceleration”). Minden megjelenítés (draw) előtt az előző megjelenítés óta eltelt idővel arányosan érdemes frissíteni (vagy úgym. integrálni) a pozíciót:
Position += Velocity * delta_time;


Hogy a különböző erőhatásokat is lehessen szimulálni testek között, érdemes előbb hasonlóan a “Accelerationt”-t is frissíteni. Minden iterációs lépés legelején összegezni kell az egy testre ható erőket (“Force”) és gyorsulásba (“Acceleration”) konvertálni őket (“erő alkalmazása”):
Acceleration = Force / Mass;


… majd magát a “Velocity”-t is integrálni idő szerint, mielőtt a “Position”-t frissítenénk azzal, tehát:
Velocity += Acceleration * delta_time;


Egy testre ható gravitációs erőt a következőképpen lehet kiszámolni:
nagyság(Force) = G * tömeg1*tömeg2 / Távolsaguk^2;
(A G egy konstans. Ezt növelve, vagy csökkentve befolyásolható az erőhatások erőssége!)

(A képletek csak segítségek, butított verzióik is elfogadhatóak!)

Sematikusan a draw() függvény belsejének egy része (ezt még lehet egyszerűsíteni is):
delta_time = …
background(0,0,0);
for each body A
A.Acceleration.x = 0;
A.Acceleration.y = 0;
A.Acceleration.z = 0;
for each body B
if(A == B) continue;
Force = ERŐ(A és B között, A-ból B-be mutató 2D vektor);
A.Acceleration += Force / A.mass;
A.Velocity += A.Acceleration * delta_time;
A.Position += A.Velocity * delta_time;
A.draw();


Ponthatárok: 0-39%: 1; 40-54%: 2; 55-69%: 3; 70-84%: 4; 85-100+%: 5




