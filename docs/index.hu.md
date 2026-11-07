---
todo: true
description: A Charted, egy saját szerveren futó közösségi túraalkalmazás szakdolgozatának webes változata.
hide:
  - navigation
  - toc
---

# Charted

Todo description

## Összefoglaló

TODO

## A dokumentáció részei

<div class="grid cards" markdown>

-   :material-book-open-variant:{ .lg .middle } **Bevezetés**

    ---

    Az alkalmazás bemutatása, a dolgozat célja és hatóköre, valamint a felhasznált technológiák.

    [:octicons-arrow-right-24: Tovább a bevezetéshez](introduction/index.md)

-   :material-cellphone:{ .lg .middle } **Felhasználói dokumentáció**

    ---

    Az alkalmazás használata a regisztrációtól a túratervezésen és rögzítésen át a közösségi funkciókig.

    [:octicons-arrow-right-24: Tovább a felhasználói dokumentációhoz](user-guide/index.md)

-   :material-code-braces:{ .lg .middle } **Fejlesztői dokumentáció**

    ---

    Tervezés, rendszerarchitektúra, backend, mobil alkalmazás, üzemeltetés és tesztesetek.

    [:octicons-arrow-right-24: Tovább a fejlesztői dokumentációhoz](developer-guide/index.md)

-   :material-flag-checkered:{ .lg .middle } **Összefoglalás**

    ---

    Nehézségek és megoldások, valamint a V2 fejlesztési lehetőségei.

    [:octicons-arrow-right-24: Tovább az összefoglaláshoz](summary/index.md)

</div>

## Technológiák

- **Mobil:** React Native, Expo, MapLibre
- **Backend:** NestJS BFF, PostgreSQL, PostGIS, TypeORM
- **Térkép és útvonaltervezés:** Valhalla, Martin
- **Hitelesítés:** Keycloak (OAuth2, PKCE)
- **Infrastruktúra:** Docker Compose, Drone CI, két Raspberry Pi
