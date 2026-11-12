---
title: Fejlesztői környezet
description: A BFF és a mobilalkalmazás lokális indítása, az előfeltételek és a Vesta szerver szolgáltatásainak elérése Tailscale-en keresztül.
---

# Fejlesztői környezet felállítása

A fejlesztői környezet két részből áll: a mobilalkalmazásból és a BFF backendből. Mindkettő önállóan indítható, de a teljes funkcionalitáshoz mindkettőre szükség van. A Martin, Valhalla és Keycloak szolgáltatások a Vesta szerveren futnak, és Tailscale-en keresztül érhetők el fejlesztés közben.

--8<-- "web-modification.hu.md"

## Előfeltételek

Telepítendő eszközök:

- Node.js 20 vagy újabb verzió
- npm
- EAS CLI: `npm install -g eas-cli`

Futtatási környezet és hozzáférés:

- PostgreSQL lokálisan futtatva (pl. Docker Compose-szal a `docker-compose.dev.yml` segítségével)
- Tailscale kapcsolat a Vesta szerverhez

## BFF indítása

```bash
cd bff
npm install
npm run start:dev
```

A BFF a `.env.development` fájlból olvassa a konfigurációt. Az `.env.example` fájl tartalmazza az összes szükséges változót magyarázattal. A fejlesztői módban a TypeORM `synchronize: true` beállítással automatikusan létrehozza az adatbázis táblákat.

## Mobil indítása

```bash
cd charted-mobile
npm install
npx expo start --dev-client --clear
```

A mobilalkalmazás a `.env.development` fájlból olvassa az `EXPO_PUBLIC_BFF_URL` értékét. A MapLibre natív modulok miatt az alkalmazás nem futtatható Expo Go-ban, fejlesztői build szükséges. Az Android emulátort a legtöbb funkcióhoz elegendő, a GPS és háttér-helymeghatározás teszteléséhez fizikai eszköz szükséges. Ha a fizikai eszköz egy Xiaomi, abban az esetben ajánlom az emulátor használatát is.
