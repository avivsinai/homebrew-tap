# homebrew-tap

This is the master agent instruction file for this repository. Keep repository policy here. `AGENTS.md` exists only as a Codex compatibility shim and should contain only Codex-specific notes.

## Repository Purpose

This repository is the Homebrew tap for Aviv Sinai OSS formulas. It should track released versions only and stay aligned with release automation from the source repositories.

## Working Rules

- Default branch is `main`.
- Do not hand-edit formulas to create version drift from published releases.
- Prefer updating this repo through the owning project’s release automation.
- When editing manually, keep formula names, URLs, SHA256 values, and `version` fields consistent with the corresponding GitHub release artifacts.

## Validation

- Check `Formula/*.rb` for version and SHA consistency.
- Keep commits focused; formula-only changes should not include unrelated repository edits.
