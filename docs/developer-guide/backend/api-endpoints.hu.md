---
title: API végpontok
description: TODO
---

# API végpontok dokumentációja

Az API végpontok `Swagger / OpenAPI` dokumentációval vannak ellátva a `@nestjs/swagger` dekorátorok segítségével, amely a `/api/docs` útvonalon érhető el. Az alábbi táblázatok modulonként összefoglalják az összes végpontot.

Az API végpontok tesztelésére Bruno kollekciók készültek, amelyek verziókezelőbarát, szöveg alapú `.bru` formátumban tárolják a kéréseket. A Postman helyett azért esett a választás Brunóra, mert a kollekciók beilleszthetők a forráskódba, és az eszköz szándékosan kevesebb funkcionalitással bír, ami egyszerűbb és átláthatóbb használatot tesz lehetővé. A különálló Bruno alkalmazás telepítése ajánlott, ezt kifejtettem a nehézségek szekcióban is.

--8<-- "web-modification.hu.md"

## Profil és avatar végpontok {#tab-profile-endpoints data-toc-label="Felhasználó végpontok"}

A profil és avatar végpontok a felhasználói profil létrehozását, lekérését és módosítását, valamint a profilképek kezelését biztosítják.

### Profil (`ProfileController`) { data-toc-label="Profil" }

A saját profil kezelése és a felhasználók közötti keresés.

| Metódus | Útvonal | Leírás |
|---|---|---|
| `POST` | `/api/profile/me` | Profil létrehozása vagy frissítése első bejelentkezéskor (upsert) |
| `GET` | `/api/profile/me` | Saját profil lekérése számított gamifikációs szinttel |
| `PATCH` | `/api/profile/me` | Profil mezők módosítása (displayName, bio, avatarUrl) |
| `GET` | `/api/profile/search?q=` | Felhasználók keresése felhasználónév alapján, blokkolt felhasználók kiszűrésével |

### Avatar (`AvatarController`) { data-toc-label="Avatar" }

A profilképek feltöltése, lekérése és törlése, egyenként vagy tömegesen.

| Metódus | Útvonal | Leírás |
|---|---|---|
| `POST` | `/api/profile/avatar` | Avatar feltöltése vagy cseréje base64 formátumban (upsert) |
| `GET` | `/api/profile/:id/avatar` | Adott felhasználó avatarjának lekérése |
| `GET` | `/api/profile/avatars?ids=` | Több felhasználó avatarjainak tömeges lekérése vesszővel elválasztott UUID listával, userId:base64 map formátumban |
| `DELETE` | `/api/profile/avatar` | Saját avatar törlése |

## Túra végpontok {#tab-trail-endpoints}

A túrákhoz kapcsolódó végpontok a rögzített túrák kezelését, a like funkciókat és a megosztott túrák felfedezését fedik le.

### Túrák (`TrailsController`) { data-toc-label="Túrák" }

A túrák létrehozása, listázása, lekérése, módosítása és törlése.

| Metódus | Útvonal | Leírás |
|---|---|---|
| `POST` | `/api/trails` | Új túra létrehozása, automatikusan inkrementálja a felhasználó totalDistanceM értékét |
| `GET` | `/api/trails/me` | Saját összes túra listája, létrehozás szerint csökkenő sorrendben |
| `GET` | `/api/trails/me/recent` | 5 legutóbbi saját túra |
| `GET` | `/api/trails/user/:userId` | Adott felhasználó megosztott túráinak listája |
| `GET` | `/api/trails/:id` | Túra lekérése azonosító alapján, a tulajdonos felhasználónevével kiegészítve |
| `PATCH` | `/api/trails/:id` | Túra módosítása (title, description, isShared) |
| `DELETE` | `/api/trails/:id` | Túra törlése, a totalDistanceM értéke nem csökken |

### Like funkciók (`TrailsLikesController`) { data-toc-label="Like funkciók" }

Túrák like-olása, a like visszavonása és a like-ok számának lekérése.

| Metódus | Útvonal | Leírás |
|---|---|---|
| `POST` | `/api/trails/:id/like` | Túra like-olása, 409 ha már like-olta |
| `DELETE` | `/api/trails/:id/like` | Like visszavonása |
| `GET` | `/api/trails/:id/likes` | Túra like számának lekérése |

### Megosztott túrák felfedezése (`TrailsSharedController`) { data-toc-label="Megosztott túrák felfedezése" }

A más felhasználók által megosztott túrák globális, publikus listái.

