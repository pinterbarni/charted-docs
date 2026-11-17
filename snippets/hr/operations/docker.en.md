??? question "...if Barni can work with Docker images"

    **Short answer:** yes. Every backend service runs as a container, built or chosen to run natively on the ARM64 processors of the Raspberry Pi servers.

    !!! note

        This part could have been built more thoroughly, for example with a fully automated deployment pipeline, and documented in more depth. I kept both simple on purpose, because the thesis evaluation did not award points for them.

    | Service | Image | Notes |
    |---|---|---|
    | NestJS backend | Built from its own Dockerfile | An ARM64 image, built and started with Docker Compose |
    | PostgreSQL with PostGIS | `imresamu/postgis:16-3.4` | A community image, because the official one does not run natively on ARM64 |
    | Keycloak and its own PostgreSQL | Official images | On a separate Docker network from the application |
    | Martin | Official image | Serves map tiles straight from the PostGIS database |
    | Valhalla | Official image | Plans walking routes |

    - **Networks keep services apart:** the backend and its database share one Docker network, and Keycloak with its own database runs on another, so a problem in one cannot reach the other's data.
    - **Health checks:** Docker Compose watches the backend's public health endpoint to know when the container is really up.
    - **One command to deploy:** the backend is rebuilt and restarted on the server with a single `docker compose up -d --build`.
    - **Data lives in volumes:** the databases keep their data in Docker volumes, detached from the containers, so a container can be rebuilt, updated or replaced without losing anything.
    - **Ready for automation:** a self-hosted Drone CI server already runs next to the containers, and connecting it to an automated deploy pipeline is planned for the next version.

    **Where to look**

    - [Docker](../developer-guide/deployment/docker.md): every container and the server it runs on
    - [CI/CD](../developer-guide/deployment/ci-cd.md): mobile build profiles and the backend deployment
    - [Challenges](../summary/challenges.md): finding a PostgreSQL image that runs on ARM


    **Why it matters:** containers make every environment start the same way.
