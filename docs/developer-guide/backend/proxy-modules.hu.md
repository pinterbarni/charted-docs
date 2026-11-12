---
description: Hogyan továbbítja a BFF a csempe- és útvonaltervezési kéréseket a Martin tile serverhez és a Valhallához, elrejtve a belső címeket.
---

# Proxy modulok

A BFF két külső szolgáltatás (service) felé működik proxyként. Mindkét esetben a belső hálózati konfiguráció és az API kulcsok rejtve maradnak a kliens elől, és csak a BFF-en keresztül érhetők el.

## Martin tile server proxy (`TilesModule`)

Az MVT csempéket a Martin tile server szolgáltatja, amely közvetlenül a PostgreSQL adatbázisból olvas PostGIS kiterjesztéssel. A BFF az összes `/api/tiles/*` kérést átirányítja a Martin szerverre, miközben szerver oldalon injektálja az API kulcsot. A tile válaszok bináris formátumban kerülnek átvitelre, 24 órás kliens oldali cache-eléssel. A végpontok ki vannak zárva az autentikáció és a Swagger dokumentáció alól.

## Valhalla routing proxy (`RoutingModule`)

A gyalogos útvonaltervezési kéréseket a Valhalla routing engine-hez irányítja. Az összes `/api/routing/*` kérés proxy-zódik (`All('*path')` dekorátor), megőrizve a HTTP metódust, a query paramétereket és a request body-t. A Valhalla hibái közvetlenül továbbítódnak a kliensnek a megfelelő HTTP státuszkóddal. Ha a Valhalla nem elérhető, 500-as státuszkód kerül visszaadásra. A végpontok szintén ki vannak zárva a Swagger dokumentációból. Megjegyzés: a Valhalla proxy jelenleg részlegesen integrált a frontend oldalon, a teljes tervezési folyamat V2-re van tervezve.
