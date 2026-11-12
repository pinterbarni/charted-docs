---
title: Navigáció
description: TODO
---

# Navigáció és képernyőstruktúra

Az alkalmazás két fő útvonalcsoportra van osztva, amelyek az autentikációs állapottól függően kerülnek aktiválásra:

- `(auth)`: az autentikációs képernyőket tartalmazó csoport egyetlen képernyőt tartalmaz: `login.tsx`.
- `(app)`: a bejelentkezett felhasználók számára elérhető főalkalmazás, amely az alábbi képernyőket tartalmazza:
    - `map.tsx`: a főképernyő, amely a térképes nézetet és az összes túrázáshoz kapcsolódó funkciót tartalmazza.
    - `profile.tsx`: felhasználói profil megjelenítése, mind saját, mind más felhasználók profiljaként működik a `userId` útvonal paraméter alapján.
    - `connections.tsx`: követők, követett felhasználók és felhasználókereső képernyő.
    - `hikeDetails.tsx`: befejezett túra részletes adatainak megjelenítése.
    - `trailsList.tsx`: túrák listanézete.
    - `savedTrailDetails.tsx`: helyi fájlrendszerben tárolt GPX útvonal részleteinek megjelenítése. A jövőben egyesíteni lehetne `trailsList.tsx`-komponenssel.

```mermaid
--8<-- "mermaid/navigation-map.mmd"
```

/// caption
    attrs: {id: fig-navigation-map}
Az alkalmazás képernyői közötti navigációs térkép
///

A gyökér `_layout.tsx` fájl tartalmazza az `useAuthGuard` hook-ot, amely az autentikációs állapot változásait figyeli és automatikusan átirányítja a felhasználót a megfelelő útvonalcsoportba. Ha a felhasználó be van jelentkezve és nem az `(app)` csoportban tartózkodik, a rendszer a térképes főképernyőre navigál. Ha nincs bejelentkezve és nem az `(auth)` csoportban van, a bejelentkezési képernyőre irányítja.

Az `(app)` csoport saját `_layout.tsx` fájlja konfigurálódik a Stack navigátor header megjelenésével: egységes háttérszín, tipográfia, vissza gomb és profilképernyőn a felhasználókereső ikon. Ezek a beállítások `sharedHeaderOptions` objektumban vannak.