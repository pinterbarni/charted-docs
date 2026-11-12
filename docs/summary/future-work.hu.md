---
description: TODO
---

# V2 fejlesztési lehetőségek

A további fejlesztések megkezdése előtt első lépésként a meglévő frontend kódbázis refaktorálása szükséges. A jelenlegi rendszer funkcionalitás szempontjából működőképes, azonban több helyen tartalmaz technikai adósságot, amely a gyors iterációk és a komplexitás növekedése során alakult ki, mivel kevés idő maradt a végére.

## Backend bővítések

A backend oldalon elsődleges cél a jelenleg részlegesen implementált routing megoldás teljes integrációja, például a *Valhalla* alapú útvonaltervezés bevezetésével. Emellett szükséges a lista alapú végpontok dinamikus paginációval történő kiegészítése (limit és offset paraméterekkel), amely a skálázhatóságot és a teljesítményt javítja.

Egy adminisztrációs felület kialakítása, amely lehetőséget biztosít a felhasználói riportok kezelésére. Ezzel párhuzamosan egy értesítési rendszer (push notification) bevezetése is indokolt lehet, amely a felhasználói élményt növeli.

## Mobil funkciók

A sebességmérés és távolságszámítás jelenlegi implementációja ismert pontossági korlátokkal rendelkezik: a GPS pontosság ingadozása és az általam implementált megoldás miatt a mért értékek eltérhetnek a valóstól, különösen lassú mozgás vagy gyenge jel esetén. A V2-es fejlesztési fázisban a mérési algoritmus finomítása tervezett.

A mobilalkalmazás további fejlesztése során több, már részben előkészített funkció teljes implementációja tervezett. Ide tartozik például a túrákhoz kapcsolódó magassági grafikon megjelenítése SVG alapú megoldással, mentés és betöltés mások túráihoz, túra megosztás opcionálissá tétele, like-unlike funkcionalitás és még sorolhatnám.

A felhasználói profil bővítése érdekében szükséges az avatar feltöltés lehetőségének bevezetése, valamint egy teljes profilszerkesztő modul beépítése, akár a backenden jelenleg implementált base64 megoldással, akár egy self hosztolt MinIO beépítésével. Emellett a túrákhoz kapcsolódó további metaadatok kezelése (pl. megosztottság állapota, *isoshared*) és a mentett útvonalak szerkeszthetősége is fontos fejlesztési irány.

A felhasználói élmény további javítása érdekében részletes statisztikák megjelenítése is tervezett, amely visszajelzést ad a felhasználók aktivitásáról.

A frontendhez célszerű lehet a design konstansok mielőbbi rendszerezése, és primitív értékekből, akár egzaktabb, pl `theme.defaultBorderColor` kiépítése.

## Infrastruktúra fejlesztések

Érdemes integrálni egy crash reporting megoldást, például *Sentry* használatával, hogy a végfelhasználóknál felmerülő problémákat észlelni tudjuk.

A fejlesztési folyamat automatizálása érdekében auto tesztek (unit és end-to-end) bevezetése szükséges. Ezzel párhuzamosan a már implementált CI/CD pipeline (például *Drone CI*) kialakítása is indokolt, hogy automatizáljuk a build és deploy folyamatokat.
