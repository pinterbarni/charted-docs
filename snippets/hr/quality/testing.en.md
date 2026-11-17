??? question "...if Barni tests his work"

    **Short answer:** yes. The app is covered by 56 test scenarios with 170 steps, written as behavior-driven GIVEN, WHEN, THEN tables.

    !!! note

        This part could have been built more thoroughly, for example with automated unit and end-to-end tests running in a CI pipeline. **I kept it to documented manual test scenarios on purpose**, because the thesis evaluation did not award points for test automation or unit tests.

    | Area | Scenarios |
    |---|:---:|
    | Authentication and sessions | 6 |
    | Permissions | 9 |
    | Profile | 13 |
    | Social features | 8 |
    | Routes | 11 |
    | Settings | 6 |
    | Offline mode | 3 |

    The API is tested with Bruno collections, kept in the repository.

    **Where to look**

    - [Test cases](../developer-guide/test-cases/index.md): every scenario, by area

    **Why it matters:** GIVEN, WHEN, THEN reads the same for any stakeholder, it's a great way to tackle tests.
