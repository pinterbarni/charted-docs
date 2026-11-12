---
description: A mikroszolgáltatás-alapú tervtől a moduláris, monolith-first backendig vezető architekturális döntés és annak indoklása.
---

# Architekturális döntések

A rendszer tervezése során kiemelt figyelmet fordítottam arra, hogy az architektúra ne csak a jelenlegi követelményeknek feleljen meg, hanem hosszú távon is bővíthető és skálázható maradjon. A kiszolgáló szerverek ARM architektérán futnak, így figyelemben kellett tartani, hogy a választott eszközök kompatibilisek legyenek vele.

A kezdeti elképzelések szerint a rendszert mikroszolgáltatás-alapú architektúrában kívántam megvalósítani. Ebben a modellben a mobilalkalmazás egy Backend-for-Frontend (BFF) rétegen keresztül kommunikált volna különálló szolgáltatásokkal, mint például routing szolgáltatás, térképcsempe-kiszolgáló, valamint egyéb domain-specifikus komponensek, Redpanda csövön keresztül.

A tervezés korai szakaszában azonban világossá vált, hogy egy teljes mikroszolgáltatás-alapú architektúra kialakítása jelentős időveszteségekkel járna számomra. A különálló szolgáltatások kezelése, konfigurálása, valamint az ezek közötti kommunikáció kialakítása jelentős mennyiségű infrastruktúrális és konfigurációs munkát igényelt volna, amely aránytalanul nagy lett volna a rendelkezésre álló időkerethez képest.

Ennek következtében a rendszer architektúráját egy úgynevezett monolith-first megközelítés felé pivotoltam: a rendszer kezdetben egy egységes, monolitikus alkalmazásként kerül megvalósításra, ugyanakkor a belső felépítése már úgy kerül kialakításra, hogy a későbbiekben könnyen szétbontható legyen különálló szolgáltatásokra.

A monolitikus backend kialakítása során törekedtem a moduláris szerkezetre, melyre a választott techológia alkalmas volt. Ez a megközelítés biztosítja, hogy a jövőben, szükség esetén, az egyes modulok önálló mikroszolgáltatásokká alakíthatók legyenek, minimalizálva az átalakítás költségét.

A rendszer továbbra is tartalmaz olyan komponenseket, amelyek önálló szolgáltatásként működnek. Ilyenek például a routing szolgáltatás és a térképcsempe-kiszolgáló rendszer, amelyek külső szolgáltatásként integrálódnak a backendhez.

Összességében az alkalmazott architekturális megközelítés egy kompromisszum eredménye: a cél egy olyan rendszer kialakítása volt, amely ötvözi a monolitikus rendszerek egyszerűségét a mikroszolgáltatás-alapú architektúrák bővíthetőségével és rugalmasságával.
