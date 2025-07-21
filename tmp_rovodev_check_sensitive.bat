@echo off
echo Checking for sensitive files that should not be committed...
echo.

REM Check for database files
if exist "apps\server\prisma\dev.db" (
    echo [WARNING] Found: apps\server\prisma\dev.db - This should NOT be committed!
    echo Removing from tracking...
    git rm --cached apps\server\prisma\dev.db 2>nul
)

REM Check for .env files
if exist ".env" (
    echo [WARNING] Found: .env file - This should NOT be committed!
)

REM Check for log files
if exist "debug.log" (
    echo [WARNING] Found: debug.log - This should NOT be committed!
)

if exist "error.log" (
    echo [WARNING] Found: error.log - This should NOT be committed!
)

echo.
echo Sensitive file check complete.
echo Now you can safely run the git setup script.
pause