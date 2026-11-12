---
description: TODO
---

# Szociális funkciók

## Másik felhasználó riportolása indoklás nélkül (sikertelen) { data-toc-label="Riport indoklás nélkül" }

| Lépés | GIVEN | WHEN | THEN |
|:---:|---|---|---|
| **1** | a felhasználó egy másik felhasználó profil oldalán van | a jobb felső sarokban a három pontra kattint | megjelenik a műveleti modál (report user / block user) |
| **2** | a műveleti modál megjelent | a felhasználó a report user opcióra kattint | megjelenik a riportáló felület |
| **3** | a riportáló felület megjelent | a felhasználó indoklás nélkül próbálja elküldeni a riportot | a riport nem küldhető el |

## Másik felhasználó riportolása sikeresen { data-toc-label="Sikeres riport" }

| Lépés | GIVEN | WHEN | THEN |
|:---:|---|---|---|
| **1** | a felhasználó egy másik felhasználó profil oldalán van | a három pontra kattint és kiválasztja a report user opciót | megjelenik a riportáló felület |
| **2** | a riportáló felület megjelent | a felhasználó megad egy indoklást és elküldi | a riport elküldésre kerül és sikeres visszajelző üzenet jelenik meg |

## Másik felhasználó többszöri riportolásának tiltása { data-toc-label="Ismételt riport tiltása" }

| Lépés | GIVEN | WHEN | THEN |
|:---:|---|---|---|
| **1** | a felhasználó már riportolt egy másik felhasználót | újra megpróbálja riportolni ugyanazt a felhasználót | a riport nem küldhető el újra |

## Másik felhasználó blokkolása { data-toc-label="Blokkolás" }

| Lépés | GIVEN | WHEN | THEN |
|:---:|---|---|---|
| **1** | a felhasználó egy másik felhasználó profil oldalán van | a három pontra kattint | megjelenik a műveleti modál |
| **2** | a modál megjelent | a block user opciót választja | megerősítő modál jelenik meg |
| **3** | a megerősítő modál megjelent | megerősíti a blokkolást | a felhasználó blokkolásra kerül és visszajelző üzenet jelenik meg |
| **4** | a blokkolás megtörtént | a felhasználó profilját újra megtekinti | a felhasználó blokkolt állapotban van és a tartalom nem elérhető |

## Blokkolt felhasználó feloldása a blokkolt listából { data-toc-label="Blokkolás feloldása" }

| Lépés | GIVEN | WHEN | THEN |
|:---:|---|---|---|
| **1** | a felhasználó már blokkolt legalább egy másik felhasználót | a térkép oldalon felhúzza a bottom sheet-et | megjelenik a „blokkolt felhasználók megmutatása” opció |
| **2** | a blokkolt felhasználók opció megjelent | rákattint | megjelenik a blokkolt felhasználók listája |
| **3** | a lista megjelent | kiválaszt egy blokkolt felhasználót | megnyílik annak a profil oldala |
| **4** | a blokkolt felhasználó profil oldala megjelent | rákattint az unblock gombra | a felhasználó feloldásra kerül és sikeres visszajelző üzenet jelenik meg |
| **5** | a felhasználó feloldásra került | a profil oldalon marad | lehetősége van azonnal bekövetni a felhasználót |

## Felhasználó blokkolása, aki már követ minket { data-toc-label="Követő blokkolása" }

| Lépés | GIVEN | WHEN | THEN |
|:---:|---|---|---|
| **1** | egy másik felhasználó követ minket | a profiljára navigálunk és blokkoljuk | a blokkolás megerősítésre kerül |
| **2** | a blokkolás megtörtént | a rendszer frissíti az adatokat | a követési kapcsolat mindkét irányban megszűnik |
| **3** | a kapcsolat megszűnt | a számokat megtekintjük | a mi követőink száma csökken egyel és a másik felhasználó követéseinek száma is csökken egyel |

## Felhasználó rákeres egy másik felhasználóra és beköveti { data-toc-label="Keresés és követés" }

| Lépés | GIVEN | WHEN | THEN |
|:---:|---|---|---|
| **1** | a felhasználó autentikált és a profil oldalon van | a keresés gombra kattint és beír egy felhasználónevet | megjelennek a keresési találatok |
| **2** | a találati lista megjelent | kiválaszt egy felhasználót | megnyílik annak a profil oldala |
| **3** | a felhasználó profil oldalon van | rákattint a follow gombra | a követés létrejön és a követők száma növekszik, valamint visszajelző üzenet jelenik meg |

## Felhasználó egy követett felhasználót kikövet { data-toc-label="Kikövetés" }

| Lépés | GIVEN | WHEN | THEN |
|:---:|---|---|---|
| **1** | a felhasználó már követ egy másik felhasználót | annak profil oldalára navigál | a follow gomb following állapotban van |
| **2** | a profil oldal megjelent | rákattint a following/unfollow gombra | a követés megszűnik és a gomb visszaáll follow állapotra |
| **3** | a követés megszűnt | a profil adatokat megtekinti | a követési szám csökken és visszajelzés jelenik meg |
