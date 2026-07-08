# aqa-belt

Personal shell helpers for Windows.

A small collection of cmd scripts that live on your `PATH` and operate on the current working directory, so you can call them from any project folder.

Scripts are grouped by category under `bin/`:

```
bin/
├── env/    # environment switching (dev / stg / prd, ...)
├── head/   # headless toggles
├── other/  # misc helpers (report opener, ...)
└── run/    # test runners
```

Each subfolder is added to `PATH` individually.

## Quick start

```cmd
git clone git@github.com:eugs/aqa-belt.git C:\Tools\aqa-belt
cd C:\Tools\aqa-belt
about
```

`about` prints the tool description and all available commands grouped by category. Then follow **Install** below to make them callable from anywhere.

## Install

1. **Clone** the repo anywhere on disk, for example:

    ```cmd
    git clone git@github.com:eugs/aqa-belt.git C:\Tools\aqa-belt
    ```

2. **List the paths to add** — run from the repo root:

    ```cmd
    start.cmd
    ```

    It walks each `bin/<subdir>` one by one, copies each to the clipboard, and waits for a keypress.

3. **Add them to your User `Path`** via the GUI:

    - Press `Win+R`, type `sysdm.cpl`, press Enter
    - **Advanced** → **Environment Variables...**
    - Under **User variables**, select `Path` → **Edit...**
    - Click **New** and paste each path (one entry per line), click **OK**
    - Click **OK** on every remaining dialog to save

4. **Open a new cmd window** — existing terminals won't see the updated `PATH`.

Verify with:

```cmd
where r
```

## Script catalog

| Command | Category | Description                                                       |
|---------|----------|-------------------------------------------------------------------|
| `r`     | other    | Open `./report/report.html` (relative to cwd) in default browser. |
| `rt`    | run      | Re-run tests by tag(s): `rt CCP1 CCP2` or `rt p4 CCP1` (`--parallel 4` for this run only). |
| `par`   | run      | Manage `PARALLEL` env consumed by `rt`. `par` prints, `par 4` sets, `par off` / `par 0` clears. |
| `env`   | env      | Print current `ENV` value.                                        |
| `d` / `dev`   | env | Switch `ENV` to `dev`.                                            |
| `s` / `stg`   | env | Switch `ENV` to `stg`.                                            |
| `p` / `prd` / `prod` | env | Switch `ENV` to `prd`.                                     |
| `e`     | env      | Prompt-based `ENV` picker.                                        |
| `h`     | head     | Print current `HEADLESS` value.                                   |
| `hon`   | head     | Set `HEADLESS=true`.                                              |
| `hoff`  | head     | Set `HEADLESS=false`.                                             |

## Notes

- All scripts operate on the **caller's current directory** (`%CD%`), not on their own location. Run them from the project folder that owns the files.
- **Stage 3** (planned): extract shared banner helpers into `bin/_lib.cmd` and refactor scripts to `call` into it.

## Uninstall

1. Press `Win+R`, type `sysdm.cpl`, press Enter
2. **Advanced** → **Environment Variables...**
3. Under **User variables**, select `Path` → **Edit...**
4. Delete every `<clone-dir>\bin\<subdir>` entry → **OK**
5. Delete the cloned repo folder if no longer needed.
