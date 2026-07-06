@echo off
setlocal EnableExtensions EnableDelayedExpansion

for /f %%a in ('echo prompt $E ^| cmd') do set "ESC=%%a"

set "binDir=%~dp0"
if "%binDir:~-1%"=="\" set "binDir=%binDir:~0,-1%"

echo.
for /d %%D in ("%binDir%\*") do (
    set "line="
    for %%F in ("%%D\*.cmd") do (
        if defined line (
            set "line=!line! %%~nF"
        ) else (
            set "line=%%~nF"
        )
    )
    echo   %ESC%[36m%%~nxD%ESC%[0m  !line!
)
echo.
