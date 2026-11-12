---
title: Jogosultságok
description: TODO
---

# Jogosultságok és rendszerintegráció

## Foreground lokáció hozzáférés elfogadása első alkalmazás megnyitásakor

| Lépés | GIVEN | WHEN | THEN |
|:---:|---|---|---|
| **1** | a felhasználó frissen autentikált és első alkalommal nyitja meg az alkalmazást | az alkalmazás a térkép oldalra navigál | megjelenik egy modális ablak, amely a foreground lokáció hozzáférést kéri |
| **2** | a lokációs engedélykérő modál megjelent | a felhasználó az elfogadás opcióra kattint | a modál eltűnik és megjelenik a natív rendszer szintű engedélykérő ablak |
| **3** | a natív lokációs engedélykérő ablak megjelent | a felhasználó engedélyezi a foreground lokáció hozzáférést | az engedély megadásra kerül és az alkalmazás visszatér a térkép nézetre |
| **4** | a foreground lokáció engedélyezve van | az alkalmazás aktív állapotban van | a start tracking gomb aktívvá válik a térképen és a folyamat sikeresen lezárul |

## Foreground lokáció hozzáférés megtagadása első megnyitáskor, majd újrakérés következő megnyitáskor

| Lépés | GIVEN | WHEN | THEN |
|:---:|---|---|---|
| **1** | a felhasználó frissen nyitja meg az alkalmazást és a térkép oldal betölt | megjelenik a foreground lokációt kérő modál | a felhasználó dismisseli vagy cancelre kattint |
| **2** | a felhasználó nem fogadta el a lokációt | nem történik elfogadás | natív engedélykérő ablak nem jelenik meg |
| **3** | a felhasználó bezárja az alkalmazást | újranyitja azt | az alkalmazás újra megjeleníti a foreground lokáció engedélykérő modált |

## Notification hozzáférés elfogadása

| Lépés | GIVEN | WHEN | THEN |
|:---:|---|---|---|
| **1** | a felhasználó autentikált és már reagált a foreground lokáció kérésre | az alkalmazás notification hozzáférést kér egy modálban | a felhasználó látja az elfogadás/elutasítás opciókat |
| **2** | a notification modál megjelent | a felhasználó elfogadja | megjelenik a natív notification engedélykérő ablak |
| **3** | a natív engedélykérő megjelent | a felhasználó engedélyezi | a notification hozzáférés megadásra kerül |

## Notification hozzáférés megtagadása, majd többszöri használat után újrakérés

| Lépés | GIVEN | WHEN | THEN |
|:---:|---|---|---|
| **1** | a felhasználó autentikált és a notification modál megjelent | a felhasználó elutasítja a notification hozzáférést | a hozzáférés nem kerül megadásra |
| **2** | a felhasználó többször újranyitja az alkalmazást (3 vagy 5 alkalom) | az alkalmazás újra megnyílik | egyszer ismét megjelenik a notification engedélykérő modál |

## Lokáció hozzáférés kérése után a felhasználó trackelést indít, majd background lokáció hozzáférés elfogadása

| Lépés | GIVEN | WHEN | THEN |
|:---:|---|---|---|
| **1** | a felhasználó elfogadta a foreground lokáció hozzáférést | a térképen rákattint a start tracking gombra | megjelenik egy modál a background lokáció szükségességéről |
| **2** | a background lokációt kérő modál megjelent | a felhasználó elfogadja | az alkalmazás a natív beállítási felületre navigál |
| **3** | a natív engedélykérő megjelent | a felhasználó engedélyezi a background lokációt | a hozzáférés megadásra kerül és a trackelés teljes funkcionalitással működik |

## Background lokáció hozzáférés megtagadása esetén az alkalmazás működik, de háttérben nem számol, figyelmeztető megjelenik

| Lépés | GIVEN | WHEN | THEN |
|:---:|---|---|---|
| **1** | a felhasználó elfogadta a foreground lokációt | rákattint a start tracking gombra | megjelenik a background lokációt kérő modál |
| **2** | a modál megjelent | a felhasználó elutasítja a background lokációt | megjelenik egy figyelmeztető modál |
| **3** | a figyelmeztető modál megjelent | a felhasználó folytatja | a trackelés elindul, de háttérben nem működik |
| **4** | a felhasználó többször újraindítja a trackelést | a start gombra kattint | újra megjelenik a modál, amely lehetőséget ad beállítások megnyitására vagy folytatásra |

## Trackelés elindítása és túra sikeres végrehajtása (happy path)

| Lépés | GIVEN | WHEN | THEN |
|:---:|---|---|---|
| **1** | a felhasználó autentikált és minden szükséges lokációs engedélyt elfogadott | rákattint a start tracking gombra | megjelenik a bottom sheet a metrikákkal |
| **2** | a trackelés elindult | a felhasználó halad a túraútvonalon | a megtett útvonal kirajzolódik a térképen |
| **3** | a trackelés folyamatban van | a felhasználó megnyomja a pause gombot | megjelenik egy összesítő (hike review) modál |
| **4** | az összesítő modál megjelent | a felhasználó megadja a túra nevét és hosszú nyomással befejezi | a túra mentésre kerül és az alkalmazás visszajelzést ad a sikeres mentésről |

## Background lokáció hozzáférés félrekattintása natív modálon, majd figyelmeztető kezelése

| Lépés | GIVEN | WHEN | THEN |
|:---:|---|---|---|
| **1** | a felhasználó elfogadta a foreground lokációt és a térképen van | rákattint a start tracking gombra | megjelenik a background lokációt kérő modál |
| **2** | a background lokáció modál megjelent | a felhasználó elfogadja és megjelenik a natív engedélykérő | a felhasználó nem ad teljes hozzáférést (félrekattint / nem megfelelő opciót választ) |
| **3** | a felhasználó nem adott megfelelő background lokáció engedélyt | visszatér az alkalmazásba | megjelenik egy figyelmeztető modál, hogy a background tracking nem lett megfelelően beállítva |
| **4** | a figyelmeztető modál megjelent | a felhasználó az engedélyezés opciót választja | az alkalmazás a beállítások felületre navigál, ahol a hozzáférés módosítható |
| **5** | a figyelmeztető modál megjelent | a felhasználó úgy dönt, hogy engedély nélkül folytatja | a trackelés elindul, de background működés nélkül |

## Notification permission elfogadása utáni viselkedés

| Lépés | GIVEN | WHEN | THEN |
|:---:|---|---|---|
| **1** | a felhasználó elfogadta a notification hozzáférést | spontán elindít egy túrát (start tracking) | a trackelés elindul |
| **2** | a trackelés aktív | az alkalmazás fut | megjelenik egy notification bubble, amely jelzi, hogy a túra folyamatban van és aktív |
