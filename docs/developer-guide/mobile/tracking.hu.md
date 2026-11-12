---
title: Túrarögzítés és GPS
description: A háttérben is működő GPS túrarögzítés, a trackpointok és metrikák számítása, a sebességfigyelmeztetés és a követési állapotgép.
---

# Túrarögzítés és GPS követés

A GPS alapú túrarögzítés az `expo-location` és `expo-task-manager` könyvtárakra épül. Az `expo-task-manager` lehetővé teszi, hogy a helymeghatározás háttérben, az alkalmazás minimalizált állapotában is működjön. Android platformon a `foregroundService` egy folyamatos értesítést jelenít meg, amely jelzi a felhasználónak, hogy a rögzítés aktív[^foreground-language].

A helyadatok feldolgozása a `locationTask.ts` fájlban definiált `TaskManager` feladatban történik, amely minden GPS frissítéskor fut. A feladat frissíti a koordinátákat, és aktív, nem szüneteltetett követési állapotban rögzíti a trackpointot a Zustand store-ba. A sebesség figyelő logika `SPEED_WARNING_MS` (15 m/s) küszöbértéknél értesítést küld a felhasználónak, ha valószínűleg elfelejtette leállítani a rögzítést. Az értesítés 10 perces visszaszámlálóval (cooldown) rendelkezik az ismételt riasztások elkerülése érdekében.

A trackpoint struktúra a következő mezőket tartalmazza: `lat`, `lon`, `ele` (magasság), `time` (ISO 8601 timestamp), `accuracy`, `speed` és `heading`.

A metrikák számítása a `localStore` `addTrackPoint()` metódusában történik:

- **Távolság**: a `geolib` könyvtár `getDistance()` függvényével, az előző és aktuális koordináta közötti haversine távolságot számítja.
- **Szintemelkedés**: csak pozitív változások kerülnek számlálásra, és kizárólag 3 méternél nagyobb különbségek (`ELEVATION_THRESHOLD_M`), ezzel kiszűrve a GPS zajt.
- **Időtartam**: egy másodperces `setInterval` alapú timer számolja, amelyet a szüneteltetés leállít és a folytatás újraindít.

A tracking állapotgép hat állapotot kezel: `idle`, `tracking`, `paused`, `done`, `retracking` és `retracking_active`. Az átmenetek a `useBackgroundLocation` kompozíciós hook-on keresztül érhetők el, amely három specializált hook-ot aggregál: `useMapLocationPermissions` az engedélyek kezelésére, `useTrackingControls` a rögzítés vezérlésére és `usePlanningControls` a tervezési mód kezelésére.

Az offline szinkronizáció az `AsyncStorage` alapú `pendingHikeStorage` segítségével valósul meg: a befejezett, de szinkronizálatlan túrák helyi tárolóba kerülnek, és az alkalmazás következő indításakor automatikusan szinkronizálódnak a BFF-fel.

[^foreground-language]: Ennek ismert korlátja, hogy csak angolul jelenik meg jelenleg.
