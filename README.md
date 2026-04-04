<div align="center">
  <h1>⚙️ Scala Config</h1>
  <p>The single source of truth for basic configuration across all of my <a href="https://www.scala-lang.org/">Scala 3</a> projects.</p>
</div>

## 👷 What's the workflow?

Changes made to the configuration files contained herein are automatically copied into each dependent project using [Github Graph](https://github.com/SgtSwagrid/github-graph).
Updates to these files should be made _here_, not in any of the downstream repositories, lest they be overwritten later.

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

### Licensing

- The [MIT](https://tlo.mit.edu/understand-ip/exploring-mit-open-source-license-comprehensive-guide) license,
  which I tend to use by default as it is fairly permissive.

## 🏗️ Where is this used?

The full list of projects that rely on this configuration is defined in [`graph.json`](.github/graph.json).

## 🤔 Should I use this in my projects too?

Only if you want to, but this exists mainly for my own convenience.
I would, however, argue that these settings are reasonable defaults for most Scala 3 projects.

## 🔨 How can this be used?

You have several options:

1. If you want continuous updates as this repository evolves, open a PR to add your project(s) to [`graph.json`](.github/graph.json).
   You'll also need to send me a [PAT](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens) with write access to the corresponding repositories.
2. If you want continuous updates, but want to deviate from my template according to your own needs, fork this repository and _then_ add your project(s) to [`graph.json`](.github/graph.json) (after removing the existing projects from the list). In this case, you can add the PAT yourself.
3. If you just want the settings without the updates, click '**Use this template**' on GitHub (for a new project), or simply copy and paste the files (for an existing project).

## 👁️ See also

[Git Config](https://github.com/SgtSwagrid/git-config) is an upstream template for GitHub projects in general.
