---
description: TODO
---

# Útvonalkezelés

Az útvonaltervezés a Valhalla routing engine-en keresztül valósul meg, amelyet a BFF proxyzik. A Valhalla `pedestrian` costing profillal van konfigurálva, az útvonalat encoded polyline formátumban adja vissza, amelyet a `@mapbox/polyline` könyvtár dekódol. Mivel a MapLibre `[lon, lat]` sorrendet vár, a koordináták felcserélésre kerülnek. Az útvonaltervezési folyamat a `useMapRoute` hook-ban van implementálva, a backend és frontend infrastruktúra kiépült, azonban a teljes integráció részleges, a befejezés V2-re van tervezve.
