---
description: TODO
---

# Rendszerkövetelmények

Az alkalmazás futtatásához az alábbi minimális rendszerkövetelmények szükségesek.

## Platformkövetelmények

**Android:** Az alkalmazás Android 10 (API level 29) vagy újabb verziót igényel a háttérbeli helymeghatározás egységes kezelése miatt.

**iOS:** Az alkalmazás iOS 16 vagy újabb verziót igényel. iOS platformon a rendszer jelenleg nem került teljes körűen tesztelésre, és dedikált telepíthető build nem áll rendelkezésre.

## Futtatási módok

Az alkalmazás jelenleg béta állapotban érhető el (production build). A fejlesztés során egy belső fejlesztői verzió (alfa), illetve dev build is létezik, azonban ez nem végfelhasználók számára készült.

### Éles környezet

A mobilalkalmazás éles béta verziója külön `.apk` állományban telepíthető. Egyszerre egy alkalmazás telepíthető, az alfa és béta verziók felülírják egymást.

Az alkalmazás más kódbázisának lokális futtatását a béta felhasználótól nem igényli.

## Hálózati és hozzáférési követelmények

Stabil internetkapcsolat ajánlott az alkalmazás valós idejű funkcióinak használatához, különösen az első indításkor, az alábbi funkciókhoz:

- autentikáció (Keycloak),
- backend (BFF) elérése,
- térképi adatok letöltése.

Jelenleg mind fejlesztői, mind éles környezetben szükséges a *Tailscale* hálózathoz való hozzáférés a backend és az autentikációs szolgáltatás eléréséhez. A hozzáférés igényléséhez kérem, keressenek a *Neptunban* található elérhetőségeimen vagy a *Teams* felületemen.

## Offline működés

Az autentikációt követően az alkalmazás korlátozott offline módban is használható. A korábban elmentett túraútvonalak (pl. GPX fájlok) elérhetők maradnak, azonban:

- új adatok nem tölthetők le,
- térképi csempék nem frissülnek vagy töltődnek,
- közösségi funkciók nem érhetők el.

## Az alkalmazás elérhetősége és telepítése

Az alkalmazás jelenleg béta fejlesztési fázisban érhető el, és nem érhető el nyilvános alkalmazásboltokon (*App Store*, *Google Play Store*) keresztül.

iOS platformon az alkalmazás nem került publikálásra, *TestFlight* verzió jelenleg nem áll rendelkezésre.

Android platformon az alkalmazás `.apk` állományként telepíthető. A telepítőcsomag a szakdolgozat forráskódjával kerül terjesztésre, alkalmazásbolton keresztüli elérhetőség jelenleg nincs.

A telepítés lépései Android eszközön:

- A telepítés engedélyezése ismeretlen forrásból származó alkalmazások számára,
- Az alkalmazás telepítése a `.apk` fájl megnyitásával.

Az alkalmazás béta állapota miatt előfordulhatnak hibák vagy hiányzó funkciók, azonban az alapvető funkcionalitás elérhető és használható.
