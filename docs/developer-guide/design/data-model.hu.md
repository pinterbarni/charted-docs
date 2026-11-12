---
description: TODO
---

# Adatmodell tervezése

Az alkalmazás adatmodelljét PostgreSQL relációs adatbázisra terveztem, TypeORM ORM réteggel. Az entitások három fő csoportra oszthatók: felhasználókezelés, túrák és útvonalak, valamint közösségi funkciók.

Megjegyzendő, hogy az entitások között nem kerültek definiálásra TypeORM relációk (`@OneToMany`, `@ManyToOne` stb.), mivel tapasztalat hiányában ezek konfigurálása nem volt prioritás a fejlesztés során. A relációk hiánya azt jelenti, hogy a Compodoc által automatikusan generálható ERD diagram nem tartalmazza a kapcsolatokat, ezért az entitás-kapcsolat diagram manuálisan, Mermaid segítségével készült el.

```mermaid
--8<-- "mermaid/entity-relations.mmd"
```

/// caption
Az adatbázis entitás-kapcsolat diagramja
///

## Felhasználókezelés

A `users` tábla elsődleges kulcsa a Keycloak által generált JWT `sub` claim, tehát nem egy külön generált UUID, hanem az identity provider által kiosztott azonosító. Ez egyszerűsíti a felhasználó azonosítását, mivel a BFF minden hitelesített kérésnél közvetlenül a tokenből tudja kiolvasni a felhasználó azonosítóját.

A felhasználói avatar külön `user_avatars` táblában kerül tárolásra. Ennek oka, hogy az avatar base64 formátumban akár több száz kilobájt is lehet, és a profil lekérésekor nem mindig szükséges ezt visszaadni, a szétválasztással elkerülhető a felesleges adatátvitel.

A `total_distance_m` mező értékét nem futásidőben számítjuk ki a túrákból, hanem minden új túra mentésekor növeljük. Így a felhasználói szint megjelenítéséhez szükséges össztávolság egyetlen mezőolvasással elérhető, nem kell aggregációs lekérdezés.

## Túrák és útvonalak

A `trails` táblában a nyomvonalpontok (`track_points`) és az érdekességek (`pois`) egyetlen `JSONB` oszlopban kerülnek tárolásra, nem külön táblákban. Egy aktív túra akár több ezer GPS-pontot is rögzíthet, ezek külön táblában való tárolása rendkívül nagy táblát eredményezne. A `JSONB` formátum PostgreSQL alatt lekérdezhető, ugyanakkor az összetartozó adatok egyetlen sorban maradnak.

A `planned_routes` tábla a Valhalla útvonaltervező motor teljes válaszát is eltárolja, hogy az útvonal újra megjeleníthetőszükséges legyen ismételt számítás nélkül.

## Közösségi funkciók

A követési és blokkolási kapcsolatok egyszerű irányított párként kerülnek tárolásra. A blokkolás kétirányú hatású: ha A blokkolja B-t, egyik fél sem láthatja a másik tartalmát, ezért minden lekérdezésnél mindkét irány figyelembe van véve.

A `reports` tábla egy `target_type` mezővel jelzi, hogy a bejelentés felhasználóra vagy túrára vonatkozik-e, a `target_id` pedig a bejelentett elem azonosítóját tárolja. Ez lehetővé teszi, hogy különböző típusú bejelentések egyetlen táblában kezelhetők legyenek.
