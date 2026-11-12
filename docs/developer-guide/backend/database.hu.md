---
title: Adatbázis modell
description: A TypeORM entitások és a PostgreSQL táblák leírása entitás-kapcsolat diagrammal, a mezők és az egyedi megszorítások magyarázatával.
---

# Adatbázis modell és entitások

Az adatbázis modell TypeORM entitásokkal van leírva, amelyek közvetlenül leképezik a PostgreSQL táblastruktúrát. Az entitások `snake_case` elnevezési konvenciót követnek az adatbázisban egy egyedi `SnakeCaseNamingStrategy` segítségével, míg TypeScript oldalon `camelCase` neveket használnak. Fejlesztői és éles környezetben is `synchronize: true` beállítással az adatbázis séma automatikusan szinkronizálódik az entitásokból.

Megjegyzendő, hogy az entitások között nem kerültek definiálásra TypeORM relációk (`@OneToMany`, `@ManyToOne` stb.), mivel tapasztalat hiányában ezek konfigurálása nem volt prioritás a fejlesztés során. A relációk hiánya azt jelenti, hogy a Compodoc által automatikusan generálható ERD diagram nem tartalmazza a kapcsolatokat, ezért az entitás-kapcsolat diagram manuálisan, Mermaid segítségével készült el.

--8<-- "web-modification.hu.md"

Az adatbázis entitás-kapcsolat diagramja az alábbi ábrán látható. Az adatmodell tervezéséről további információ a [tervezési fejezetben](../design/data-model.md) található.

```mermaid
--8<-- "mermaid/entity-relations.mmd"
```

/// caption
    attrs: {id: fig-er-diagram}
Az adatbázis entitás-kapcsolat diagramja
///

| Entitás | Leírás |
|---|---|
| `UserEntity` | A felhasználó alaptáblája. Az `id` mező a Keycloak `sub` claim, tehát nem az alkalmazás generálja, hanem az identity provider adja. Tartalmazza a `username`, `displayName`, `bio`, `avatarUrl` mezőket, valamint a `totalDistanceM` float mezőt, amelyből a gamifikációs szint kerül dinamikusan kiszámításra. A `totalDistanceM` soha nem csökken, törléskor sem. |
| `UserAvatarEntity` | Az avatar adatokat külön táblában tárolja `base64` szöveg formátumban, a `userId` mint elsődleges kulcs és idegen kulcs a `users` táblára. A szétválasztás oka az, hogy a profil lekérések ne hozzák magukkal a potenciálisan nagy méretű képadatot. A service megjegyzi, hogy V2-ben MinIO objektumtárba kerülne migráció. |
| `TrailEntity` | A túra összes adatát tárolja. A `trackPoints` és `pois` mezők `jsonb` típusúak PostgreSQL-ben, így strukturált adat tárolható relációs séma nélkül. A `distanceM`, `durationS` és `elevationGainM` mezők denormalizáltan kerülnek tárolásra a klienstől érkező kalkulált értékekkel. Az `isShared` boolean mező szabályozza a publikus láthatóságot. A `userId` idegen kulcs a `users` táblára. |
| `TrailLikeEntity` | A like kapcsolatokat tárolja `userId` és `trailId` párban, egyedi constrainttel az ismételt like megelőzésére. |
| `FollowEntity` | Követési kapcsolatokat tárol `followerId` és `followingId` párban, egyedi constrainttel. |
| `BlockEntity` | Blokkolási kapcsolatokat tárol `blockerId` és `blockedId` párban, egyedi constrainttel. Blokkoláskor az összes kölcsönös `FollowEntity` törlésre kerül. |
| `ReportEntity` | Bejelentéseket tárol. A `targetType` enum mező jelzi, hogy felhasználóról vagy túráról van-e szó. A `targetId` a bejelentett entitás UUID azonosítója. Az `adminResponse` mező a moderátor válaszát tárolja, amely utólag `PATCH` kéréssel adható hozzá. Egyedi constraint akadályozza meg, hogy ugyanaz a felhasználó kétszer bejelentse ugyanazt az entitást. |
| `PlannedRouteEntity` | A tervezett útvonalakat tárolja. A `waypoints` és `valhalla_response` mezők `jsonb` típusúak. A teljes Valhalla válasz perzisztálásra kerül, hogy a kliens utólag visszatölthesse az útvonalat anélkül, hogy újra kellene számolni. |
