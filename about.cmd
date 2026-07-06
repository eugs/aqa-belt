@echo off
setlocal EnableExtensions

for /f %%a in ('echo prompt $E ^| cmd') do set "ESC=%%a"

echo.
echo   %ESC%[33maqa-belt%ESC%[0m  personal cmd helpers for Windows
echo   %ESC%[90mrun any command below from any project dir%ESC%[0m

call "%~dp0bin\aqa-belt.cmd"
