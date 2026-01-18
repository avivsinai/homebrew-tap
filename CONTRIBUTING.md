# Contributing

Thanks for your interest in contributing!

## How This Repo Works

This Homebrew tap is **automatically updated** by [GoReleaser](https://goreleaser.com/) when new versions of the CLIs are released:
- [bitbucket-cli](https://github.com/avivsinai/bitbucket-cli)
- [jenkins-cli](https://github.com/avivsinai/jenkins-cli)

You typically don't need to manually edit formula files.

## When to Contribute

Contributions are welcome for:
- Fixing formula issues (install problems, test failures)
- Improving documentation
- Adding new formulas (with prior discussion)

## How to Contribute

1. Fork this repository
2. Create a branch (`git checkout -b fix/formula-issue`)
3. Make your changes
4. Test locally: `brew install --build-from-source ./Formula/<name>.rb`
5. Commit with a clear message
6. Open a Pull Request

## Testing Formulas

```bash
# Install from local formula
brew install --build-from-source ./Formula/bitbucket-cli.rb

# Run formula audit
brew audit --strict ./Formula/bitbucket-cli.rb

# Test the formula
brew test ./Formula/bitbucket-cli.rb
```

## Questions?

Open an issue or reach out via the main CLI repositories.
