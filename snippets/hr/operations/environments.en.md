??? question "...if Barni uses different environments"

    **Short answer:** yes, `development`, `production` and `pre-production` were planned for this project.

    In `development` for example, the backend and its database run on the developer machine, while the heavy services (Keycloak, Valhalla and Martin) stay on the Vesta server and are reached over Tailscale. This is the development setup, drawn live from its source file:

    ```plantuml
    --8<-- "plantuml/deployment-dev.puml"
    ```

    | | Development | Production |
    |---|---|---|
    | Backend | Runs locally with hot reload | Docker Compose on the Vesta server |
    | Database | Local PostgreSQL, schema created automatically | PostGIS container, schema sync turned off |
    | Configuration | `.env.development` | `.env.production` |
    | Mobile build | EAS `development` profile with the dev client | EAS `production` profile, release APK |
    | Backend address | A local address | `https://api.charted.hu` |

    A third EAS profile, `preview`, builds a release version for internal testing before production.

    - **No secrets in Git:** `.env` files are ignored, and every repository has a `.env.example` that lists the variables without values.
    - **Nothing sensitive in the app:** variables with the `EXPO_PUBLIC_` prefix end up in the app bundle, so they never hold secrets.
    - **Safe defaults in production:** automatic schema changes are off, and turning them on for the first start is a deliberate, documented step.

    **Where to look**

    - [Development environment](../developer-guide/deployment/dev-environment.md): how to run everything locally
    - [Configuration](../developer-guide/deployment/configuration.md): every environment variable and what it does
    - [Infrastructure](../developer-guide/architecture/infrastructure.md): development and production deployment diagrams

    **Why it matters:** keeping environments apart means experiments never touch real users' data, and production behaves the same way every time it starts.
