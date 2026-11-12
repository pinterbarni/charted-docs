---
title: Technológiaválasztás
description: TODO
---

# Technológiaválasztás és összehasonlítás

A rendszer fő építőelemeinek kiválasztása előtt minden területen több lehetséges megoldást vetettem össze, a projekt szempontjából lényeges szempontok mentén. Az alábbi táblázatok a mobilfejlesztési platform, a térképszolgáltatás, az autentikáció, a backend keretrendszer és az adatbázis választását mutatják be.

--8<-- "web-addition.hu.md"

## Mobilfejlesztési platform

A választás a React Native-re és az Expo keretrendszerre esett. A döntést a korábbi React Native tapasztalataim, a frontenddel és a backenddel közös TypeScript nyelv, valamint az EAS build támogatás indokolta. A Flutter hasonló képességei ellenére egy új nyelv és ökoszisztéma elsajátítását igényelte volna, a natív fejlesztés pedig platformonként külön kódbázist jelentett volna.

--8<-- "web-addition-paragraph.hu.md"

| Szempont | React Native (Expo) | Flutter | Natív (Kotlin/Swift) |
|----------|---------------------|---------|----------------------|
| **Keresztplatformos** | Igen, iOS és Android | Igen, iOS és Android | Nem, platformonként külön kódbázis |
| **JavaScript / TypeScript ökoszisztéma** | Teljes körű TS támogatás | Dart nyelv, elkülönült ökoszisztéma | Kotlin/Swift, nincs JS integráció |
| **EAS build** | Natívan támogatott | Nem elérhető | Nem elérhető |
| **Natív modulok és library támogatás** | Széles, aktív közösség | Növekvő, de szűkebb | Teljes natív hozzáférés |
| **Fejlesztési sebesség** | Gyors, hot reload | Gyors, hot reload | Lassabb, platformspecifikus |
| **Teljesítmény** | Közel natív | Közel natív, Skia renderer | Natív teljesítmény |

/// table-caption
Elemzett mobilfejlesztési platformok összehasonlítása
///

## Térképszolgáltatás

A választás a MapLibre-re esett. Egyedüliként tette lehetővé a térképcsempék saját infrastruktúrán, Martin tile szerverrel történő kiszolgálását, emellett nyílt forráskódú, ingyenes, támogatja az offline térképeket, és a stílusa teljes körűen testreszabható.

--8<-- "web-addition-paragraph.hu.md"

| Szempont | MapLibre | Google Maps / Apple Maps | Mapbox |
|---|---|---|---|
| **Önhoszolt tile server** | Igen, Martin tile szerverrel | Nem | Nem |
| **Nyílt forráskód** | Igen, MIT licenc | Nem | Részben |
| **React Native támogatás** | Igen, hivatalos csomag | Igen | Igen |
| **Költség** | Ingyenes | Forgalomalapú díjszabás | Forgalomalapú díjszabás |
| **Offline térkép támogatás** | Igen | Korlátozott | Igen, de fizetős |
| **Stílus testreszabhatóság** | Teljes körű | Korlátozott | Teljes körű |

/// table-caption
Elemzett térképszolgáltatások összehasonlítása
///

## Autentikáció

A választás a Keycloakra esett, a kezdetben tervezett Firebase Authentication helyett. A Keycloak saját infrastruktúrán, akár Raspberry Pi-n is futtatható, natívan támogatja a PKCE-t és teljes körűen az OAuth2 és OpenID Connect szabványokat, valamint beépített felhasználókezelő felülettel rendelkezik. Egy saját megoldás ugyanezt csak jóval nagyobb fejlesztési ráfordítással és biztonsági kockázattal nyújtotta volna.

--8<-- "web-addition-paragraph.hu.md"

| Szempont | Keycloak | Firebase Auth | Custom megoldás |
|---|---|---|---|
| **Önhoszolható** | Igen, Raspberry Pi-n is | Nem, Google infrastruktúra | Igen |
| **Nyílt forráskód** | Igen | Nem | Igen |
| **PKCE támogatás** | Igen, natív | Korlátozott | Manuálisan implementálandó |
| **OAuth2 / OpenID Connect** | Teljes körű | Részleges | Manuálisan implementálandó |
| **Felhasználókezelés** | Beépített admin felület | Beépített | Teljes egészében egyedi |
| **Fejlesztési komplexitás** | Közepes | Alacsony | Magas |

/// table-caption
Elemzett autentikációs megoldások összehasonlítása
///

## Backend keretrendszer

A választás a NestJS-re esett. Mivel a frontendhez hasonlóan TypeScript nyelvre épül, a fejlesztés során nem kellett több programozási nyelvet párhuzamosan elsajátítani, emellett moduláris architektúrát, natív TypeORM integrációt és beépített Swagger támogatást biztosít. A korábbi C# tapasztalataim ellenére a közös nyelv előnye döntött a .NET-tel szemben.

--8<-- "web-addition-paragraph.hu.md"

| Szempont | NestJS | .NET | Express / Fastify |
|---|---|---|---|
| **TypeScript natív támogatás** | Igen, teljes körű | Igen (C#) | Részleges, konfigurációt igényel |
| **Moduláris architektúra** | Igen, dekorátor alapú | Igen | Nem, manuálisan kialakítandó |
| **TypeORM integráció** | Natív, beépített support | Nincs, Entity Framework | Lehetséges, de nem natív |
| **Swagger / OpenAPI** | Beépített modul | Beépített | Külön csomag szükséges |
| **Tanulási görbe** | Közepes (Angular-szerű) | Közepes | Alacsony |
| **Közösség és ökoszisztéma** | Aktív, növekvő | Nagy, vállalati | Nagyon nagy, de heterogén |

/// table-caption
Elemzett backend keretrendszerek összehasonlítása
///

## Adatbázis és kapcsolódó technológiák

A választás a PostgreSQL-re esett. A PostGIS kiterjesztéssel teljes körű térinformatikai lekérdezéseket támogat, kiválóan kezeli az összetett relációkat, nyílt forráskódú, és megbízhatóan fut Raspberry Pi-n is. A választásban szerepet játszott a széles körű ipari elterjedtsége és a Linux alapú környezetekhez való illeszkedése is.

--8<-- "web-addition-paragraph.hu.md"

| Szempont | PostgreSQL | MySQL | MongoDB | SQLite |
|---|---|---|---|---|
| **Geospatiális lekérdezések** | Igen, PostGIS | Korlátozott | Igen, GeoJSON | Korlátozott |
| **TypeORM támogatás** | Teljes körű | Teljes körű | Részleges | Teljes körű |
| **Összetett relációk** | Kiváló | Jó | Gyenge | Jó |
| **Raspberry Pi-n futtatható** | Igen | Igen | Igen, erőforrásigényes | Igen |
| **Megbízhatóság** | Kiváló | Jó | Jó | Korlátozott (beágyazott) |
| **Licenc** | Nyílt forráskód | Nyílt forráskód | SSPL (részben zárt) | Nyílt forráskód |

/// table-caption
Elemzett adatbázis technológiák összehasonlítása
///
