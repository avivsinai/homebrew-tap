# Homebrew Tap

Homebrew formulae for [avivsinai](https://github.com/avivsinai) CLI tools.

## Available Formulae

| Formula | Binary | Description |
|---------|--------|-------------|
| `bitbucket-cli` | `bkt` | CLI for Bitbucket Cloud - manage repos, PRs, and pipelines |
| `jenkins-cli` | `jk` | CLI for Jenkins - GitHub CLI-style workflows for Jenkins |

## Installation

```bash
# Install Bitbucket CLI
brew install avivsinai/tap/bitbucket-cli

# Install Jenkins CLI
brew install avivsinai/tap/jenkins-cli
```

Or tap first, then install:

```bash
brew tap avivsinai/tap
brew install bitbucket-cli
brew install jenkins-cli
```

## Usage

After installation:

```bash
# Bitbucket CLI
bkt --help
bkt auth login
bkt pr list

# Jenkins CLI
jk --help
jk auth login
jk job list
```

## Updating

```bash
brew update
brew upgrade bitbucket-cli
brew upgrade jenkins-cli
```

## Uninstalling

```bash
brew uninstall bitbucket-cli
brew uninstall jenkins-cli
brew untap avivsinai/tap  # optional
```

## Links

- [bitbucket-cli on GitHub](https://github.com/avivsinai/bitbucket-cli)
- [jenkins-cli on GitHub](https://github.com/avivsinai/jenkins-cli)

## Security

This repository uses [gitleaks](https://github.com/gitleaks/gitleaks) for secret scanning to prevent accidental credential exposure.

## License

MIT
