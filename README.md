# aqa-belt

Personal shell helpers for Windows.

A small collection of cmd scripts that live on your `PATH` and operate on the current working directory, so you can call them from any project folder.

## Manual install

1. **Clone the repo** anywhere on disk, for example:

    ```cmd
    git clone git@github.com:eugs/aqa-belt.git C:\Tools\aqa-belt
    ```

2. **Add `<clone-dir>\bin` to your User `Path`** via the GUI:

    - Press `Win+R`, type `sysdm.cpl`, press Enter
    - Go to the **Advanced** tab → **Environment Variables...**
    - Under **User variables**, select `Path` → **Edit...**
    - Click **New**, paste the full path (e.g. `C:\Tools\aqa-belt\bin`), click **OK**
    - Click **OK** on every remaining dialog to save

3. **Open a new cmd window** — existing terminals won't see the updated `PATH`.

Verify with:

```cmd
where r
```

## Script catalog

| Command | Description                                                       |
|---------|-------------------------------------------------------------------|
| `r`     | Open `./report/report.html` (relative to cwd) in default browser. |

## Notes

- All scripts operate on the **caller's current directory** (`%CD%`), not on their own location. Run them from the project folder that owns the files.
- A **Stage 2 automated installer** (`install.cmd` / `uninstall.cmd`) is planned. For now, use the manual GUI steps above.

## Uninstall

1. Press `Win+R`, type `sysdm.cpl`, press Enter
2. **Advanced** → **Environment Variables...**
3. Under **User variables**, select `Path` → **Edit...**
4. Select the `<clone-dir>\bin` entry → **Delete** → **OK**
5. Delete the cloned repo folder if no longer needed.
