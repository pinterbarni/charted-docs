??? question "...if Barni made a data model in this project"

    **Short answer:** yes. The PostgreSQL schema has eight tables in three groups: user management, trails and routes, and social features. Every design choice is explained on the data model page.

    This is the entity relationship diagram, drawn live from its source file:

    ```mermaid
    --8<-- "mermaid/entity-relations.mmd"
    ```

    A few of the decisions behind it:

    - **The identity provider's ID is the primary key:** a user's ID is the `sub` claim of their Keycloak token, so the backend reads it straight from every authenticated request.
    - **Heavy data is kept apart:** avatars live in their own table, because a base64 image can be hundreds of kilobytes and most profile requests do not need it.
    - **Totals are stored, not recalculated:** a user's total distance grows with every saved trail, so showing their level takes one field read instead of an aggregate query.
    - **GPS tracks are stored as JSONB:** a single hike can record thousands of points. One queryable `JSONB` column keeps them together in one row instead of growing a huge separate table.
    - **Blocking works both ways:** a block is stored as one directed pair, and every query checks both directions, so neither user sees the other's content.
    - **One table for all reports:** a `target_type` field tells whether a report is about a user or a trail, so new report types need no new table.

    **Where to look**

    - [Data model](../developer-guide/design/data-model.md): every table and the reasoning behind it

    **Why it matters:** choices like these decide how fast the app stays as the data grows. Designed purposefully.
