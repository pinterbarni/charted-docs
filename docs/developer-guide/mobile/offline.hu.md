---
description: Tervezett útvonalak offline tárolása GPX fájlokban a mentés, listázás, beolvasás és törlés műveleteivel, valamint egy ismert Android hibával.
---

# Offline funkciók

Az offline GPX tárolás az `expo-file-system`re épül. A fájlok az eszköz dokumentum könyvtárában, a `charted/routes/` alkönyvtárban kerülnek tárolásra.

A GPX formátum a következő struktúrát alkalmazza: a nyomvonalpontok `<trkpt>` elemekben szerepelnek a `<trkseg>` szegmensen belül, a POI pontok pedig `<wpt>` elemekként, ahol a `<name>` tag a POI kategóriát tartalmazza szöveg formátumban. Ez a megoldás lehetővé teszi, hogy a POI kategória-információ megmaradjon a GPX fájlban anélkül, hogy egyedi XML névteret kellene bevezetni.

A GPX fájlok kezelésére vonatkozó főbb műveletek.

--8<-- "web-modification.hu.md"

## Mentés (`savePlannedRouteAsGpx()`) { data-toc-label="Mentés" }

Koordináták és POI-ok alapján GPX XML-t generál és fájlba ír. A fájlnév a túra nevéből és egy Unix timestamp-ből áll, hogy az ütközések elkerülhetők legyenek.

## Listázás (`listSavedRoutes()`) { data-toc-label="Listázás" }

A könyvtárban lévő `.gpx` kiterjesztésű fájlokat listázza és megfordított sorrendben adja vissza.

## Beolvasás (`parseGpxFile()`) { data-toc-label="Beolvasás" }

A `fast-xml-parser` könyvtárral értelmezi a GPX fájlt, és kinyeri a `<wpt>` elemeket. Az attribútumokat `@_lat` és `@_lon` formátumban olvassa, mivel a könyvtár az XML attribútumok nevét `@_` előtaggal látja el.

## Törlés (`deleteGpxFile()`) { data-toc-label="Törlés" }

Törli a megadott elérési úton lévő fájlt.

## Ismert probléma

Az `expo-file-system` új API-jában a `Directory.exists()` metódus nem működik megbízhatóan Android platformon. A megoldás egy `try-catch` alapú megközelítés: a `create()` metódus kivételt dob, ha a könyvtár már létezik, amelyet az alkalmazás elnyelhet.
