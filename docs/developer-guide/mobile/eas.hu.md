---
description: TODO
---

# EAS és fejlesztés

Az alkalmazás a MapLibre React Native natív moduljai miatt nem futtatható az Expo Go környezetben, ezért fejlesztői build (development build) használata szükséges. Ez azt jelenti, hogy az alkalmazás egy egyedi natív buildet igényel, amelybe a fejlesztői kliens is be van fordítva.

A fejlesztői build elkészítése az EAS (Expo Application Services) segítségével történik:

```bash
eas build --platform android --profile development
```

A build elkészülte után az APK telepíthető a fejlesztői eszközre, amely ezután a lokálisan futó Expo fejlesztői szerverre csatlakozik:

```bash
npm start
```

A fejlesztői build és az Expo Go közötti fő különbség, hogy a fejlesztői build tartalmazza az összes natív modult (beleértve a MapLibre-t), így az összes funkció tesztelhető, míg az Expo Go csak az Expo SDK által előre csomagolt modulokat támogatja. A kódváltozások továbbra is hot reload-dal jelennek meg, a natív réteg újrafordítása nélkül.

Az `eas.json` fájl három build profilt definiál: `development`, `preview`, és `production`.

Az `app.json` fájlban be lett állítva, hogy a képernyő ne legyen elforgatható és tableteket ne támogasson, mivel a UI nem lett közepes képernyőn tesztelve.
