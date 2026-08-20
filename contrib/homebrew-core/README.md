# Homebrew/homebrew-core draft: bitbucket-cli

This directory is a **draft** for a later [Homebrew/homebrew-core](https://github.com/Homebrew/homebrew-core) submission. It is not a tap formula. `brew tap avivsinai/tap` only loads `Formula/*.rb`. Do not move this file there.

The live tap formula is `Formula/bitbucket-cli.rb` (GoReleaser bottles, binary `bkt`). Leave it alone. Do not rename the tap command.

Do not open a Homebrew/homebrew-core PR from this tap PR.

## Why the formula is named `bitbucket-cli`

Homebrew formula names are unique across core. `bkt` is already taken by [dimo414/bkt](https://github.com/dimo414/bkt): a Rust CLI that caches subprocess output (`Formula/b/bkt.rb`, bottles live). avivsinai/bitbucket-cli cannot ship on core as `bkt`.

The formula name matches the GitHub repository and the Go module.

## Why the binary is not `bkt`

Core already installs one `bkt` binary: dimo414/bkt. A second `bkt` is a hard conflict. This draft installs `bitbucket-cli`.

The upstream main package is `./cmd/bkt`. The installed filename is still `bitbucket-cli`. Cobra `Use` stays `bkt`, so `--version` prints `bkt version <ver>`. That does not change the on-disk binary name.

## Submit to Homebrew/homebrew-core

When you are ready:

1. Fork [Homebrew/homebrew-core](https://github.com/Homebrew/homebrew-core).
2. Copy `bitbucket-cli.rb` to `Formula/b/bitbucket-cli.rb` in that fork, or generate a starting point with:

   ```bash
   brew create https://github.com/avivsinai/bitbucket-cli/archive/refs/tags/v0.31.0.tar.gz --set-name bitbucket-cli
   ```

   Replace the generated body with this draft. Recompute `sha256` from the source tarball (`curl` + `shasum -a 256`). Do not invent it.

3. Audit and build against core:

   ```bash
   brew audit --new --strict --online bitbucket-cli
   HOMEBREW_NO_INSTALL_FROM_API=1 brew install --build-from-source bitbucket-cli
   brew test bitbucket-cli
   brew livecheck bitbucket-cli
   ```

4. Open a PR on Homebrew/homebrew-core. State the name collision with dimo414/bkt in the PR body. The install path is `bitbucket-cli`, not `bkt`.

`brew create` without `--set-name bitbucket-cli` will guess `bkt` from the repository binary. That guess is wrong for core. Override it.
