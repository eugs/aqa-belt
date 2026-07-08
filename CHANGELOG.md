# Changelog

All notable changes to this project are documented here.
Format follows [Keep a Changelog](https://keepachangelog.com/en/1.1.0/);
version numbers follow [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.2.0] - 2026-07-08

Parallel-test-run controls for `rt`.

### Added

- **`bin/run/par`** — manage the `PARALLEL` env var consumed by `rt`. `par` prints, `par <N>` sets, `par 0` and `par off` both clear. Rejects non-integers with a short error. No `setlocal`, so the value persists in the caller's cmd session (same pattern as `hon` / `hoff`).
- **`rt p<N> tag ...`** — inline `--parallel <N>` override for a single run. Strict grammar (`p` + digits only), always the first arg, always wins over `PARALLEL`.
- **`rt` reads `PARALLEL`** — when the env var is set and non-empty, `--parallel <N>` is spliced into the emitted `npm run retest -- ...` command; when unset, no `--parallel` flag is emitted and the underlying npm task uses its own default.

### Changed

- **`rt` usage help** — now documents all three invocation shapes and points at `par` for setting a default.
- **`bin/aqa-belt`** (backing `about`) — pad category column so command lists align across rows.

### Notes

- Backward compatible: `rt CCP1 CCP2` behaves identically to v0.1.0 when `PARALLEL` is unset.
- Precedence: **inline `p<N>` > `PARALLEL` env > no flag**. The npm task's own default is only overridden when one of the two sources sets a value.

## [0.1.0] - 2026-07-06

First stable release.

### Added

- **`bin/other/r`** — open `./report/report.html` (relative to cwd) in the default browser, with validation and colored banners.
- **`bin/run/rt`** — re-run tests by tag(s), e.g. `rt CCP37aaafef CCPd593d8dc`. Auto-prefixes `@` to tags, joins with ` or `.
- **`bin/env/`** — `env`, `d`/`dev`, `s`/`stg`, `p`/`prd`/`prod`, `e` for `ENV` switching / inspection.
- **`bin/head/`** — `h`, `hon`, `hoff` for `HEADLESS` inspection / toggling.
- **`bin/aqa-belt`** — print all available commands grouped by category, colored.
- **`about.cmd`** (repo root) — print tool description then delegate to `aqa-belt`.
- **`start.cmd`** (repo root) — interactive PATH-entry printer; walks `bin/<subdir>` one at a time, auto-copies each to clipboard, waits for keypress.
- **`README.md`** — quick start, install / uninstall via GUI, script catalog.

### Notes

- Windows cmd only. No PowerShell, no admin, no external dependencies.
- Scripts under `bin/<subdir>/` operate on the **caller's cwd** (`%CD%`), never on their own location.
- Scripts at repo root (`about.cmd`, `start.cmd`) and `bin/aqa-belt.cmd` reference sibling files via `%~dp0` — this is intentional, not a violation of the caller-cwd rule.
- Stage 3 (planned): extract shared banner helpers into `bin/_lib.cmd` and refactor scripts to `call` into it.

[0.2.0]: https://github.com/eugs/aqa-belt/releases/tag/v0.2.0
[0.1.0]: https://github.com/eugs/aqa-belt/releases/tag/v0.1.0
