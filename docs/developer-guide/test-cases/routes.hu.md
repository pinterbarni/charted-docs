---
description: TODO
---

# Túraútvonal és core funkciók

## Túraútvonal tervezése, majd betöltése { data-toc-label="Tervezés és betöltés" }

| Lépés | GIVEN | WHEN | THEN |
|:---:|---|---|---|
| **1** | a felhasználó autentikált és a térkép oldalon van | a create trail gombra kattint | megjelenik a POI lista üres állapotban |
| **2** | a POI lista megjelent | a felhasználó POI hozzáadására kattint | megjelenik a location választó felület |
| **3** | a location választó aktív | a felhasználó elhelyez egy markert | megjelenik a POI típus választó |
| **4** | a POI kiválasztás megtörtént | a felhasználó megerősíti | a POI megjelenik a térképen és a listában |
| **5** | a POI lista tartalmaz elemet | a felhasználó törli azt | a POI eltűnik |
| **6** | a felhasználó új POI-t ad hozzá és done-ra kattint | az összesítő oldal megjelenik | láthatóak a POI-k |
| **7** | a felhasználó elnevezi a túrát és menti | a mentés megtörténik | a túra elmentődik és megjelenik az offline listában |
| **8** | a túra elmentésre került | a felhasználó megnyitja | láthatóak a POI-k és elérhető a retrack opció |
| **9** | a felhasználó retrack gombra kattint | a térkép nézet betölt | a POI-k megjelennek a térképen, de a lista üres |

## Túraútvonal bejárása { data-toc-label="Bejárás" }

| Lépés | GIVEN | WHEN | THEN |
|:---:|---|---|---|
| **1** | a felhasználó autentikált és rendelkezik lokáció engedélyekkel | rákattint a start tracking gombra | a trackelés elindul és megjelenik a bottom sheet |
| **2** | a trackelés aktív | a felhasználó mozog | az útvonal kirajzolódik |
| **3** | a trackelés aktív | a felhasználó POI-t helyez el | a POI megjelenik a térképen és eltárolódik |
| **4** | a trackelés aktív | a felhasználó pause-t nyom | megjelenik az összesítő oldal POI-okkal együtt |
| **5** | az összesítő oldal megjelent | a felhasználó elnevezi és menti | a túra sikeresen mentődik |

## Bejárt túraútvonal sikertelen elnevezése { data-toc-label="Bejárt túra elnevezése" }

| Lépés | GIVEN | WHEN | THEN |
|:---:|---|---|---|
| **1** | a felhasználó az összesítő oldalon van | név nélkül próbálja menteni a túrát | hiba toast jelenik meg és nem mentődik |

## Túraútvonal tervezés elvetése { data-toc-label="Tervezés elvetése" }

| Lépés | GIVEN | WHEN | THEN |
|:---:|---|---|---|
| **1** | a felhasználó elkezdett túrát tervezni | cancel gombra kattint | megerősítő modál jelenik meg |
| **2** | a megerősítő modál megjelent | a felhasználó megerősíti | minden adat törlődik és visszatér a térkép nézet |

## Tervezett túraútvonal sikertelen elnevezése { data-toc-label="Tervezett túra elnevezése" }

| Lépés | GIVEN | WHEN | THEN |
|:---:|---|---|---|
| **1** | a felhasználó az összesítő oldalon van | név megadása nélkül próbál menteni | hiba toast üzenet jelenik meg és nem mentődik el |

## Recenter gomb működése különböző nézetekben { data-toc-label="Recenter nézetenként" }

| Lépés | GIVEN | WHEN | THEN |
|:---:|---|---|---|
| **1** | a térkép különböző zoom/nézet állapotokban van | a felhasználó recenter gombra kattint | a kamera visszaáll a felhasználóra |
| **2** | különböző nézetek aktívak | recenter történik | a megfelelő UI elemek jelennek meg (pl. csak gauge vagy POI-k is) |

