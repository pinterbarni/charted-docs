??? question "...if Barni thinks about the rights of different stakeholders"

    **Short answer:** yes. As a single developer, I was the tester, developer and operator at once, so separating rights in practice would only have added administrative overhead. But the system is designed for the day more people join, with one principle: everyone gets access to what their job needs, and nothing more.

    **In place today**

    - **Hikers:** every user signs in through Keycloak, and their identity comes from the token, so the backend always knows whose data a request touches. Users decide whether a trail is shared, and blocking hides both users' content from each other.
    - **Identity administration:** user accounts, passwords and sessions are managed in Keycloak's own admin console, separate from the app and its database.
    - **Separate environments:** development has its own configuration, database and secrets, so day-to-day development never needs access to the pre-production servers.

     **Already prepared for, so it is easy to add later**

    - **Moderators:** reports are already stored with a moderator response field, and there is an admin endpoint for them. A dedicated admin interface with role checks comes next.
    - **Testers:** access to the app and its test accounts on the pre-production system, without servers, configuration or secrets.
    - **Developers and operators:** developers work in their own environment, and server access stays with the people who run the system.
    - **Audit logging:** the backend already writes structured logs, and Keycloak can record sign-in and admin events, so who did what, and when, can be traced once more people have access.

    These are only a few examples. The same approach of separate roles, least privilege and traceable access is what enterprise-level identity and access management is built on.


    **Where to look**

    - [Authentication](../developer-guide/backend/authentication.md): how identity reaches the backend
    - [Modules](../developer-guide/backend/modules.md): the reports module and its admin endpoint
    - [Future work](../summary/future-work.md): the planned admin interface

    **Why it matters:** in a real enterprise level system, not everyone should see everything. Knowing when access control is worth its cost, and designing so it can be added cleanly later, is part of building a system that scales with its team.
