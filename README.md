<h1 align="center">⚙️ Scala Config</h1>

<p align="center">The single source of truth for basic configuration across all of my <a href="https://www.scala-lang.org/">Scala</a>[Scala] projects.</p>

## What's the workflow?

Changes made to the configuration files contained herein are automatically copied into each dependent project using [github-graph](https://github.com/SgtSwagrid/github-graph).
Updates to these files should be made _here_, not in any of the downstream repositories, lest they be overwritten later.

## What's included?

### Continuous integration

- Git settings including `.gitignore` and `.gitattributes`.
- Config for [Scalafmt](https://scalameta.org/scalafmt/), the main [linter](https://en.wikipedia.org/wiki/Lint_(software)) of the Scala ecosystem.
- GitHub [Actions](https://github.com/features/actions) workflows to verify build integrity.
- [Scala Steward](https://github.com/scala-steward-org/scala-steward) integration for automatic dependency updates.

### IDE configuration

- Some config for [IntelliJ IDEA](https://www.jetbrains.com/idea/) and [Visual Studio Code](https://code.visualstudio.com/).
  Including IDE config can be controversial, but it is sanitised and helps to enable a consistent development experience.
- [Claude Code](https://claude.com/product/claude-code) integration with IntelliJ.
- An environment definition for GitHub [Codespaces](https://github.com/features/codespaces).

### Licensing

- The [MIT](https://tlo.mit.edu/understand-ip/exploring-mit-open-source-license-comprehensive-guide) license,
  which I tend to use by default as it is fairly permissive.

## Where is this used?

The full list of projects that rely on this configuration is defined in [graph.json](.github/graph.json).

## Should I use this too?

Only if you want to, but it's primarily for my own convenience.
