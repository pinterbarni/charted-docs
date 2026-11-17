??? question "...if Barni can ship to production"

    **Short answer:** yes. Charted runs on self-hosted hardware, and the API and sign-in are live at `api.charted.hu` and `sso.charted.hu`.

    - **Edge server (Janus):** nginx as a reverse proxy with TLS, routing each domain to the right service.
    - **Application server (Vesta):** Docker Compose with the NestJS backend, PostgreSQL with PostGIS, Keycloak with its own database, Valhalla for routing and Martin for map tiles, on separate Docker networks.
    - **Mobile builds:** three EAS profiles, for development, internal testing and production, with the build number increased automatically.
    - **Health checks:** Docker Compose watches a public health endpoint to know when the backend is up.

    The first deployment taught a few lessons: the database schema had to be created on the first start, TLS was needed earlier than expected, and PostgreSQL needed a community image to run on ARM.

    **Where to look**

    - [Docker](../developer-guide/deployment/docker.md): every service and where it runs
    - [Challenges](../summary/challenges.md): what went wrong on the first deployment

    **Why it matters:** this project runs on set up and maintained hardware.
