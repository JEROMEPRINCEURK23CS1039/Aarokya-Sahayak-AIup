@echo off
echo ================================================
echo   GITHUB SETUP SCRIPT
echo ================================================
echo.

echo Step 1: Checking Git installation...
where git >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] Git is not installed!
    echo Please install Git from: https://git-scm.com/download/win
    pause
    exit /b 1
)
echo [OK] Git is installed

echo.
echo Step 2: Initializing Git repository...
if exist .git (
    echo [OK] Git repository already initialized
) else (
    git init
    echo [OK] Git repository initialized
)

echo.
echo Step 3: Checking .gitignore...
if exist .gitignore (
    echo [OK] .gitignore exists
) else (
    echo [WARNING] .gitignore not found
)

echo.
echo Step 4: Adding files to Git...
git add .
echo [OK] Files staged

echo.
echo Step 5: Creating first commit...
git commit -m "Initial commit: Healthcare AI Application"
if %ERRORLEVEL% EQU 0 (
    echo [OK] Commit created
) else (
    echo [WARNING] Commit may have failed or nothing to commit
)

REM Configure local git user with provided email (update this to your preferred name if needed)
set "GIT_USER_EMAIL=jeromeprince@karunya.edu.in"
for /f "tokens=1 delims=@" %%a in ("%GIT_USER_EMAIL%") do set "USER_PART=%%a"
set "GIT_USER_NAME=%USER_PART%"

echo.
echo Step 6: Configuring Git local user/email...
git config user.email "%GIT_USER_EMAIL%"
git config user.name "%GIT_USER_NAME%"
echo [OK] Git local user configured as %GIT_USER_NAME% <%GIT_USER_EMAIL%>

echo.
REM If a GitHub repository URL was provided as the first argument, configure remote and push
set "REPO_URL=%~1"
if not "%REPO_URL%"=="" (
    echo.
    echo Step 7: Configuring remote origin to: %REPO_URL%
    for /f "tokens=*" %%r in ('git remote') do set HAS_REMOTE=%%r
    if "%HAS_REMOTE%"=="origin" (
        echo [INFO] Remote 'origin' already exists. Updating URL...
        git remote set-url origin %REPO_URL%
    ) else (
        git remote add origin %REPO_URL%
    )

    echo.
    echo Step 8: Ensuring default branch is 'main' and pushing...
    git branch -M main
    git push -u origin main
    if %ERRORLEVEL% EQU 0 (
        echo [OK] Code pushed to %REPO_URL%
    ) else (
        echo [WARNING] Push failed. Please verify access to: %REPO_URL%
    )
)

echo.
echo ================================================
echo   SETUP COMPLETE!
echo ================================================
echo.
echo NEXT STEPS:
echo.
echo - If you didn't pass a repo URL, run this to connect and push:
echo     git branch -M main
echo     git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO.git
echo     git push -u origin main
echo.
echo - Repo URL provided? Verify it here:
echo     git remote -v
echo.
echo Note: This script sets the local git user.email to %GIT_USER_EMAIL%.
echo       Change the value in this file if you prefer a different email or user name.
echo.
pause

echo.
echo ================================================
echo   SETUP COMPLETE!
echo ================================================
echo.
echo NEXT STEPS:
echo.
echo 1. Go to GitHub.com and create a new repository
echo 2. Copy the repository URL
echo 3. Run this command (replace with your URL):
echo    git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO.git
echo 4. Push to GitHub:
echo    git branch -M main
echo    git push -u origin main
echo.
echo Full guide available in: GITHUB_HOSTING_GUIDE.md
echo.
pause
