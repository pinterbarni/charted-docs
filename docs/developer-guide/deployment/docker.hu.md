---
description: TODO
---

# Docker és infrastruktúra

Az éles infrastruktúra Docker Compose alapú konténerizációra épül. A szolgáltatások két szerverre vannak elosztva.

--8<-- "web-modification.hu.md"

## Vesta szerveren futó szolgáltatások

| Szolgáltatás | Forrás | Leírás |
|---|---|---|
| **NestJS** (BFF) | `docker-compose.prod.yml` | Backend réteg. ARM64 alapú image-ként épül a Dockerfile-ból. A `charted-network` Docker hálózaton kommunikál a PostgreSQL-lel. |
| **PostgreSQL** | `imresamu/postgis:16-3.4` | ARM64 natív PostGIS image. A `charted-network` hálózaton érhető el a BFF számára. Az adatbázis séma az első indításkor a `DB_SYNCHRONIZE=true` környezeti változóval inicializálható, ezt követően ki kell kapcsolni. |
| **Keycloak** és **saját PostgreSQL** adatbázisa | | Külön Docker hálózaton fut (`keycloak-network`). |
| **Martin** (tile server) | | Csempék kiszolgálása közvetlenül a PostGIS adatbázisból. |
| **Valhalla** (routing engine) | | Gyalogos útvonaltervezés. |

## Janus szerveren futó szolgáltatások

| Szolgáltatás | Leírás |
|---|---|
| **nginx** | Reverse proxy TLS terminációval. A tanúsítványokat Certbot és Let's Encrypt biztosítja. Az `api.charted.hu` és `sso.charted.hu` domaineket Tailscale-en keresztül irányítja a Vesta szerverre. |
| **Tailscale** | Mesh VPN kapcsolat a Vesta szerverrel. |
| **dnsmasq** | Belső DNS feloldás, amely a `charted.hu` domaineket a Vesta Tailscale IP-jére irányítja. |

## Az éles BFF indítása

```bash
cd /srv/bff-charted
docker compose -f docker-compose.prod.yml up -d --build
```
