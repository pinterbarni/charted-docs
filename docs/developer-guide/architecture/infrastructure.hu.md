---
description: A két Raspberry Pi szerver, a Janus edge proxy és a Vesta alkalmazásszerver szerepe, Tailscale kapcsolattal és telepítési diagramokkal.
---

# Infrastruktúra

A rendszer két fizikai Raspberry Pi eszközre épül, amelyek különböző szerepet töltenek be az infrastruktúrában. A két eszköz közötti kommunikáció Tailscale mesh VPN-en keresztül zajlik, amely hálózati kapcsolatot biztosít anélkül, hogy portok nyitása vagy manuális VPN konfiguráció szükséges lenne, mindezt zero-config.
A két eszköz elszeparált hálózaton operál, minden másik eszköz a guest hálózatot használja, ezzel is biztosítva a biztonságot. A két szerver fizikailag nincs szeparálva, és az RJ45 portok aktívak rajtuk, ami ismert biztonsági tényező, amelyet enyhít, hogy vendég egyedül nem tartózkodhat mellettük.
--8<-- "web-modification.hu.md"

## Janus (Eredetileg `Raspberry Pi 3b`)

A nyilvánosan elérhető edge szerver, SD kártyáról operál. Fő feladata az nginx alapú reverse proxy működtetése, TLS tanúsítványokkal. A beérkező kéréseket domain név alapján továbbítja a Vesta szerverre Tailscale-en keresztül: az `api.charted.hu` kérések a BFF-re, az `sso.charted.hu` kérések a Keycloak-ra érkeznek.

## Vesta (Eredetileg `Raspberry Pi 5`)

a belső szerver, amely az összes alkalmazásszolgáltatást futtatja Docker konténerekben. A releváns futó szolgáltatások:

| Szolgáltatás | Szerep |
|---|---|
| **NestJS BFF** | A mobilalkalmazás egyetlen belépési pontja az API hívásokhoz. |
| **PostgreSQL** | Az alkalmazás relációs adatbázisa PostGIS kiterjesztéssel. |
| **Keycloak** | Az OIDC alapú identity provider, saját PostgreSQL adatbázissal. |
| **Martin** (tile server) | MVT térkép csempék kiszolgálása közvetlenül PostgreSQL-ből. |
| **Valhalla** (routing engine) | Gyalogos útvonaltervezés. |

A fejlesztői és az éles környezet infrastruktúrája eltér egymástól, ahogy azt az [alábbi ábra](#fig-deployment-dev) szemlélteti. A fejlesztői környezetben a BFF és a PostgreSQL a fejlesztői gépen fut lokálisan, míg a Martin, Valhalla és Keycloak szolgáltatások a Vesta szerveren érhetők el Tailscale-en keresztül.

```plantuml
--8<-- "plantuml/deployment-dev.puml"
```

/// caption
    attrs: {id: fig-deployment-dev}
Fejlesztői telepítési diagram
///

Az éles környezetben, ahogy az [alábbi ábra](#fig-deployment-prod) mutatja, minden szolgáltatás a Vesta szerveren fut, a mobilalkalmazás pedig a Janus szerveren keresztül éri el őket.

```plantuml
--8<-- "plantuml/deployment-prod.puml"
```

/// caption
    attrs: {id: fig-deployment-prod}
Éles telepítési diagram
///
