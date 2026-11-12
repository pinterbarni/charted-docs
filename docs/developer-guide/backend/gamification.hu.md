---
title: Gamifikáció
description: A megtett össztávolságból dinamikusan számított szintrendszer, amelynek küszöbei ikonikus túraútvonalakhoz és földrajzi méretekhez igazodnak.
---

# Gamifikációs logika

A gamifikációs rendszer valós, ikonikus túraútvonalak távolságain alapuló szintrendszert alkalmaz. A felhasználó szintje soha nem kerül tárolásra az adatbázisban, hanem minden alkalommal a `totalDistanceM` mezőből kerül dinamikusan kiszámításra a `computeLevel()` függvénnyel. Ez garantálja, hogy a szint mindig konzisztens marad a megtett távolsággal, és nem szükséges külön szinkronizációs logika vagy migrációs szkript szintváltozáskor.

A `totalDistanceM` értéke csak növekedhet: túra létrehozásakor automatikusan inkrementálódik, törléskor nem csökken, ez a tervezett viselkedés, üzleti logika.

| Szint | Referencia útvonal | Küszöbérték (`km`) |
|:---:|---|---:|
| **1** | Inca Trail (Peru) | `43` |
| **2** | Tour du Mont Blanc (Alpok) | `170` |
| **3** | El Camino de Santiago (Spanyolország) | `500` |
| **4** | Appalachian Trail fele (USA) | `1 200` |
| **5** | Pacific Crest Trail (USA) | `3 500` |
| **6** | Mount Everest magassága | `8 848` |
| **7** | Föld átmérője | `12 742` |

/// table-caption
    attrs: {id: tab-levels}
Gamifikációs szintrendszer valós túraútvonalak alapján
///
