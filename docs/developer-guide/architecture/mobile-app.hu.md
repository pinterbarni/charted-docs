---
title: Mobil alkalmazás
description: A mobilalkalmazás réteges felépítése a képernyőktől a hookokon, service-eken és Zustand store-okon át a segédfüggvényekig és komponensekig.
---

# Mobil alkalmazás architektúra

A mobilalkalmazás réteges architektúrára épül, ahol az egyes rétegek jól elkülönített felelősségi körökkel rendelkeznek:

--8<-- "web-modification.hu.md"

| Réteg | Felelősség | Példák |
|---|---|---|
| `Screens` | Az expo-router file-alapú útválasztási rendszere által kezelt képernyők. | |
| `Hooks` | Összetett állapotlogika és oldal-effektek kezelése. | `useBackgroundLocation`, `useMapCamera` |
| `Services` | BFF-fel való kommunikáció az `apiClient` HTTP kliensen keresztül. | |
| `Stores` | Zustand alapú globális állapotkezelés. | `authStore`, `localStore`, `settingsStore`, `errorStore` |
| `Utils` | Állapotfüggetlen segédfüggvények. | GPX kezelés, mértékegység konverzió |
| `Components` | Újrafelhasználható UI komponenskönyvtár. | |
