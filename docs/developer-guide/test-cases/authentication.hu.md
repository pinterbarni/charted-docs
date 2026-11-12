---
title: Autentikáció
description: TODO
---

# Autentikáció és session kezelés

## Elfelejtett jelszó kérése, majd visszanavigálás az alkalmazás natív felületére

| Lépés | GIVEN | WHEN | THEN |
|:---:|---|---|---|
| **1** | az alkalmazás telepítve van és a felhasználó megnyitja | megjelenik a bejelentkezési felület | a felhasználó látja a bejelentkezés, regisztráció és elfelejtett jelszó opciókat |
| **2** | a felhasználó rendelkezik már fiókkal | az elfelejtett jelszó opcióra kattint | az alkalmazás egy webes felületre navigál |
| **3** | a webes jelszó visszaállító felület megjelent | a felhasználó megadja az email címét vagy felhasználónevét és megnyomja a submit gombot | a rendszer elküldi a jelszó visszaállító emailt |
| **4** | a felhasználó még a webes felületen van | a bal alsó sarokban található X gombbal visszanavigál | visszakerül az alkalmazás natív login felületére |
| **5** | a felhasználó megkapta az emailt | megnyitja és rákattint a benne található linkre | megjelenik az új jelszó megadására szolgáló felület |
| **6** | a jelszó megváltoztatás felülete megjelent | a felhasználó megadja az új jelszavát | a rendszer elmenti az új jelszót |
| **7** | a felhasználó visszajelzést kapott arról, hogy az új jelszó sikeresen elmentésre került | újranyitja az alkalmazást | a login felület jelenik meg |
| **8** | a felhasználó a login felületen van | rákattint a login gombra | az alkalmazás egy webes autentikációs felületre navigál, ahol megjelenik a login oldal |
| **9** | a webes login felület megjelent | a felhasználó megadja a felhasználónevét/email címét és az új jelszavát, majd bejelentkezik | az autentikáció sikeres és az alkalmazás a térkép oldalra navigál |
| **10** | a felhasználó a login folyamatban van | megadja a felhasználónevét/email címét és az új jelszavát, majd bejelentkezik | az autentikáció sikeres és az alkalmazás a térkép oldalra navigál |

## Elfelejtett jelszó kérése, majd autentikáció a redirect ablakon keresztül

| Lépés | GIVEN | WHEN | THEN |
|:---:|---|---|---|
| **1** | az alkalmazás telepítve van és a felhasználó megnyitja | megjelenik a bejelentkezési felület | a felhasználó látja a bejelentkezés, regisztráció és elfelejtett jelszó opciókat |
| **2** | a felhasználó rendelkezik már fiókkal | az elfelejtett jelszó opcióra kattint | az alkalmazás egy webes felületre navigál |
| **3** | a webes jelszó visszaállító felület megjelent | a felhasználó megadja az email címét vagy felhasználónevét és megnyomja a submit gombot | a rendszer elküldi a jelszó visszaállító emailt és a felület login nézetre vált |
| **4** | a felhasználó megkapta az emailt | megnyitja és rákattint a benne található linkre | megjelenik az új jelszó megadására szolgáló felület |
| **5** | a jelszó megváltoztatás felülete megjelent | a felhasználó megadja az új jelszavát | a rendszer elmenti az új jelszót |
| **6** | a felhasználó visszatér az alkalmazásba | a webes autentikációs felület még nyitva van és login állapotban van | meg tudja adni a felhasználónevét és az új jelszavát |
| **7** | a webes login felület megjelent | a felhasználó megadja a felhasználónevét/email címét és az új jelszavát, majd bejelentkezik | az autentikáció sikeres és az alkalmazás a térkép oldalra navigál |

## Regisztráció, majd sikeres bejelentkezés

| Lépés | GIVEN | WHEN | THEN |
|:---:|---|---|---|
| **1** | az alkalmazás telepítve van és a felhasználó megnyitja | megjelenik a bejelentkezési felület | a felhasználó látja a bejelentkezés, regisztráció és elfelejtett jelszó opciókat |
| **2** | a felhasználó a login felületen van | rákattint a regisztráció gombra | az alkalmazás egy webes regisztrációs felületre navigál |
| **3** | a webes regisztrációs felület megjelent | a felhasználó megadja a felhasználónevét, jelszavát, jelszó megerősítést, email címét, keresztnevét és vezetéknevét (minden mező kötelező) | a mezők kitöltésre kerülnek |
| **4** | minden szükséges adat megadásra került | a felhasználó rákattint a regisztráció gombra | a rendszer létrehozza a felhasználót és az alkalmazás a térkép oldalra navigál |
| **5** | a felhasználó sikeresen regisztrált | az alkalmazás betölt | a felhasználó autentikált állapotban van és a térkép oldalt látja |

## Sikeres autentikáció után alkalmazás bezárása, majd újranyitás után autentikált állapot megmarad

| Lépés | GIVEN | WHEN | THEN |
|:---:|---|---|---|
| **1** | a felhasználó sikeresen autentikálta magát és a térkép oldalon van | bezárja az alkalmazást | az alkalmazás leáll |
| **2** | az alkalmazás korábban bezárásra került | a felhasználó újranyitja az alkalmazást | az alkalmazás a térkép oldalon tölt be és a felhasználó autentikált állapotban marad |

## Kijelentkezés az alkalmazásból

| Lépés | GIVEN | WHEN | THEN |
|:---:|---|---|---|
| **1** | a felhasználó be van jelentkezve és a térkép oldalon van | a profil oldalra navigál | megjelenik a saját profil felülete |
| **2** | a felhasználó a profil oldalon van | a felhasználói kártyán a három pontra kattint | megjelenik egy modális ablak |
| **3** | a modális ablak megjelent | a felhasználó kiválasztja a kijelentkezés opciót | az alkalmazás kijelentkezteti a felhasználót és visszanavigál a login felületre |

## Offline állapotban a már autentikált felhasználó bejelentkezve marad, az alkalmazás megnyitható

| Lépés | GIVEN | WHEN | THEN |
|:---:|---|---|---|
| **1** | a felhasználó sikeresen autentikálta magát és a térkép oldalon van | az alkalmazást bezárja | az alkalmazás leáll |
| **2** | az eszköz offline állapotban van | a felhasználó újranyitja az alkalmazást | az alkalmazás a térkép oldalon tölt be és a felhasználó autentikált állapotban marad |
