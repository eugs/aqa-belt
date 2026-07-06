@echo off
REM Open the report in the default browser with validation

REM Variables
set reportDir=report
set reportFile=report.html

if not exist %reportDir% (
    echo ----------
    echo [!] ERROR: '%reportDir%' directory not found!
    echo ----------
    timeout /t 1 /nobreak
    exit /b 1
)

if not exist %reportDir%\%reportFile% (
    echo.
    echo ----------
    echo [!] ERROR: '%reportFile%' not found!
    echo %reportDir%:
    dir /b %reportDir%
    echo ----------
    timeout /t 1 /nobreak
    exit /b 1
)

echo.
echo ======================================
echo   [*] Found the report...
echo   [*] Opening in browser...
echo ======================================
start %reportDir%\%reportFile%
