@echo off
rem par - manage PARALLEL env var (consumed by rt)
rem   par            print current PARALLEL
rem   par <N>        set PARALLEL=<N>
rem   par 0 | off    clear PARALLEL

if "%~1"=="" goto :show
if /i "%~1"=="off" goto :clear

call :is_non_negative_int "%~1"
if errorlevel 1 (
    echo [!] par: expected a positive integer, 0, or off
    exit /b 1
)

if "%~1"=="0" goto :clear

set "PARALLEL=%~1"
goto :show

:clear
set "PARALLEL="
goto :show

:show
echo PARALLEL=%PARALLEL%
exit /b 0

:is_non_negative_int
setlocal
set "arg=%~1"
set /a "_v=%arg%" 2>nul >nul
if errorlevel 1 ( endlocal & exit /b 1 )
if not "%_v%"=="%arg%" ( endlocal & exit /b 1 )
if %_v% LSS 0 ( endlocal & exit /b 1 )
endlocal & exit /b 0
