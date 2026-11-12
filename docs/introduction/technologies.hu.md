---
title: Felhasznált technológiák
description: Áttekintés a rendszer technológiáiról, a React Native és Expo, a Next.js, a NestJS és a PostgreSQL választásának indoklásával.
---

# Felhasznált technológiák áttekintése

Az adatkezelés és a perzisztencia megvalósítása során a kezdeti tervek között egy egyszerűbb, felhőalapú megoldás, például Firebase használata szerepelt. A fejlesztés előrehaladtával azonban ezt egy saját adatbázis-alapú megoldás váltotta fel, amely PostgreSQL adatbázisra épül. A választás során fontos szempont volt a nyílt forráskódúság, a széles körű ipari elterjedtség, valamint a Linux alapú környezetekhez való illeszkedés.

A rendszer működése során több külső komponenssel is kommunikál, amelyek különálló szolgáltatásként kezelhetők. Ide tartozik például a routing funkcionalitást biztosító szolgáltatás, valamint a térképi adatok kiszolgálását végző komponens. Ezek a rendszerek önállóan futnak, és a backend rétegen keresztül integrálódnak az alkalmazásba.

A rendszer fejlesztése során több modern technológiát alkalmaztam. A mobilalkalmazás React Native alapokon, Expo keretrendszer segítségével készült, míg a webes felület Next.js-re épül. A háttérrendszer kialakításánál Node.js alapú megoldásokat alkalmaztam, NestJS keretrendszer használatával.

A backend technológiák kiválasztása során fontos szempont volt, hogy ezen a területen korlátozottabb tapasztalattal rendelkeztem. Bár korábban C\# alapú backend megoldásokkal már találkoztam, végül a NestJS mellett döntöttem, mivel az TypeScript nyelvre épül, amely megegyezik a frontend fejlesztés során használt technológiával. Ez lehetővé tette, hogy a fejlesztés során ne kelljen több programozási nyelvet párhuzamosan mélyen elsajátítani, akár npm csomagokat hozhassak létre, vagy type exportokat hozhassak létre.

A mobilalkalmazás fejlesztéséhez alternatívaként felmerült a Flutter használata is, azonban a korábbi React Native tapasztalataim miatt végül a React Native mellett döntöttem. Az Expo keretrendszer alkalmazása tovább egyszerűsítette a fejlesztési folyamatot.

A backend fejlesztés során egy önálló szerveroldali alkalmazás készült, amely teljes kontrollt biztosít az üzleti logika és az adatok kezelése felett. Jelenleg is fut élesen a legfrissebb verziója.

Az alkalmazás térképes funkcióinak megvalósításához különböző térinformatikai eszközök kerültek integrálásra, például egy routing szolgáltatás, valamint egy térképcsempe-kiszolgáló rendszer, amelyek külön komponensként működnek, és a backend rendszeren keresztül érhetők el.

A rendszer részeként egy külső identitáskezelő megoldás is integrálásra került, amely az autentikációt és az autorizációt biztosítja, lehetővé téve a szabványos felhasználókezelést.

A fejlesztés során cél volt egy, a nagyvállalati környezetekhez hasonló működés modellezése is, amely magában foglalja a komponensek elkülönítését, valamint a rendszer későbbi bővíthetőségének biztosítását.
