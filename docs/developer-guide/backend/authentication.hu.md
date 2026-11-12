---
description: TODO
---

# Authentikáció

Az authentikáció Keycloak OIDC providerre épül, PKCE alapú authorization code flow-val. A BFF nem tárol titkos kulcsot: a token validáció JWKS (JSON Web Key Set) alapú, ahol a Keycloak nyilvános kulcsát a BFF lekéri és cache-eli 5 percig, így minden beérkező kérés esetén nem szükséges hálózati hívás a Keycloak felé.

```mermaid
--8<-- "mermaid/sequence-auth.mmd"
```

/// caption
    attrs: {id: fig-auth-flow}
Az autentikációs folyamat szekvenciadiagramja
///

| Lépés | Küldő | Fogadó | Leírás |
|:---:|---|---|---|
| 1 | App | Keycloak | Authorization Code kérés PKCE code_challenge-dzsel |
| 2 | Keycloak | App | Authorization Code visszaküldése |
| 3 | App | Keycloak | Token csere: code és code_verifier elküldése |
| 4 | Keycloak | App | access_token és refresh_token visszaküldése |
| 5 | App | BFF | API kérés Bearer access_token-nel |
| 6 | BFF | Keycloak | JWKS lekérés a nyilvános kulcsért (cache-sel) |
| 7 | Keycloak | BFF | Nyilvános kulcs visszaküldése, BFF cache-eli |
| 8 | BFF | BFF | Token aláírás és lejárat ellenőrzése RS256-tal |
| 9 | BFF | PostgreSQL | Üzleti logika végrehajtása |
| 10 | PostgreSQL | BFF | Eredmény visszaküldése |
| 11 | BFF | App | JSON válasz |

/// table-caption
    attrs: {id: tab-auth-steps}
Az autentikációs folyamat lépései
///

A globálisan regisztrált `JwtAuthGuard` minden NestJS végpontot véd alapértelmezés szerint, az `APP_GUARD` mechanizmuson keresztül. A publikusan elérhető végpontok (pl. health check, tile proxy) a `@Public()` dekorátorral jelölhetők meg, amelyek bypass-olják az autentikációt. A guard a NestJS `Reflector` segítségével olvassa ki ezt a metaadatot a route handler és controller szintjéről.

```mermaid
--8<-- "mermaid/sequence-token-refresh.mmd"
```

/// caption
    attrs: {id: fig-token-refresh}
A token frissítési folyamat szekvenciadiagramja
///

| Lépés | Küldő | Fogadó | Leírás |
|:---:|---|---|---|
| 1 | App | BFF | API kérés lejárt Bearer tokennel |
| 2 | BFF | App | 401 Unauthorized válasz |
| 3 | App | Keycloak | Token frissítés kérése refresh_token-nel |
| 4 | Keycloak | Keycloak | refresh_token érvényességének ellenőrzése |
| 5 | Keycloak | App | Új access_token és új refresh_token |
| 6 | App | BFF | API kérés megismétlése az új Bearer tokennel |
| 7 | BFF | BFF | Új token ellenőrzése, érvényes |
| 8 | BFF | App | JSON válasz |

/// table-caption
    attrs: {id: tab-token-refresh-steps}
A token frissítési folyamat lépései
///

A token validáció folyamata a következő: a guard kinyeri a Bearer tokent az `Authorization` fejlécből, dekódolja a token fejlécét a `kid` (key ID) mező kinyeréséhez, lekéri a megfelelő nyilvános kulcsot a JWKS klienstől (cache-ből, ha lehetséges), majd RS256 algoritmussal ellenőrzi a token aláírását és lejáratát. Sikeres validáció után a dekódolt JWT payload a `request['user']` mezőbe kerül.

A `@CurrentUser()` paraméter dekorátor elérhetővé teszi a dekódolt JWT payloadot (Keycloak `sub`, `email`, `preferred_username` és egyéb claim-ek) a controller metódusokban, anélkül, hogy azt manuálisan kellene kinyerni a request objektumból. Amennyiben a dekorátor publikus végponton kerül használatra, ahol a guard nem futott le, az értéke `undefined` lesz.
