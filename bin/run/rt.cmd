@echo off
setlocal EnableExtensions EnableDelayedExpansion

rem Usage:
rem   rt.cmd CCP37aaafef CCPd593d8dc
rem   rt.cmd @CCP37aaafef @CCPd593d8dc CCPe277233d

if "%~1"=="" (
  echo Usage: %~nx0 tag1 [tag2 ...]
  echo Example: %~nx0 CCP37aaafef CCPd593d8dc
  exit /b 1
)

set "TAGS_EXPR="

:build
if "%~1"=="" goto run

set "TAG=%~1"

rem Add leading @ if missing
if /I not "!TAG:~0,1!"=="@" set "TAG=@!TAG!"

rem Join tags with:  or 
if defined TAGS_EXPR (
  set "TAGS_EXPR=!TAGS_EXPR! or !TAG!"
) else (
  set "TAGS_EXPR=!TAG!"
)

shift
goto build

:run
set "PARALLEL_ARG="
if defined PARALLEL if not "%PARALLEL%"=="" set "PARALLEL_ARG= --parallel %PARALLEL%"
echo Running: npm run retest --!PARALLEL_ARG! --tags "!TAGS_EXPR!"
npm run retest --!PARALLEL_ARG! --tags "!TAGS_EXPR!"
set "EXITCODE=%ERRORLEVEL%"

endlocal & exit /b %EXITCODE%
