---
todo: true
description: The web version of my BSc thesis on Charted, a self-hosted social hiking app.
hide:
  - navigation
  - toc
---

# Charted

Charted is a self-hosted social hiking app: plan hiking routes, record and share hikes, follow other hikers, all in one place. This site is the web version of my BSc thesis written about it.

## Abstract

TODO

## What's inside

<div class="grid cards" markdown>

-   :material-book-open-variant:{ .lg .middle } **Introduction**

    ---

    The app, the goals and scope of the thesis, and the technologies used.

    [:octicons-arrow-right-24: Read the introduction](introduction/index.md)

-   :material-cellphone:{ .lg .middle } **User guide**

    ---

    How to use the app, from registration through route planning and recording to the social features.

    [:octicons-arrow-right-24: Read the user guide](user-guide/index.md)

-   :material-code-braces:{ .lg .middle } **Developer guide**

    ---

    Design, system architecture, backend, mobile app, operations and test cases.

    [:octicons-arrow-right-24: Read the developer guide](developer-guide/index.md)

-   :material-flag-checkered:{ .lg .middle } **Summary**

    ---

    Challenges and solutions, and the opportunities for a V2.

    [:octicons-arrow-right-24: Read the summary](summary/index.md)

</div>

## Technologies

- **Mobile:** React Native, Expo, MapLibre
- **Backend:** NestJS BFF, PostgreSQL, PostGIS, TypeORM
- **Maps and routing:** Valhalla, Martin
- **Authentication:** Keycloak (OAuth2, PKCE)
- **Infrastructure:** Docker Compose, Drone CI, two Raspberry Pis
