---
title: Backend és BFF
description: A BFF minta szerepe, amelyen keresztül a mobilalkalmazás egyetlen NestJS belépési ponton éri el a belső szolgáltatásokat.
---

# Backend és BFF architektúra

A backend a BFF (Backend for Frontend) tervezési mintára épül. Ennek lényege, hogy a mobilalkalmazás nem kommunikál közvetlenül a belső szolgáltatásokkal (Martin, Valhalla, PostgreSQL), hanem minden kérés egyetlen NestJS alkalmazáson keresztül érkezik. Ez több előnnyel jár:

- Az API kulcsok és belső hálózati címek nem kerülnek ki a kliensre.
- A JWT token validáció egy helyen, a BFF-ben történik.
- A mobilalkalmazás egyetlen URL-lel dolgozik.

A BFF NestJS keretrendszerre épül, moduláris architektúrával. A monolith-first megközelítés azt jelenti, hogy a rendszer egységes alkalmazásként működik, de a belső modulhatárok úgy lettek kialakítva, hogy szükség esetén az egyes modulok különálló mikroszolgáltatásokká bonthatók legyenek. Ezen design döntések szemelőtt voltak tartva a kezdetektől.
