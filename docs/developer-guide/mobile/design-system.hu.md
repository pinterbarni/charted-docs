---
title: Design rendszer
description: A témától függő stílusgyártó függvényekre épülő design rendszer, a tipográfiai stílusok és a mobil komponenskönyvtár fő elemei.
---

# Design rendszer és tipográfia

Az alkalmazás design rendszere a `makeStyles(theme)` pattern-re épül: minden komponens a saját stílusait egy factory függvényen keresztül kapja meg, amely paraméterként az aktuális témát veszi át. Ez biztosítja, hogy a stílusok mindig az aktuális téma értékeit használják, és a témaváltás azonnal érvényes legyen az összes komponensben.

A tipográfia rendszer a `typography` konstansban van definiálva, amely a React Native `StyleSheet.create()` segítségével épül fel. A stílusok egy `createTextStyle()` helper függvénnyel kerülnek létrehozásra, amely a betűtípust, méretet, sortávolságot és betűközt egységesen kezeli.

A komponenskönyvtár főbb elemei: `Button`, `TagPill`, `ChoiceModal`, `ListModal`, `HikeReviewModal`, `HikeMetricGauge`, `TrailMapPreview`, `UserCard`.