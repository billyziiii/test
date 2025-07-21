@echo off
echo Creating and pushing to a new branch...
echo.

REM Ask user for branch name
set /p BRANCH_NAME="Enter the new branch name (e.g., feature/initial-setup, develop, staging): "

if "%BRANCH_NAME%"=="" (
    echo Error: Branch name cannot be empty!
    pause
    exit /b 1
)

echo.
echo Creating new branch: %BRANCH_NAME%
echo.

REM 1. Make sure we have a commit first
echo Checking if we have commits...
git log --oneline -1 2>nul
if errorlevel 1 (
    echo No commits found. Creating initial commit first...
    git add . --force
    git commit -m "Initial commit: Fullstack gambling app setup"
)

REM 2. Create and switch to new branch
echo Creating new branch: %BRANCH_NAME%
git checkout -b %BRANCH_NAME%

REM 3. Push to new branch
echo Pushing to new branch on GitLab...
git push -u origin %BRANCH_NAME%

echo.
echo Branch creation and push complete!
echo Current branch: %BRANCH_NAME%
echo You can now work on this branch independently.
echo.
echo To switch branches later:
echo   git checkout main
echo   git checkout %BRANCH_NAME%
echo.
pause