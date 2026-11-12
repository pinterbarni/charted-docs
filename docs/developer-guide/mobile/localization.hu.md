---
description: TODO
---

# Lokalizáció

A lokalizáció az `i18next` és `react-i18next` könyvtárakra épül. A fordítási kulcsok JSON fájlokban vannak. A rendszernyelv detektálása az `expo-localization` `getLocales()` metódusával történik. Ha nem elérhető, van fallback nyelv. A felhasználó manuálisan nem változtathatja meg a nyelvbeállítást az alkalmazáson belül.

A mértékegység lokalizáció a `formatDistance()`, `formatElevation()`, `formatTime()` és `formatPace()` segédfüggvényekkel valósul meg, amelyek a `settingsStore` `unitOfMeasurementSystem` értéke alapján metrikus vagy birodalmi egységeket alkalmaznak. A számformázás a natív `toLocaleString()` metódussal történik, biztosítja a tizedes- és ezres elválasztók helyes megjelenítését.

Ismert korlát: a rendszer által megjelenített engedélykérő dialógusok (helymeghatározás, értesítések) mindig a rendszernyelven jelennek meg, az alkalmazás lokalizációs beállításától függetlenül, mivel ezek az operációs rendszer saját felhasználói felületei. Ezért minden egyes natív hívás előtt meg kell ejelníteni egy, az alkalmazáson bellüli modált, hogy elmagyarázzuk a felhasználónak mi fog történni, választási lehetőslget biztosítva.
