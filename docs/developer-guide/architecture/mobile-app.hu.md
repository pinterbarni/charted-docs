---
title: Mobil alkalmazás
description: A mobilalkalmazás réteges felépítése a képernyőktől a hookokon, service-eken és Zustand store-okon át a segédfüggvényekig és komponensekig.
---

# Mobil alkalmazás architektúra

A mobilalkalmazás réteges architektúrára épül, ahol az egyes rétegek jól elkülönített felelősségi körökkel rendelkeznek:

- **`Screens`:** az expo-router file-alapú útválasztási rendszere által kezelt képernyők.
- **`Hooks`:** összetett állapotlogika és oldal-effektek kezelése pl.:
    - `useBackgroundLocation`,
    - `useMapCamera`.
- **`Services`:** BFF-fel való kommunikáció az `apiClient` HTTP klienesen keresztül.
- **`Stores`:** Zustand alapú globális állapotkezelés pl.:
    - `authStore`,
    - `localStore`,
    - `settingsStore`,
    - `errorStore`.
- **`Utils`:** állapotfüggetlen segédfüggvények (GPX kezelés, mértékegység konverzió stb.).
- **`Components`:** újrafelhasználható UI komponenskönyvtár.
