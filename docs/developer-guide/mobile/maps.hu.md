---
description: A MapLibre alapú térképintegráció, a Martin csempeszerver használata, a téma szerinti térképstílus és a térképen megjelenő geoadat rétegek.
---

# Térképintegráció

A térképes megjelenítéshez a MapLibre React Native v11 béta verziója került választásra. Ez volt az egyetlen MapLibre verzió, amely kompatibilis az Expo SDK 55-tel. A csomag megköveteli az EAS prebuildet, azaz nem futtatható Expo Go környezetben. A könyvtár választásának fő indoka az önhoszolt tile server támogatása volt, amellyel elkerülhető a forgalomalapú díjszabású külső térképszolgáltatók használata (pl. MapBox).

A térkép csempéit a Vesta szerveren futó Martin tile server szolgáltatja, amelyet a BFF proxyzik. A térkép vizuális stílusát egy egyedi MapLibre stílusdefiníció határozza meg, amelyet az alkalmazás témájától függően a `getMapStyle(theme)` függvény generál.

A térképen az alábbi geoadat rétegek jelennek meg:

- `GeoJSONSource` és `Layer`: a rögzített túra nyomvonalát, a tervezett útvonalat, valamint az újrajárható (retrack) útvonalat jeleníti meg `LineLayer` típussal. A rétegek a `Map` komponensen belül kerülnek elhelyezésre, mivel a MapLibre GeoJSON forrás nem renderelhető önálló React komponensként, csak a térkép közvetlen gyermekeként.
- `ViewAnnotation`: a POI pontok megjelenítésére szolgál, React Native komponenseket helyez el a térkép megfelelő koordinátáin.
- `NativeUserLocation`: a felhasználó aktuális pozícióját és irányát jeleníti meg natív felhasználókoronggal.

A kamera vezérlése a `useMapCamera` hook-on keresztül történik.
