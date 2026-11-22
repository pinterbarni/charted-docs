---
description: A fejlesztés során felmerült technikai nehézségek és megoldásaik, az Expo és MapLibre korlátaitól az autentikáción át az éles telepítésig.
---

# Nehézségek és megoldások

A fejlesztés során több technikai és környezeti kihívással kellett szembenézni.

--8<-- "web-modification.hu.md"

## Fejlesztői gép és infrastruktúra { data-toc-label="Gép és infrastruktúra" }

A fejlesztés hardveres és üzemeltetési alapjai már az első napoktól korlátozták a haladás tempóját.

### Kifagyó fejlesztői gép { data-toc-label="Kifagyó gép" }

Az egyik legjelentősebb problémát a fejlesztői infrastruktúra korlátozott erőforrásai jelentették. A gép, amin az alkalmazást fejlesztettem, legalább napi egyszer kifagyott, mert nem bírta egyszerre futtatni a kódbázisokat a fejlesztés első napjaitól. Fél éve kezdtem el Linuxon fejleszteni, a Windows esetében az operációs rendszer lelassult, viszont itt csak az újraindítás oldotta meg a problémáimat.

### Headless Raspberry Pi szerverek tapasztalat nélkül { data-toc-label="Headless Raspberry Pi" }

Az éles környezet többek között két headless Raspberry Pi volt, melyekkel CLI-n keresztül dolgoztam, tapasztalat híján, ami eleinte nehezítette a szakdolgozat alakulását.

## Expo és fejlesztői buildek

Az Expo kényelmes eszközkészlete a natív modulok miatt csak részben volt kihasználható, ami a buildelés minden lépését lassabbá és tervezettebbé tette.

### Expo Go helyett fejlesztői build { data-toc-label="Fejlesztői build" }

A mobilalkalmazás fejlesztése során kihívást jelentett az Expo környezet korlátozottsága. A szükséges *MapLibre* natív modulok miatt az alkalmazás nem volt futtatható *Expo Go* környezetben (mely jóval segítette volna a munkámat), ezért fejlesztői build (development build) használata vált szükségessé. Ez növelte a fejlesztési komplexitást, azonban lehetővé tette a szükséges funkcionalitások implementálását.

### A fejlesztői build és az Expo Go különbsége { data-toc-label="Build vs Expo Go" }

A fejlesztői build és az Expo Go közötti fő különbség, hogy a fejlesztői build tartalmazza az összes natív modult (beleértve a MapLibre-t), így az összes funkció tesztelhető, míg az Expo Go csak az Expo SDK által előre csomagolt modulokat támogatja, a kódváltozások azonban mindkét esetben hot reload-dal jelennek meg.

### Lassú helyi buildek és az EAS korlátai { data-toc-label="EAS korlátok" }

A fejlesztői buildeket Android Studio-val és Xcode-dal lehetett elkészíteni, melyekből csak egy 2015-ös MacBookot kaptam kölcsön, melynek a sebessége nagyon alacsony, így EAS buildekre kényszerültem. A korlátozott *EAS* sávszélesség miatt pedig előre kellett tervezni minden egyes fejlesztési lépést, néhol csak harminc percet, néhol három órát vett igénybe.

### Elfogyott ingyenes buildkeret { data-toc-label="Buildkeret" }

A havi szinten elérhető ingyenes fejlesztői buildek keretét átléptem, így elő kellett fizetni a szolgáltatásra.

### Kifagyó fejlesztői környezet { data-toc-label="Kifagyó környezet" }

A fejlesztői környezet a fent említettek miatt előfordult, hogy kifagyott, szerencsére a fejlesztői környezet újratöltésekor, mely éles környezetben nem fordulhat elő.

### Újraindítás frissítések után { data-toc-label="Újraindítások" }

A fejlesztés során emellett az is problémát okozott, hogy a fejlesztői alkalmazás bizonyos frissítések után kifagyott, és újra kellett indítani. Ilyen esetekben nemcsak a mobilalkalmazást, hanem a fejlesztői környezetet (development server) is újra kellett indítani, ami jelentősen lassította a fejlesztési folyamatot.

## MapLibre

A térképes megjelenítés az alkalmazás központi eleme, így a MapLibre körüli problémák közvetlenül a fő funkciókat érintették.

### A felhasználói korong újrarenderelése { data-toc-label="Felhasználói korong" }

A térképes megjelenítés során a MapLibre használata további kihívásokat hozott. A felhasználó korong újrarenderelését lokációs hozzáférés után csak segítséggel tudtam megoldani.

### Expo SDK és MapLibre verzióütközés { data-toc-label="Verzióütközés" }

