# Changelog

All notable changes to this project are documented here.
Format follows [Keep a Changelog](https://keepachangelog.com/en/1.1.0/);
version numbers follow [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

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

[0.1.0]: https://github.com/eugs/aqa-belt/releases/tag/v0.1.0
