??? question "...if Barni takes security seriously"

    **Short answer:** yes, from the sign-in flow down to the network.

    - **No passwords in the app:** sign-in uses Keycloak with the OAuth2 authorization code flow and PKCE, the standard for mobile apps.
    - **No secrets in the backend:** tokens are validated against Keycloak's public keys (JWKS), cached for five minutes, so no shared secret is stored and most requests need no call to Keycloak.
    - **Secure by default:** a global JWT guard protects every endpoint, and only the health check is public. Rate limiting is on.
    - **Tokens stored safely:** the app keeps them in the device's secure storage and refreshes them automatically.
    - **Small attack surface:** only the edge server is public, behind nginx with TLS. The servers talk to each other only through encrypted tunnels on a Tailscale mesh VPN.
    - **Separated networks:** the servers run on their own isolated network, while the development machine and every other device stay on the guest network.
    - **Separated environments:** development and pre-production each have their own configuration, database and secrets, so testing never touches real user data and a development key never works on the servers.
    - **Monitored:** the public health endpoint is watched by a self-hosted Uptime Kuma instance, so downtime is noticed right away.
    - **Secrets stay out of Git:** they are never committed. Each repository has separate `.env.development`, `.env.preprod` and `.env.prod` files, which Git ignores, and a `.env.example` that lists the variables without values.
    - **Secrets stay out of AI tools:** no key, password or token was ever shared with an AI assistant.

    **Where to look**

    - [Authentication](../developer-guide/backend/authentication.md): the sign-in and token refresh flows
    - [Infrastructure](../developer-guide/architecture/infrastructure.md): the two servers and the network around them

    **Why it matters:** security is a core value of any production system, so I built it in from the start, as thoroughly as I could.
