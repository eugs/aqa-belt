@echo off
setlocal EnableExtensions

for /f %%a in ('echo prompt $E ^| cmd') do set "ESC=%%a"

set "root=%~dp0"
if "%root:~-1%"=="\" set "root=%root:~0,-1%"
set "binDir=%root%\bin"

if not exist "%binDir%" (
    echo %ESC%[31m[!] bin not found: %binDir%%ESC%[0m
    exit /b 1
)

echo.
echo %ESC%[36mUser Path -^> Edit -^> New -^> Ctrl+V. Any key = next.%ESC%[0m
echo.

for /d %%D in ("%binDir%\*") do call :emit "%%~fD"

echo.
echo %ESC%[32mDone. Open a NEW cmd window.%ESC%[0m
exit /b 0

:emit
<nul set /p "=%~1" | clip
<nul set /p "=%ESC%[33m%~1%ESC%[0m %ESC%[90m[copied - paste, any key]%ESC%[0m"
pause >nul
echo.
goto :eof
