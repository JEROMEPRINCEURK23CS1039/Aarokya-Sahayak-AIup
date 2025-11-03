@echo off
echo ========================================
echo Deploying Registration Fix to Render
echo ========================================
echo.

echo Step 1: Checking git status...
git status

echo.
echo Step 2: Adding all changes...
git add .

echo.
echo Step 3: Committing changes...
git commit -m "Fix: Registration validation - make optional fields truly optional"

echo.
echo Step 4: Pushing to GitHub (triggers Render auto-deploy)...
git push origin main

echo.
echo ========================================
echo ✅ SUCCESS! Changes pushed to GitHub
echo ========================================
echo.
echo ⏳ Render is now deploying your changes...
echo    This will take approximately 2-5 minutes
echo.
echo 🔍 Monitor deployment status:
echo    https://dashboard.render.com
echo.
echo 📝 Changes deployed:
echo    - Made age, gender, state, district optional
echo    - Fixed password validation (6 chars minimum)
echo    - Added proper validation error messages
echo.
echo 🎯 After deployment completes, test registration at:
echo    https://your-frontend-url.vercel.app/register
echo.
echo ========================================
pause