A térképes megjelenítés során további jelentős kihívást okozott a MapLibre és az Expo SDK verziók közötti inkompatibilitás. A fejlesztés idején az Expo SDK 55 volt a legfrissebb verzió, míg a MapLibre esetében a 11-es verzió számított aktuálisnak, azonban ez még béta állapotban volt.

### Kényszerű áttérés a béta verzióra { data-toc-label="Béta verzió" }

A stabil kompatibilitás az Expo 54 és a MapLibre 10 között volt biztosított, a MapLibre 11-es verziójának még csak a béta verziója volt elérhető. Ennek következtében technikailag az Expo 55 használata mellett a MapLibre 10-es verzió alkalmazása lett volna indokolt, azonban mivel a fejlesztés már hónapok óta Expo 55-re épült, visszalépésre nem volt lehetőség.

### Eltérő dokumentáció { data-toc-label="Dokumentáció" }

Ezért a fejlesztés során a MapLibre 11 béta verziójának használata vált szükségessé, amely azonban (kevés, de) instabilitást és további nehézségeket hozott magával.

További problémát jelentett, hogy a MapLibre 11 béta verziójának dokumentációja volt elérhető a hivatalos weboldalon, míg a stabil 10-es verzió dokumentációja csak GitHubon, egy markdown fájlokból álló struktúrában volt megtalálható. Ez megnehezítette a megfelelő implementációt, mivel a hivatalos dokumentáció és a ténylegesen használt verzió között eltérés volt.

## Android eszköz és MIUI

A teszteléshez használt készülék gyártói rendszere több ponton eltért a natív Androidtól, ami a hibák forrásának azonosítását is nehezítette.

### Eltérés a natív Androidtól { data-toc-label="Eltérő viselkedés" }

A fejlesztés során használt Android eszköz egy Redmi készülék volt, amelyen MIUI operációs rendszer futott. A rendszer működése több esetben eltért a natív Android viselkedéstől, ami nehézségeket okozott a fejlesztés során.

### Elmaradó értesítések { data-toc-label="Értesítések" }

Előfordult, hogy az értesítési beállítások módosítása nem a várt módon működött, illetve bizonyos esetekben az alkalmazás nem küldött értesítéseket. Ennek hátterében a MIUI agresszív energiamenedzsmentje állt, amely a felhasználó számára nem minden esetben volt egyértelműen látható.

### Leállított háttérfolyamatok { data-toc-label="Háttérfolyamatok" }

További problémát jelentett, hogy a rendszer a háttérben futó alkalmazást időnként leállította az erőforrás-kezelés miatt, ami a valós idejű működést befolyásolta.

### Android emulátor a kiszámíthatóságért { data-toc-label="Emulátor" }

A problémák egy részének kezelésére Android emulátor használata vált szükségessé, amely kiszámíthatóbb és a natív Android viselkedéshez közelebb álló környezetet biztosított a fejlesztés és tesztelés során.

## Könyvtárak és fájlkezelés

A React Native ökoszisztéma könyvtárai és az Expo új API-jai nem mindig működtek együtt a várt módon.

### A Reanimated és a Victory Native konfliktusa { data-toc-label="Reanimated és Victory Native" }

Komoly problémát okozott a különböző React Native könyvtárak közötti verzióinkompatibilitás. A react-native-reanimated és a Victory Native könyvtárak között fellépő konfliktus miatt az eredetileg tervezett grafikon megjelenítés nem volt megvalósítható.

### Megbízhatatlan könyvtárellenőrzés Androidon { data-toc-label="Könyvtárellenőrzés" }

A fájlkezelés területén szintén nehézségek merültek fel az új expo-file-system API használata során. Az Android platformon a könyvtárak létezésének ellenőrzése nem működött megbízhatóan, ami hibás működéshez vezetett. A problémát egy try-catch alapú megközelítéssel sikerült kezelni, amely a könyvtár létrehozását biztonságosan kezeli.

## Autentikáció

Az autentikáció a projekt egyik legösszetettebb része volt, amely a fejlesztés utolsó napjaiig finomításra szorult.

### PKCE folyamat és visszatérés jelszócsere után { data-toc-label="PKCE és jelszócsere" }

Az autentikáció integrációja során a PKCE alapú OAuth folyamat megvalósítása jelentett komplex feladatot. Az expo-auth-session könyvtár segítségével sikerült egy stabil megoldást kialakítani, amelyet token frissítési mechanizmussal egészítettem ki az API kliensben. Az autentikációs folyamat az utolsó napokban is fejtörést okozott, az utolsó előtti napokban sikerült elérnem, hogy elfelejtett jelszó után be tudjunk lépni az alkalmazásba manuális elnavigálás nélkül, a felhasználó szempontjából a legkényelmesebb módon.

## Hálózat

A fejlesztéshez használt eszközök több hálózat között oszlottak meg, ami nehezen észrevehető kapcsolódási hibákat okozott.

