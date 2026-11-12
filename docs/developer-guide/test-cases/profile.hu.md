---
title: Profil
description: TODO
---

# Profil és felhasználói adatok

## Greenfield felhasználó első navigációja a profil oldalra

| Lépés | GIVEN | WHEN | THEN |
|:---:|---|---|---|
| **1** | a felhasználó frissen autentikált (greenfield) | a jobb alsó sarokban a profil ikonra kattint | az alkalmazás a profil oldalra navigál |
| **2** | a profil oldal megjelent | a felhasználó megtekinti az adatokat | a követők és követések száma 0, a megtett távolság 0, és a profil adatok üresek/alapértelmezettek |
| **3** | a felhasználó a profil oldalon van | a túrák szekciót megtekinti | „nincsenek még túrái” üzenet és egy call-to-action jelenik meg |
| **4** | a felhasználó a recently shared szekcióra navigál | megnyitja | más felhasználók túráit látja |
| **5** | a felhasználó az offline trails szekciót nyitja meg | nincs adat | „no offline trails” üzenet jelenik meg |

## Greenfield felhasználó túratervezés után navigál a profil oldalra

| Lépés | GIVEN | WHEN | THEN |
|:---:|---|---|---|
| **1** | a felhasználó már létrehozott egy túrát | a profil oldalra navigál | a túrák megjelennek a megfelelő szekcióban |
| **2** | a túrák listája megjelent | a felhasználó rákattint egy túrára | megjelenik a túra térképes nézete és metrikái |
| **3** | a felhasználó nem a fő listát használja | a More opcióra kattint | egy részletes listaoldalra navigál |

## Felhasználó más által trackelt túraútvonal megtekintése

| Lépés | GIVEN | WHEN | THEN |
|:---:|---|---|---|
| **1** | a felhasználó autentikált és a profil oldalon van | navigál egy másik felhasználó profiljára (pl. recently tracked, keresés vagy ismerősök listája alapján) | megjelenik a kiválasztott felhasználó profil oldala |
| **2** | a másik felhasználó profil oldala megjelent | a felhasználó kiválaszt egy túraútvonalat | a túra betöltődik térképen |
| **3** | a túra betöltődött | a felhasználó megtekinti | láthatóvá válnak a túra metrikái és adatai |

## Felhasználó saját túrái közül egy megtekintése

| Lépés | GIVEN | WHEN | THEN |
|:---:|---|---|---|
| **1** | a felhasználó rendelkezik saját túrával | a MyHikes szekcióra navigál | megjelennek a saját túrái |
| **2** | a lista megjelent | kiválaszt egy túrát | megjelenik a túra részletes nézete |

## Felhasználó túra megtekintése lista oldalról, további részletek megnyitása

| Lépés | GIVEN | WHEN | THEN |
|:---:|---|---|---|
| **1** | a felhasználó a profil oldalon van | a lista alján található további opcióra kattint | egy teljes listaoldalra navigál |
| **2** | a listaoldal megjelent | kiválaszt egy elemet | megnyílik a túra részletes nézete |

## Felhasználó megpróbálja megtekinteni követőit/követéseit, de még nincs adat

| Lépés | GIVEN | WHEN | THEN |
|:---:|---|---|---|
| **1** | a felhasználó profil oldalon van és nincs követője | rákattint a követők vagy követések számra | nem történik navigáció vagy változás |

## Felhasználó megtekinti követőit/követéseit és egy profilra navigál

| Lépés | GIVEN | WHEN | THEN |
|:---:|---|---|---|
| **1** | a felhasználó követ más felhasználókat | a profil oldalon a követésekre kattint | megjelenik a lista |
| **2** | a lista megjelent | kiválaszt egy felhasználót | megnyílik annak a profil oldala |

## Felhasználó megpróbálja módosítani a nevét sikertelenül

| Lépés | GIVEN | WHEN | THEN |
|:---:|---|---|---|
| **1** | a felhasználó a profil oldalon van | a profil kártyán a három pontra kattint és az edit display name opciót választja | megjelenik a szerkesztő felület |
| **2** | a szerkesztő felület megjelent | üres nevet ad meg | a mentés nem lehetséges |
| **3** | a felhasználó túl hosszú nevet próbál megadni | beírja | a rendszer nem engedi a limit fölé |

## Felhasználó sikeresen módosítja a nevét

| Lépés | GIVEN | WHEN | THEN |
|:---:|---|---|---|
| **1** | a felhasználó a név szerkesztő felületen van | megfelelő hosszúságú nevet ad meg és ment | a név frissül és egy visszajelző üzenet jelenik meg |

## Felhasználó módosítja a bióját

| Lépés | GIVEN | WHEN | THEN |
|:---:|---|---|---|
| **1** | a felhasználó a bio szerkesztő felületen van | módosítja a biót (akár üresre is) | a módosítás elmenthető |
| **2** | a felhasználó túl hosszú biót próbál megadni | beírja | a rendszer limitálja a hosszát |

## Felhasználó túl hosszú biót próbál megadni

| Lépés | GIVEN | WHEN | THEN |
|:---:|---|---|---|
| **1** | a felhasználó a bio szerkesztő felületen van | túl hosszú szöveget próbál beírni | a rendszer nem engedi a megengedett karakterszám fölé a bevitelt |

## Felhasználó megtekinti offline túráit, de még nincs elérhető adat

| Lépés | GIVEN | WHEN | THEN |
|:---:|---|---|---|
| **1** | a felhasználó autentikált és a profil oldalon van | az offline trails szekcióra navigál | „no offline trails” üzenet jelenik meg |

## Felhasználó offline túrát hoz létre, majd megtekinti azt

| Lépés | GIVEN | WHEN | THEN |
|:---:|---|---|---|
| **1** | a felhasználó autentikált és rendelkezik foreground lokáció hozzáféréssel | a térképen a create trail opcióra kattint | megnyílik a túraútvonal tervező felület |
| **2** | a tervező felület megjelent | a felhasználó POI-kat helyez el | a POI-k megjelennek a térképen |
| **3** | a POI-k elhelyezésre kerültek | a felhasználó a done gombra kattint | megjelenik egy összesítő nézet a térképpel és a POI-okkal |
| **4** | az összesítő nézet megjelent | a felhasználó elnevezi a túrát és menti | sikeres mentésről visszajelzés (toast) jelenik meg |
| **5** | a túra elmentésre került | a felhasználó a profil oldalra navigál | az offline vagy megfelelő szekcióban megjelenik a túra |
| **6** | a túra megjelent a listában | a felhasználó rákattint | meg tudja tekinteni a túra adatait és nézetét |
