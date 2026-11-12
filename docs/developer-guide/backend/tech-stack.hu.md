---
description: A BFF fő csomagjai és szerepük, a NestJS és TypeORM alapoktól a JWT validáción és naplózáson át a dokumentációs és tesztelési eszközökig.
---

# Technológiai stack

A backend (BFF) szolgáltatás fejlesztése során a következő főbb technológiák és könyvtárak kerültek felhasználásra:

| Csomag | Szerep |
|---|---|
| NestJS (`@nestjs/common`, `@nestjs/core`, `@nestjs/platform-express`) | Moduláris, TypeScript alapú backend keretrendszer. |
| `@nestjs/config` | Környezeti változók és konfiguráció kezelésére szolgál. |
| `@nestjs/typeorm`, `typeorm` | Adatbázis-kezelés entitás alapú ORM segítségével. |
| `PostgreSQL` (`PostGIS` kiterjesztéssel) | Relációs adatbázis, geospaciális műveletek támogatásának lehetőségével. |
| `@nestjs/jwt` | JWT tokenek kezelésére szolgál. |
| `jwks-rsa` | Külső identity provider (Keycloak) publikus kulcsainak lekérésére és token validációra. |
| `@nestjs/swagger` | Automatikus OpenAPI dokumentáció generálására. |
| `class-validator`, `class-transformer` | DTO validáció és adattranszformáció. |
| `@nestjs/axios`, `axios` | Külső HTTP hívások kezelésére. |
| `@nestjs/throttler` | Rate limiting. |
| `helmet` | HTTP biztonsági fejlécek beállítására. Könnyű implementálni. |
| `nestjs-pino`, `pino-http`, `pino-pretty` | Strukturált naplózás, prod-env logviewer alkalmazásokkal való integrációhoz és fejlesztői futtatáshoz külön beállításokkal. |
| `reflect-metadata`, `rxjs` | A NestJS működéséhez szükséges alap könyvtárak. |
| `@compodoc/compodoc` | Automatikus kóddokumentáció generálására alkalmas, a Nest által támogatott dokumentációs eszköz. `TypeDoc` és `JsDoc` kipróbálása után erre esett a választásom, bár nem volt vele tapasztalatom. |
| `jest`, `ts-jest` | Tesztelési környezet, a jelenlegi alkalmazás nem használja, viszont elő van készítve. |
| `eslint`, `prettier` | Kódminőség és formázás biztosítása. |
| `@types/express` | TypeScript típusdefiníciókat biztosít az Express keretrendszerhez, amelyet a NestJS HTTP adaptere használ. |
| `TypeScript` (strict mode) | Statikus fordításidejű típusellenőrzést biztosít, `strict=true` beállítások mellett. |