### Kikapcsoló Tailscale a tesztelőtelefonon { data-toc-label="Tailscale" }

További kihívást jelentett a fejlesztési környezet hálózati szegmentáltsága, ahol a különböző eszközök nem mindig ugyanazon a hálózaton voltak elérhetők. Többször előfordult, hogy a kölcsön Android telefonon kikapcsolt a Tailscale, és nem esett le, mi a baj.

## Éles telepítés és konténerizáció { data-toc-label="Éles telepítés" }

Az éles környezet első indítása olyan különbségeket hozott felszínre, amelyek a fejlesztői környezetben nem jelentkeztek.

### Létre nem jött adatbázisséma { data-toc-label="Adatbázisséma" }

Az éles környezet első telepítése sem volt zökkenőmentes. A BFF és az adatbázis első indításakor a PostgreSQL séma nem jött létre automatikusan, mivel éles környezetben a TypeORM `synchronize` opció alapértelmezés szerint ki van kapcsolva. A megoldást a `DB_SYNCHRONIZE=true` környezeti változó ideiglenes beállítása jelentette az első indításkor, amely után a séma létrejött és a változó eltávolítható volt. A megoldást dokumentáltam.

### Későn felismert TLS követelmény { data-toc-label="TLS" }

A deployment során további nehézségek merültek fel. A rendszer méretéből adódóan bizonyos alapvető infrastruktúrális követelmények, például a TLS használat szükségessége a végpontok eléréséhez, nem kerültek azonnal figyelembevételre. Ez utólagos hibakeresést és konfigurációs módosításokat tett szükségessé.

### PostgreSQL image ARM architektúrán { data-toc-label="PostgreSQL ARM-on" }

Hasonlóan, a konténerizált környezet kialakítása során is adódtak problémák. A PostgreSQL szolgáltatás integrációja például csak késői fázisban került véglegesítésre, nem számoltam azzal, hogy community image-et kell keresnem, hogy ARM architektúrán beinduljon. Ez a Docker Compose konfiguráció utólagos módosítását igényelte.

## Fejlesztői eszközök

Nem csak az alkalmazás, hanem a fejlesztést és a dokumentálást támogató eszközök is okoztak problémákat.

### Lassuló LaTeX fordítás és sérült cache { data-toc-label="LaTeX" }

A szakdolgozat elkészítése során a LaTeX rendszer használata is kihívásokat hozott. A dokumentum méretének növekedésével a fordítási idő jelentősen megnőtt, és a `.aux` fájlok korrupciója miatt többször szükségessé vált a cache teljes törlése és újrafordítás.

### Inkompatibilis Bruno verziók { data-toc-label="Bruno" }

A fejlesztőkörnyezet kialakítása során cél volt, hogy minden eszköz VS Code-ból elérhető legyen. A Bruno VS Code kiterjesztés azonban eltérő verzión futott, mint a parancssori változat, és a két verzió eltérő formátumban írta a .bru fájlokat, így a kettő nem volt kompatibilis egymással. Végül a különálló Bruno alkalmazás használata mellett kellett dönteni, amely ismerősebb felületet és konzisztens fájlkezelést biztosított.

## Projekt scope és módszertan { data-toc-label="Scope és módszertan" }

A tágra szabott projekt scope és a választott módszertan együtt határozta meg a fejlesztés ütemét.

### Nagyvállalati jellegű scope { data-toc-label="Nagyvállalati scope" }

A projekt tervezése során a cél nem csupán egy front-end és back-end alkalmazás megvalósítása volt, hanem egy komplex, nagyvállalati jellegű rendszer kialakítása. Ennek részeként a fejlesztés magában foglalta a deployment folyamatokat, CI/CD megoldásokat, automatizált tesztelést, valamint a hálózati elérés és konfiguráció kérdéseit is. Ez a széles scope jelentősen növelte a projekt komplexitását, mivel nem csak az alkalmazáslogikára, hanem az azt körülvevő teljes infrastruktúrára is figyelmet kellett fordítani.

### Agilis tervből rétegenkénti megvalósítás { data-toc-label="Módszertan" }

A fejlesztési folyamat eredetileg agilis megközelítéssel indult, azonban a gyakorlatban több esetben inkább iterációk nélküli, réteghez kötött blokkokban történő megvalósítás valósult meg. Ennek oka részben az volt, hogy egyes technológiák mélyebb megértése előfeltétele volt a továbblépésnek, így a fejlesztés nem tudott minden esetben párhuzamosan haladni.

## Összegzés

Összességében elmondható, hogy a felmerülő problémák jelentős része a különböző technológiák integrációjából, a rendszer komplexitásából és a platformok közötti különbségekből adódott.