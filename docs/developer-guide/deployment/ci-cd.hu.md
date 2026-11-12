---
description: A mobilalkalmazás EAS build profiljai és buildelése, valamint a BFF jelenleg manuális, Docker alapú deploy folyamata.
---

# CI/CD pipeline

A mobilalkalmazás build és deploy folyamata az EAS platformra épül.

--8<-- "web-modification.hu.md"

## Mobilalkalmazás

Három build profil van definiálva az `eas.json` fájlban:

| Profil | Leírás |
|---|---|
| `development` | Fejlesztői klienst tartalmazó build, belső terjesztéshez. A fejlesztői szerverre csatlakozik hot reload támogatással. |
| `preview` | Release módú build belső teszteléshez, fejlesztői kliens nélkül. |
| `production` | Éles APK build Android platformra. Az `autoIncrement: true` beállítás automatikusan növeli a build számot minden fordításnál. A környezeti változók közvetlenül az `eas.json` `env` szekciójában vannak definiálva, hogy biztosan az éles értékek kerüljenek a buildbe. |

Build indítása:

```bash
eas build --platform android --profile production
```

## BFF backend

A BFF backend deploy folyamata manuális: a forráskód módosítása után a Vesta szerveren a Docker image újraépítése és a konténer újraindítása szükséges. Önhoszolt Drone CI szerver áll rendelkezésre a Vesta szerveren, amelynek automatizált deploy pipeline-hoz való integrálása V2-re van tervezve.