| Metódus | Útvonal | Leírás |
|---|---|---|
| `GET` | `/api/trails/shared/recent` | 5 legutóbb megosztott túra globálisan |
| `GET` | `/api/trails/shared/popular` | Legtöbbet like-olt megosztott túrák globálisan |

## Szociális funkciók végpontjai {#tab-social-endpoints data-toc-label="Közösségi végpontok"}

A szociális végpontok a felhasználók közötti kapcsolatokat kezelik: a követést, a blokkolást és a publikus profilok megtekintését.

### Követés (`SocialFollowController`) { data-toc-label="Követés" }

Felhasználók követése, a követés megszüntetése, valamint a követők és követettek listái.

| Metódus | Útvonal | Leírás |
|---|---|---|
| `POST` | `/api/social/follow/:userId` | Felhasználó követése, 409 ha már követi |
| `DELETE` | `/api/social/follow/:userId` | Követés megszüntetése |
| `GET` | `/api/social/:userId/followers` | Adott felhasználó követőinek listája, blokkolt felhasználók kiszűrésével |
| `GET` | `/api/social/:userId/following` | Adott felhasználó által követett felhasználók listája, blokkolt felhasználók kiszűrésével |

### Blokkolás (`SocialBlockController`) { data-toc-label="Blokkolás" }

Felhasználók blokkolása és a blokkolás feloldása, valamint a saját blokkolt felhasználók listája.

| Metódus | Útvonal | Leírás |
|---|---|---|
| `POST` | `/api/social/block/:userId` | Felhasználó blokkolása, automatikusan eltávolítja az összes kölcsönös követési kapcsolatot, 409 ha már blokkolta |
| `DELETE` | `/api/social/block/:userId` | Blokkolás feloldása |
| `GET` | `/api/social/blocked` | Saját blokkolt felhasználók listája |

### Publikus profil (`SocialProfileController`) { data-toc-label="Publikus profil" }

Más felhasználók publikus profiljának lekérése.

| Metódus | Útvonal | Leírás |
|---|---|---|
| `GET` | `/api/social/profile/:userId` | Felhasználó publikus profiljának lekérése, 404 ha blokkolt |

## Tervezett útvonalak végpontjai (`RoutesController`) { #tab-other-endpoints data-toc-label="Tervezett útvonalak végpontjai" }

A tervezett útvonalak végpontjai a Valhalla segítségével tervezett útvonalak mentését, listázását, lekérését és törlését biztosítják.

| Metódus | Útvonal | Leírás |
|---|---|---|
| `GET` | `/api/routes/me` | Saját összes tervezett útvonal listája |
| `GET` | `/api/routes/me/recent` | Legutóbbi tervezett útvonalak |
| `POST` | `/api/routes/plan` | Útvonal tervezése Valhallan keresztül és mentése, a teljes Valhalla választ perzisztálja |
| `GET` | `/api/routes/:id` | Tervezett útvonal lekérése azonosító alapján |
| `DELETE` | `/api/routes/:id` | Tervezett útvonal törlése |

## Bejelentési végpontok (`ReportsController`) { #report-endpoints data-toc-label="Bejelentési végpontok" }

A bejelentési végpontok a felhasználók és túrák moderációs célú bejelentését, valamint a bejelentések moderátori kezelését biztosítják.

| Metódus | Útvonal | Leírás |
|---|---|---|
| `POST` | `/api/reports` | Bejelentés létrehozása felhasználóra vagy túrára, 409 ha már bejelentette |
| `GET` | `/api/reports` | Összes bejelentés listája (admin végpont, jelenleg autentikáció védett) |
| `PATCH` | `/api/reports/:id` | Moderátori válasz hozzáadása bejelentéshez |

## Proxy és health check végpontok { #proxy-endpoints }

A proxy végpontok a Martin tile server és a Valhalla routing engine felé továbbítják a kéréseket, így a kliens ezeket a szolgáltatásokat kizárólag a BFF-en keresztül éri el. Ide tartozik a konténer állapotának ellenőrzésére szolgáló publikus health check végpont is.

| Metódus | Útvonal | Leírás |
|---|---|---|
| `ALL` | `/api/tiles/*` | Martin tile server proxy, API kulcs szerver oldali injektálással, 24h cache-eléssel |
| `ALL` | `/api/routing/*` | Valhalla routing engine proxy, gyalogos útvonaltervezéshez |
| `GET` | `/api/health` | Publikus health check végpont |

--8<-- "web-addition-paragraph.hu.md"

A proxy modulok működéséről bővebben a [Proxy modulok](proxy-modules.md) oldalon olvasható.
