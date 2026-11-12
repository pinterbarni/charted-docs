---
title: Konfiguráció
description: A mobilalkalmazás bundle-be kerülő és a BFF backend környezeti változói, valamint az .env fájlok verziókezelésen kívüli kezelése.
---

# Környezeti változók és konfiguráció

A rendszer két szinten használ környezeti változókat: a mobilalkalmazásban és a BFF backendben.

--8<-- "web-modification.hu.md"

## Mobilalkalmazás (`EXPO_PUBLIC_` prefix) { data-toc-label="Mobilalkalmazás" }

| Változó | Leírás |
|---|---|
| `EXPO_PUBLIC_BFF_URL` | A BFF alap URL-je (fejlesztői: lokális cím, éles: `https://api.charted.hu`). |
| `EXPO_PUBLIC_TILE_API_KEY` | A tile API kulcs, amelyet a BFF validál. |

Az `EXPO_PUBLIC_` prefix azt jelenti, hogy ezek a változók a bundle-be kerülnek és a kliens oldalon is láthatók. Érzékeny adatokat nem szabad itt tárolni.

## BFF backend (`.env.production`) { data-toc-label="BFF backend" }

| Változó | Leírás |
|---|---|
| `DB_HOST`, `DB_PORT`, `DB_USER`, `DB_PASSWORD`, `DB_NAME` | Adatbázis kapcsolati adatok. |
| `KEYCLOAK_URL`, `KEYCLOAK_JWKS_URI` | Keycloak OIDC végpontok. |
| `MARTIN_URL`, `MARTIN_API_KEY` | Martin tile server elérési adatok. |
| `VALHALLA_URL` | Valhalla routing engine URL-je. |
| `NODE_ENV` | A futtatási környezet (`production` értékkel a szinkronizáció ki van kapcsolva). |
| `DB_SYNCHRONIZE` | Opcionálisan `true` értékre állítható az első telepítéskor az adatbázis séma inicializálásához. |

A `.env` fájlok nem kerülnek verziókezelőbe (`.gitignore`-ban szerepelnek). Minden repository tartalmaz egy `.env.example` fájlt, amely dokumentálja a szükséges változókat értékek nélkül.
