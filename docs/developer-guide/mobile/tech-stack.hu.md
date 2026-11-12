---
description: TODO
---

# Technológiai stack

A mobilalkalmazás fejlesztése során az alábbi főbb technológiák és könyvtárak kerültek felhasználásra:

| Csomag | Szerep |
|---|---|
| `Expo SDK 55` és `React Native 0.83.2` | A keresztplatformos mobilalkalmazás alapjai, lehetővé teszik az iOS és Android célplatformok egyidejű fejlesztését egy köztes nyelven. |
| `TypeScript` (strict mode) | Statikus fordításidejű típusellenőrzést biztosít, `strict=true` beállítások mellett. |
| `expo-router` | Navigációs megoldás, amely leegyszerűsíti a képernyők közötti átjárást és az útvonalkezelést, file-alapú. |
| `zustand` | Könnyűsúlyú globális állapotkezelést biztosít az alkalmazás számára, Redux helyett választotam. |
| `@react-native-async-storage/async-storage` | Perzisztens adattárolást biztosít az alkalmazás számára. |
| `i18next`, `react-i18next`, `expo-localization` | Többnyelvű támogatást biztosítanak (magyar és angol), lehetővé téve a felhasználói felület lokalizációját. |
| `@maplibre/maplibre-react-native` v11 (beta) | Térképes megjelenítésért felelős könyvtár, amely lehetővé teszi útvonalak, pozíciók és egyéb geoadatok vizualizálását. Expo SDK 55-ös verziójával egyetlen kompatibilis MapLibre verzió. Megköveteli az EAS prebuildet. |
| `@mapbox/polyline` | Útvonalak dekódolására szolgál, amely szükséges lesz a térképen megjelenített vonalak feldolgozásához a jövőben. A Valhalla által kiszolgát útvonalak renderelésére választottam. |
| `@gorhom/bottom-sheet` | Alsó navigációs panel kezelésére szolgál, amely a mobil felhasználói felület egyik központi eleme. |
| `expo-location`, `expo-task-manager` | Helymeghatározás és háttérben történő GPS követés megvalósítására szolgálnak. |
| `expo-auth-session`, `jwt-decode` | PKCE alapú autentikáció és token feldolgozás megvalósítására szolgálnak. |
| `expo-secure-store`, `expo-crypto` | Biztonságos adattárolást és kriptográfiai műveleteket biztosítanak az autentikációs adatok kezeléséhez. |
| `expo-file-system`, `expo-sharing` | Fájlkezelést és fájlmegosztást biztosítanak, amelyeket a GPX alapú túraútvonalak mentésére és exportálására használ az alkalmazás. Az `expo-sharing` végül nem került alkalmazásra, viszont későbbi funkciók igényelhetik, benne hagytam. |
| `fast-xml-parser` | XML alapú GPX fájlok feldolgozására szolgál. |
| `geolib` | Földrajzi számításokat tesz lehetővé, például távolságmérés és koordináta műveletek. |
| `react-native-svg` | SVG alapú grafikus elemek és ikonok megjelenítésére szolgál, a Figmából exportált SVG-k kezelésére használtam. |
| `react-native-reanimated` | Animációk kezelésére szolgál, különösen a komplex UI elemek esetén. |
| `moti` | Skeleton loader komponensek implementálása miatt került az alkalmazásba. A `react-native-skeleton-placeholder` csomagnál jobban favorizáltam az impllementáció módját, a csomag viszont sokkal többet tud. |
| `react-native-gesture-handler`, `react-native-screens` | Natív navigációs és gesztuskezelési támogatást biztosítanak. |
| `react-native-toast-message` | Visszajelző üzenetek (toastok) megjelenítésére szolgál, melynek a használatában volt már tapasztalatom. |
| `uuid`, `react-native-get-random-values` | Egyedi azonosítók generálására szolgálnak. |
| `expo-notifications`, `expo-keep-awake` | Értesítések kezelésére és az alkalmazás aktív állapotban tartására szolgálnak. |
| `expo-dev-client` | Egyedi fejlesztői build futtatását teszi lehetővé natív modulok használata esetén. |
| `EAS Build` és `EAS Submit` | Buildelési és telepítési folyamatokat biztosítanak az alkalmazás számára. |
| `jest`, `jest-expo` | Automatizált tesztelési környezetet biztosítanak az alkalmazás számára. Végül teszteseteket nem implementáltam, az alkalmazás viszont elő van készítve az npm packageüben még szripteket is létrehoztam a futtatásukra. |
