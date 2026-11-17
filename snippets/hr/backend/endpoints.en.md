??? question "...how many endpoints Barni wrote, and how RESTful they are"

    **Short answer:** 35 endpoints across the profile, trail, social, route, report and health areas, plus 2 proxy routes to the routing engine and the map tile server.

    ```mermaid
    pie showData title Endpoints by HTTP method
        "GET" : 20
        "POST" : 8
        "DELETE" : 6
        "PATCH" : 3
    ```

    - **Resources:** one resource, several methods. `/api/profile/me` is read with `GET`, created on first sign-in with `POST` and edited with `PATCH`.
    - **Partial updates use `PATCH`:** only the changed fields are sent.
    - **Documented:** Swagger (OpenAPI) is generated from `@nestjs/swagger` decorators and served at `/api/docs`.
    - **Tested as code:** the requests live in Bruno collections, plain text `.bru` files kept in the repository next to the code. *([Bruno](https://www.usebruno.com/) is an API client, just like Postman.)*
    - **One door policy:** the mobile app never calls Valhalla or Martin directly. Every request goes through the backend, which keeps keys and caching on the server.


    **Where to look**
    - [API endpoints](../developer-guide/backend/api-endpoints.md): every endpoint, grouped by controller
    - [Proxy modules](../developer-guide/backend/proxy-modules.md): how the routing and tile proxies work

    **Why it matters:** a predictable API is one that a frontend developer can use from the docs alone, without asking the backend developer.