## Spontán túraútvonal indítása és POI kezelés { data-toc-label="Spontán túra és POI" }

| Lépés | GIVEN | WHEN | THEN |
|:---:|---|---|---|
| **1** | a felhasználó autentikált és rendelkezik szükséges lokáció engedélyekkel | rákattint a start tracking gombra | a trackelés elindul és az útvonal rajzolódik |
| **2** | a trackelés aktív | a felhasználó POI-t helyez el | a POI megjelenik a térképen a megtett útvonal mentén |
| **3** | a trackelés során POI-k kerültek elhelyezésre | a felhasználó pause gombra kattint | megjelenik az összesítő oldal és az útvonal adatai láthatók |
| **4** | az összesítő oldal megjelent | a felhasználó menti a túrát | a túra elmenthető és a rendszer képes a POI-k kezelésére |

## Recenter gomb működése { data-toc-label="Recenter gomb" }

| Lépés | GIVEN | WHEN | THEN |
|:---:|---|---|---|
| **1** | a felhasználó autentikált és rendelkezik foreground lokáció hozzáféréssel | a térképen elforgatja a kamerát, eltávolodik a saját pozíciójától és megváltoztatja a zoom szintet | a térkép nem a felhasználó pozíciójára van középre igazítva |
| **2** | a térkép el van mozdítva és el van forgatva, el van zoomolva | a felhasználó rákattint a recenter gombra | a kamera animálva visszaáll a felhasználó pozíciójára és északi tájolású lesz, zoom szintet tartva |

## Elfelejtett leállítás notifikáció { data-toc-label="Elfelejtett leállítás" }

| Lépés | GIVEN | WHEN | THEN |
|:---:|---|---|---|
| **1** | a felhasználó elindít egy saját maga által trackelt túrát | a trackelés folyamatban van | az alkalmazás méri a mozgást |
| **2** | a felhasználó felszáll a 212A, 153 vagy 154-es buszra és elindul az ELTE Informatika kara felé | a sebessége egy bizonyos határ fölé nő (kb. 15 m/s fölött) | az alkalmazás egy notifikációt küld |
| **3** | a notifikáció megjelenik | a felhasználó megtekinti | az üzenet figyelmezteti, hogy lehet, hogy elfelejtette leállítani a trackelést (pl. tömegközlekedés használata esetén) |

## Bejárt túraútvonal törlése { data-toc-label="Bejárt túra törlése" }

| Lépés | GIVEN | WHEN | THEN |
|:---:|---|---|---|
| **1** | a felhasználó rendelkezik legalább egy bejárt túrával | a profil oldalon a túrára kattint | megjelenik a túra részletes nézete |
| **2** | a részletes nézet megjelent | a felhasználó a törlés opcióra kattint | megerősítő modál jelenik meg |
| **3** | a megerősítő modál megjelent | a felhasználó megerősíti a törlést | a túra törlődik és visszajelző üzenet jelenik meg |
| **4** | a törlés megtörtént | a felhasználó visszanavigál a profil oldalra | a törölt túra már nem jelenik meg a listában |

## Tervezett túraútvonal törlése { data-toc-label="Tervezett túra törlése" }

| Lépés | GIVEN | WHEN | THEN |
|:---:|---|---|---|
| **1** | a felhasználó rendelkezik legalább egy elmentett tervezett túraútvonallal | a profil oldalon az offline szekción belül a túrára kattint | megjelenik a tervezett túra részletes nézete |
| **2** | a részletes nézet megjelent | a felhasználó a törlés opcióra kattint | megerősítő modál jelenik meg |
| **3** | a megerősítő modál megjelent | a felhasználó megerősíti a törlést | a fájl törlődik a készülékről és visszajelző üzenet jelenik meg |
| **4** | a törlés megtörtént | a felhasználó visszanavigál a profil oldalra | a törölt túra már nem jelenik meg az offline listában |
