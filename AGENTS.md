# AGENTS House Rules

These are persistent, repo-local instructions for AI assistants and automation working in this repository. Follow them in every session.

## Safety & Workflow

- Never push directly to `main`. Open a PR from a branch.
- Keep PRs small, focused, and well-titled (Conventional Commits).
- Use the PR template. Provide a clear Summary, Changes, and Testing notes.
- Confirm before destructive or sweeping changes; prefer additive or reversible edits.
- Do not modify credentials, tokens, or secrets. Never log secrets.

## Commits & Releases

- Conventional Commits for titles: `type(scope): summary` (feat, fix, docs, ci, chore, refactor, test, build, perf, revert).
- Update `CHANGELOG.md` as the canonical source for release notes.
- For releases: create short GitHub Release highlights and link to the matching changelog section.
- Use SemVer-lite during 0.x (patch=docs/CI/meta; minor=features; major=breaking).

## CI & Quality

- Ensure CI passes before merge: ShellCheck, Yamllint, Actionlint.
- Pin or avoid third-party GitHub Actions when possible; prefer native tools (e.g., apt-get install).
- Format shell with `shfmt` (2 spaces, `-i 2 -ci -bn -sr`) and fix ShellCheck findings or justify exceptions inline.

## Documentation

- Keep README concise: quick start, requirements, revert path, platform notes.
- Use CONTRIBUTING for deeper details (formatting, CI, release process).
- Prefer clarity over cleverness; reflect actual behavior (e.g., PATH-based shfmt vs wrapper).

## Scope Discipline

- Make only changes explicitly requested or necessary to complete the task.
- If you discover useful adjacent improvements, propose them in the PR description; do not include unless approved.

## Branch Strategy

- Branch naming: `type/scope/short-description` (e.g., `ci/shellcheck-native`, `docs/readme-badges`).
- Keep linear history; avoid force-push to shared branches.

## Communication

- Be explicit about assumptions and side effects.
- When uncertain, ask for confirmation with clear options.

## Local Overrides & Safety

- Respect user-local overrides (e.g., `*.local` files) and avoid clobbering personalized settings.
- For installers or scripts, provide a `--dry-run` option when adding new ones.

## Examples

- Good PR title: `ci(shellcheck): install and run native shellcheck on ubuntu-latest`
- Good commit title: `docs(readme): clarify shfmt from PATH`

By following these, assistants and humans can collaborate safely and consistently.
