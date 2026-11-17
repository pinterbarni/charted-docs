??? question "...if Barni used PlantUML"

    **Short answer:** yes. The deployment diagrams are PlantUML, kept as code in the repository and rendered when the site builds.

    This is the production setup, drawn live from its source file:

    ```plantuml
    --8<-- "plantuml/deployment-prod.puml"
    ```

    The right tool for each diagram: PlantUML for deployment, where its UML notation fits best, and Mermaid for sequence and entity relationship diagrams, which render in the browser.

    **Where to look**

    - [Infrastructure](../developer-guide/architecture/infrastructure.md): development and production deployment diagrams
    - [Authentication](../developer-guide/backend/authentication.md): sequence diagrams in Mermaid

    **Why it matters:** diagrams as code are reviewed and versioned with the system they describe, so they do not quietly go out of date. They also help stakeholders understand how the system works, without reading any code.
