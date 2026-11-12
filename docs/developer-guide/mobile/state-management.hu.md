---
description: TODO
---

# Állapotkezelés

Az alkalmazás globális állapotkezelése a Zustand könyvtárra épül. A Zustand előnye a Redux-hoz képest számomra a minimális konfiguráció volt.

Az alkalmazás négy store-ból áll.

--8<-- "web-modification.hu.md"

## Autentikáció (`authStore`) { data-toc-label="Autentikáció" }

A JWT tokeneket (`accessToken`, `refreshToken`, `idToken`) tárolja az `expo-secure-store`-ban, és az autentikációs állapotot (`Loading`, `Authenticated`, `Unauthenticated`) kezeli. A `hydrate()` metódus az alkalmazás indulásakor olvassa ki a tokeneket a SecureStore-ból és állítja be a kezdeti állapotot. Nem használ persist middleware-t, mivel a tokenek már a SecureStore-ban vannak tárolva.

## Helyi állapot (`localStore`) { data-toc-label="Helyi állapot" }

A GPS metrikákat, a tervezési állapotot, a retrack útvonalat és az engedély állapotát kezeli. Ez a store szándékosan nem perzisztens, helyette session alapú, az alkalmazás bezárásakor elvész. A store közvetlen elérése lehetséges a komponenseken kívülről is a `useLocationStore.getState()` hívással, amelyet a TaskManager feladatban és az apiClient-ben is alkalmaztam.

## Beállítások (`settingsStore`) { data-toc-label="Beállítások" }

A felhasználói beállításokat tárolja persist middleware-rel: a mértékegységrendszert (`metric` vagy `imperial`) és a témaválasztást (`light`, `dark`, vagy automatikus rendszerkövetés). A beállítások az `AsyncStorage`-ben tárolódnak `charted-settings` kulcs alatt.

## Hibakezelés (`errorStore`) { data-toc-label="Hibakezelés" }

A globális API hibákat kezeli. Három hibatype-ot különböztet meg: `network`, `unauthorized` és `server`. A gyökér layout `useEffect`-je figyeli a store állapotát, és hiba esetén toast üzenetet jelenít meg a felhasználónak.
