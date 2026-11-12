---
title: Beállítások
description: A mértékegység váltásának és megőrzésének, valamint a sötét mód automatikus és manuális beállításának tesztesetei.
---

# Beállítások és preferenciák

## Mértékegység váltás általános használat közben { data-toc-label="Mértékegység váltás" }

| Lépés | GIVEN | WHEN | THEN |
|:---:|---|---|---|
| **1** | a felhasználó autentikált és az alkalmazásban van | a bottom sheet-en a mértékegységet metrikusról imperialra váltja | az értékek minden felületen átváltanak |
| **2** | a mértékegység át lett állítva | a felhasználó a profil oldalra navigál | a korábbi túrák és statisztikák is az új mértékegységben jelennek meg |

## Mértékegység váltás aktív trackelés közben { data-toc-label="Mértékegység trackelés közben" }

| Lépés | GIVEN | WHEN | THEN |
|:---:|---|---|---|
| **1** | a felhasználó aktívan trackel egy túrát | a mértékegységet átváltja | a megjelenített metrikák azonnal átalakulnak az új egységre |

## Mértékegység beállítás perzisztenciája { data-toc-label="Mértékegység megőrzése" }

| Lépés | GIVEN | WHEN | THEN |
|:---:|---|---|---|
| **1** | a felhasználó megváltoztatta a mértékegységet | bezárja az alkalmazást | az alkalmazás leáll |
| **2** | az alkalmazás újraindul | a felhasználó megnyitja | a mértékegység beállítás megmarad és az értékek ennek megfelelően jelennek meg |

## Dark mode automatikus mód működése { data-toc-label="Dark mode automatikus" }

| Lépés | GIVEN | WHEN | THEN |
|:---:|---|---|---|
| **1** | az automatikus mód be van kapcsolva | a felhasználó megtekinti a beállításokat | a light és dark opciók nem módosíthatók |
| **2** | az automatikus mód aktív | a rendszer témája változik | az alkalmazás automatikusan követi azt |

## Dark mode manuális beállítása és megőrzése { data-toc-label="Dark mode manuális" }

| Lépés | GIVEN | WHEN | THEN |
|:---:|---|---|---|
| **1** | az automatikus mód ki van kapcsolva | a felhasználó manuálisan light vagy dark módot választ | az alkalmazás átvált a kiválasztott módra |
| **2** | a mód át lett állítva | az alkalmazást bezárja és újranyitja | a kiválasztott mód megmarad |

## Dark mode rendszerkövetés tesztelése { data-toc-label="Dark mode rendszerkövetés" }

| Lépés | GIVEN | WHEN | THEN |
|:---:|---|---|---|
| **1** | az automatikus mód be van kapcsolva | a felhasználó a rendszer szintjén módosítja a témát | az alkalmazás automatikusan átáll a megfelelő módra |
| **2** | az automatikus mód ki van kapcsolva | a rendszer témája változik | az alkalmazás nem változtatja meg a saját témáját |
