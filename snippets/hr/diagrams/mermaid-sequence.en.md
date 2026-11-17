??? question "...if Barni used sequence diagrams"

    **Short answer:** yes. Authentication, token refresh and the profile upsert are all Mermaid sequence diagrams, and each one comes with a table that explains every step in words.

    This is the authentication flow, from signing in to the first protected API request, drawn live from its source file:

    ```mermaid
    --8<-- "mermaid/sequence-auth.en.mmd"
    ```

    | Step | From | To | What happens |
    |:---:|---|---|---|
    | **1** | App | Keycloak | Requests an authorization code with a PKCE `code_challenge` |
    | **2** | Keycloak | App | Returns the authorization code |
    | **3** | App | Keycloak | Exchanges the code and the `code_verifier` for tokens |
    | **4** | Keycloak | App | Returns the `access_token` and the `refresh_token` |
    | **5** | App | BFF | Sends an API request with the `access_token` as a Bearer token |
    | **6** | BFF | Keycloak | Requests the public key set (JWKS), unless it is already cached |
    | **7** | Keycloak | BFF | Returns the public key, which the BFF caches |
    | **8** | BFF | BFF | Checks the token's RS256 signature and expiry |
    | **9** | BFF | PostgreSQL | Runs the business logic |
    | **10** | PostgreSQL | BFF | Returns the result |
    | **11** | BFF | App | Sends the JSON response |

    **Where to look**

    - [Navigation](../developer-guide/mobile/navigation.md): the screen structure in detail
    - [Authentication](../developer-guide/backend/authentication.md): sequence diagrams with step-by-step tables

    **Why it matters:** a diagram shows the order of events, the table gives the details, and it's easier to digest for most of the stakeholders. Together teh diagram and the descriptive table let a reviewer follow a flow across four systems without opening the code. I picked up this habit from a great manager, and it has stuck with me ever since.
