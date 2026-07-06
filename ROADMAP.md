# Roadmap

Ideas to consider for future versions. Nothing here is committed; items may be dropped, deferred, or reshaped.

## Ideas

### Rename `start.cmd`

`start` is a built-in Windows cmd command (opens a program / URL / new window). Running `start` from a fresh cmd session resolves to the built-in, not our script; only `.\start` or `start.cmd` invokes ours. Confusing.

Candidates:
- `setup.cmd`
- `install.cmd`
- `pathgen.cmd`
- `install-paths.cmd`

### Clearer messages in the PATH-entry printer

Current prompts (`[copied - paste, any key]`, `Open a NEW cmd window`) work but assume the user already knows what "paste where" means. Should walk through the GUI opening explicitly the first time — e.g. explicit `Win+R → sysdm.cpl` line on screen — and confirm each paste happened before moving on.

### Rethink whether adding directories is even needed

Current design: every `bin/<subdir>` gets added to `PATH` individually. That's N entries per install and N entries to remove on uninstall. Friction.

Alternatives:
- **Flatten `bin/`** — drop the category subdirs; put every `.cmd` directly in `bin/`. One PATH entry total. Categories move into naming (`env-d`, `env-s`, `head-on`) or into the `about` output only.
- **Wrapper stubs in `bin/`** — keep subdirs for organization, but generate a thin `bin/<name>.cmd` per command that `call`s the real one. Only `bin/` needs to be on PATH.
- **Single dispatcher** — one command on PATH (`aqa`), everything invoked as `aqa r`, `aqa dev`, `aqa hon`. Namespaces the whole tool but changes the muscle memory.

Trade-off to decide: install friction vs. organizational clarity vs. invocation ergonomics.

### Support other terminals / shells

Currently cmd-only. Consider adding parallel implementations for:
- **PowerShell** (`.ps1`) — most-used on modern Windows; different quoting, error handling, and `PATH` semantics.
- **Git Bash / WSL** (`.sh`) — needed if any team member works in a POSIX-like shell.

Open question: keep one command name per script and dispatch by shell, or namespace (`r.cmd` / `r.ps1` / `r.sh`) and let each shell's PATH resolution pick the right one?

### User-defined shortcuts on top of the tool

Let users register their own aliases without editing the repo. Ideas:
- A `bin/user/` (git-ignored) subdir the installer also adds to PATH — drop-in personal scripts alongside the shipped ones.
- A config file (`~/.aqa-belt` or repo-local `user.cmd`) sourced on shell start that defines project-specific shortcuts.
- A generator command: `aqa new r-staging` scaffolds a new script from a template.

Open question: is this for personal per-user tweaks, or for team-shared but project-local overrides? The answer changes where the file lives (home dir vs. project dir).
