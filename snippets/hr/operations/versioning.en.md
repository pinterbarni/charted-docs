??? question "...if Barni uses version control"

    **Short answer:** yes, every day. Git history was not part of the submitted thesis, because the `.git` got removed from the submitted source, with the .env files. If you want to see a simplified example, check out the VC of this documentation. 

    The [charted-docs repository](https://github.com/pinterbarni/charted-docs) follows GitHub flow:

    - a short-lived branch for every feature or fix, merged with `--no-ff`, so each feature stays visible in the history
    - small commits with one idea each, written as [Conventional Commits](https://www.conventionalcommits.org/) (`feat:`, `fix:`, `docs:`, `ci:`)
    - versioned documentation with mike: `latest` is the living version, and `1.0.0` will freeze the submitted text

    Also worked with Git-flow, with its `develop`, `release` and `hotfix` branches. I usually pick the model that fits the release cycle, nowadays lean toward using the least for hobby projects.

    **Where to look**

    - [Commit history](https://github.com/pinterbarni/charted-docs/commits/main): the branches and merges, as they happened

    **Why it matters:** documentation is key of a manageable codebase.
