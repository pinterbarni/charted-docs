---
description: TODO
---

# Offline működés

## Offline működés, elmentett útvonalak elérhetősége

| Lépés | GIVEN | WHEN | THEN |
|:---:|---|---|---|
| **1** | a felhasználó internetkapcsolattal használja az alkalmazást és rendelkezik elmentett offline túrákkal | az internetkapcsolat megszűnik | az alkalmazás offline módba kerül |
| **2** | az alkalmazás offline módban van | a felhasználó a profil oldalra navigál | csak az offline elérhető túraútvonalak jelennek meg |
| **3** | offline túrák megjelentek | a felhasználó kiválaszt egyet | a túra betöltődik és megtekinthető offline módban is |

## Offline állapotban alkalmazás megnyitása autentikált felhasználóval

| Lépés | GIVEN | WHEN | THEN |
|:---:|---|---|---|
| **1** | a felhasználó korábban sikeresen autentikálta magát | bezárja az alkalmazást | az alkalmazás leáll |
| **2** | az eszköz offline állapotban van | a felhasználó újranyitja az alkalmazást | a felhasználó autentikált állapotban marad és az alkalmazás használható |

*Megjegyzés: Ez a teszteset nem került teljeskörűen tesztelésre, mivel a fejlesztői build nem biztosított megfelelő feltételeket az offline autentikáció validálására.*[^note-1]

## Offline működés, nincs elérhető offline adat

| Lépés | GIVEN | WHEN | THEN |
|:---:|---|---|---|
| **1** | az eszköz offline állapotban van | a felhasználó a profil oldalra navigál | az offline szekció jelenik meg |
| **2** | nincs elmentett offline túra | a felhasználó megtekinti az offline listát | „nincsenek offline túraútvonalak” üzenet jelenik meg |

[^note-1]: Sikerült tesztelni, működik. *Megjegyezve: 2026.05.01.*
