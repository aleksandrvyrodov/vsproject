@echo off
SET /P dumpname=What is project name?
MKDIR %dumpname%
git clone git@github.com:aleksandrvyrodov/vsproject ./%dumpname%
echo.
setlocal
:PROMPT
SET /P AREYOUSURE=Remove git folder (Y/[N])?
IF /I "%AREYOUSURE%" NEQ "Y" GOTO END
RMDIR /S /Q .\%dumpname%\.git
RMDIR /S /Q .\%dumpname%\.use
ERASE ".\%dumpname%\README.md"
ERASE .\%dumpname%\.gitignore
:END
endlocal