@echo off
setlocal EnableExtensions EnableDelayedExpansion

set "PROG=%~n0"

rem Usage:
rem   rt CCP37aaafef CCPd593d8dc
rem   rt @CCP37aaafef @CCPd593d8dc CCPe277233d
rem   rt p4 CCP1 CCP2               (--parallel 4, overrides PARALLEL env)
rem   set default parallelism via `par <N>`; clear via `par off`

if "%~1"=="" goto :usage

rem Optional inline p<N> as the first arg (positive integer only)
set "INLINE_PAR="
call :extract_inline_par "%~1"
if defined INLINE_PAR shift

if "%~1"=="" goto :usage

set "TAGS_EXPR="

:build
if "%~1"=="" goto :run

set "TAG=%~1"

rem Add leading @ if missing
if /I not "!TAG:~0,1!"=="@" set "TAG=@!TAG!"

rem Join tags with ' or '
if defined TAGS_EXPR (
  set "TAGS_EXPR=!TAGS_EXPR! or !TAG!"
) else (
  set "TAGS_EXPR=!TAG!"
)

shift
goto :build

:run
set "PARALLEL_ARG="
if defined INLINE_PAR (
    set "PARALLEL_ARG= --parallel !INLINE_PAR!"
) else (
    if defined PARALLEL if not "!PARALLEL!"=="" set "PARALLEL_ARG= --parallel !PARALLEL!"
)
echo Running: npm run retest --!PARALLEL_ARG! --tags "!TAGS_EXPR!"
npm run retest --!PARALLEL_ARG! --tags "!TAGS_EXPR!"
set "EXITCODE=%ERRORLEVEL%"

endlocal & exit /b %EXITCODE%

:usage
echo Usage: %PROG% [p^<N^>] tag1 [tag2 ...]
echo.
echo   %PROG% CCP1 CCP2
echo   %PROG% p4 CCP1 CCP2          override PARALLEL for this run
echo.
echo   Default parallelism: par ^<N^>   ^|   clear: par off
exit /b 1

:extract_inline_par
set "_a=%~1"
if not "%_a:~0,1%"=="p" if not "%_a:~0,1%"=="P" exit /b 0
set "_r=%_a:~1%"
if not defined _r exit /b 0
set /a "_n=_r" 2>nul >nul
if errorlevel 1 exit /b 0
if not "%_n%"=="%_r%" exit /b 0
if %_n% LSS 1 exit /b 0
set "INLINE_PAR=%_n%"
exit /b 0
