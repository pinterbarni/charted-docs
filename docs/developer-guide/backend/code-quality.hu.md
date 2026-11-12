---
title: Kódminőség
description: A kódbázis minőségi konvenciói, a dokumentáció, a névkonvenciók, a kódszervezés és a fejlesztést támogató eszközök.
---

# Kódminőség és dokumentáció

A kódbázis konzisztens minőségi konvenciókat követ, amelyek az egész projektre érvényesek.

--8<-- "web-modification.hu.md"

## JSDoc

Minden publikus service metódus, controller és injectable osztály JSDoc kommentekkel van ellátva. A kommentek tartalmazzák a `@param` leírásokat minden paraméterhez, a `@returns` leírást a visszatérési értékhez, és a `@throws` leírást az összes dobható kivételhez. Ez biztosítja a Compodoc által generált dokumentáció teljességét.

## Névkonvenciók

A service metódusok clean code elveket követnek. Az `assertXxxExists()` validál és `NotFoundException`-t dob, a `findXxxOrNull()` nullable lekérdezést végez, a `buildXxxQuery()` pedig TypeORM `QueryBuilder` alapú összetett lekérdezéseket csomagol magába.

## Kódszervezés

A hosszabb service és controller fájlokban `#region` és `#endregion` komment szekciók tagolják a kódot logikai egységekre, megkönnyítve a navigációt IDE-ben.

### Konstansok

Az összes alkalmazásszintű konstans a `src/constants/` könyvtárban van centralizálva, témák szerint külön fájlokban:

- `app.constants.ts`: globális prefix, portok, environment
- `auth.constants.ts`: JWT algoritmus, JWKS cache konfiguráció
- `cache.constants.ts`: tile cache TTL
- `database.constants.ts`: adatbázis konfiguráció
- `levels.constants.ts`: gamifikációs küszöbértékek
- `throttler.constants.ts`: rate limiting beállítások
- `validation.constants.ts`: input validációs szabályok

### Modul konfigurációk

A NestJS modul factory függvények a `src/config/module-configs.ts` fájlban vannak centralizálva, így az `AppModule` tisztán csak a modulok regisztrálásával foglalkozik, a konkrét konfigurációs logika így el van különítve.

## TypeScript strict mode

A `tsconfig.json` már említett `strict: true` beállítással van konfigurálva, amely biztosítja a szigorú típusellenőrzést fordítási időben, beleértve a `strictNullChecks`, `noImplicitAny` és `strictFunctionTypes` beállításokat.

## Dokumentáció és fejlesztői eszközök

A kódminőséget és a dokumentáció előállítását a következő eszközök támogatják.

### Compodoc

A kóddokumentáció a `@compodoc/compodoc` eszközzel generálható, amely Mermaid ERD diagramot, modul függőségi gráfot és az összes JSDoc kommentet HTML formátumban jeleníti meg. A TypeDoc és JsDoc eszközök kipróbálása után a Compodoc lett választva, mivel natívan támogatja a NestJS moduláris struktúrát.

### Bruno API kliens

A `requests/` könyvtárban `.bru` formátumú API kérések találhatók, amelyek a Bruno API kliensben futtathatók fejlesztés és manuális tesztelés során. Ez a Postman alternatívája, amely verziókezelőbarát szöveg alapú formátumot használ.

### ESLint, Prettier, CSpell

A kód formázása és minőségellenőrzése ESLint és Prettier eszközökkel van biztosítva, amelyek a fejlesztési folyamat részét képezik. A helyesírást CSpell kényszeríti.
