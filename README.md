# Homebrew Tap

Homebrew formulae for [avivsinai](https://github.com/avivsinai) CLI tools.

## Available Formulae

| Formula | Alias | Binary | Description |
|---------|-------|--------|-------------|
| `amq` | - | `amq` | Agent Message Queue - file-based inter-agent messaging for Claude Code and Codex CLI |
| `bitbucket-cli` | `bkt` | `bkt` | CLI for Bitbucket Cloud - manage repos, PRs, and pipelines |
| `jk` | - | `jk` | CLI for Jenkins - GitHub CLI-style workflows for Jenkins |
| `shaon` | - | `shaon` | Automate Hilanet attendance, payslips, salary, and reports for your own account |
| `yoetz` | - | `yoetz` | Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents |

## Installation

```bash
# Agent Message Queue
brew install avivsinai/tap/amq

# Install Bitbucket CLI (either works)
brew install avivsinai/tap/bitbucket-cli
brew install avivsinai/tap/bkt  # alias

# Install Jenkins CLI
brew install avivsinai/tap/jk

# Hilanet attendance CLI
brew install avivsinai/tap/shaon

# LLM council / gateway
brew install avivsinai/tap/yoetz
```

Or tap first, then install:

```bash
brew tap avivsinai/tap
brew install amq
brew install bitbucket-cli
brew install jk
brew install shaon
brew install yoetz
```

## Usage

After installation:

```bash
# Agent Message Queue
amq --help
amq --version

# Bitbucket CLI
bkt --help
bkt auth login
bkt pr list

# Jenkins CLI
jk --help
jk auth login
jk job list

# Hilanet attendance CLI
shaon --help
shaon --version

# LLM council / gateway
yoetz --help
yoetz --version
```

## Updating

```bash
brew update
brew upgrade amq
brew upgrade bitbucket-cli
brew upgrade jk
brew upgrade shaon
brew upgrade yoetz
```

## Uninstalling

```bash
brew uninstall amq
brew uninstall bitbucket-cli
brew uninstall jk
brew uninstall shaon
brew uninstall yoetz
brew untap avivsinai/tap  # optional
```

## Links

- [agent-message-queue on GitHub](https://github.com/avivsinai/agent-message-queue)
- [bitbucket-cli on GitHub](https://github.com/avivsinai/bitbucket-cli)
- [jenkins-cli on GitHub](https://github.com/avivsinai/jenkins-cli)
- [shaon on GitHub](https://github.com/avivsinai/shaon)
- [yoetz on GitHub](https://github.com/avivsinai/yoetz)

## Security

This repository uses [gitleaks](https://github.com/gitleaks/gitleaks) for secret scanning to prevent accidental credential exposure.

## License

MIT
