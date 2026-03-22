# ⚙️ scala-config

The single source of truth for basic configuration across all of my [Scala](https://www.scala-lang.org/) projects.

## 👷 How does the workflow go?

Changes made to the configuration files contained herein are automatically copied into each dependent project using [github-graph](https://github.com/SgtSwagrid/github-graph).

## 📋 What's included?

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

## 🏗️ Where is this used?

The full list of projects that rely on this configuration is defined in [graph.json](.github/graph.json).

## 🤔 Should I use this too?

Only if you want to, but know that this is primarily for my own convenience.
