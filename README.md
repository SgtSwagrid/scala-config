# scala-config
The single source of truth for basic configuration across all of my Scala projects.
All configuration files contained herein are automatically copied into each of my Scala projects upon modification using [github-graph](https://github.com/SgtSwagrid/github-graph).
The list of downstream projects can be found in [graph.json](.github/graph.json).

Includes:
- Config for the [Scalafmt](https://scalameta.org/scalafmt/) linter.
- Some config for the IDEs [IntelliJ IDEA](https://www.jetbrains.com/idea/) and [Visual Studio Code](https://code.visualstudio.com/).
  Including IDE config can be controversial, but it is sanitised and helps to enable a consistent development experience.
- Git settings including `.gitignore` and `.gitattributes`.
- GitHub [Actions](https://github.com/features/actions) CI workflows to verify build integrity.
- An environment definition for GitHub [Codespaces](https://github.com/features/codespaces).
- [Scala Steward](https://github.com/scala-steward-org/scala-steward) integration for automatic updates.
- [Claude Code](https://claude.com/product/claude-code) integration with IntelliJ.
