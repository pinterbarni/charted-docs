??? question "...if Barni treats documentation like code"

    **Short answer:** yes, and you are reading the proof. This site is built, checked and deployed like software.

    - **Built from source:** Material for MkDocs, with dependencies pinned by uv.
    - **Bilingual:** Hungarian and English from the same structure, with mkdocs-static-i18n.
    - **Versioned:** mike publishes `latest` and, later, the frozen `1.0.0` to GitHub Pages.
    - **Checked on every push:** reusable GitHub Actions workflows build the site, check every link, spellcheck both languages with cspell, and lint the shell scripts with ShellCheck.
    - **Measured:** scripts report how many pages are finished and described in each language.
    - **Diagrams as code:** Mermaid and PlantUML sources, rendered during the build.

    **Where to look**

    - [The repository](https://github.com/pinterbarni/charted-docs): the workflows, scripts and configuration

    **Why it matters:** broken links and typos are caught by a machine before a reader finds them. Docs shall stay coherent and help stakeholders, not confuse them.
