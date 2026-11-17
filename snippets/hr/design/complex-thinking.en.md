??? question "...if Barni put in a complex thought process"

    **Short answer:** yes. The decisions are documented together with the reasoning and the trade-offs in the documentation.

    **The architecture pivot** 
    
    The first plan was microservices: a Backend-for-Frontend in front of separate routing, map tile and domain services, talking over a Redpanda pipeline. Early on it became clear that running and wiring all of that would eat the time budget of the thesis, on ARM servers where every tool had to be checked for compatibility. The backend became a modular monolith instead, built so its modules can be split into services later. Routing (Valhalla) and map tiles (Martin) stayed separate services, because there the separation pays for itself.

    **Working with a beta dependency** 
    
    Halfway through, the stable MapLibre release only supported Expo SDK 54, while the app had been built on SDK 55 for months. Rolling back was more expensive than the risk, so the app moved to the MapLibre 11 beta. I would have favored rolling back if It was for an existing, contractual client. 

    **Where to look**

    - [Architectural decisions](../developer-guide/architectural-decisions.md): microservices versus a modular monolith.
    - [Technology choice](../developer-guide/design/technology-choice.md): why each tool was picked.
    - [Challenges](../summary/challenges.md): what went wrong and how it was solved.

    **Why it matters:** documenting decisions is a value. 
