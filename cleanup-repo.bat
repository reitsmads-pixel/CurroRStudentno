@echo off
REM Cleanup script for Curro Capacity System (Windows)
REM Removes Node.js/Next.js files that cause Netlify issues

echo.
echo 🧹 Cleaning repo for static site deployment...
echo.

REM Remove Node.js files
echo Removing Node.js files...
git rm -f package.json 2>nul && echo   ✓ Removed package.json || echo   - package.json not found
git rm -f package-lock.json 2>nul && echo   ✓ Removed package-lock.json || echo   - package-lock.json not found
git rm -f yarn.lock 2>nul && echo   ✓ Removed yarn.lock || echo   - yarn.lock not found

REM Remove Next.js folders
echo.
echo Removing Next.js folders...
git rm -rf .next 2>nul && echo   ✓ Removed .next/ || echo   - .next/ not found
git rm -rf node_modules 2>nul && echo   ✓ Removed node_modules/ || echo   - node_modules/ not found

REM Add only needed files
echo.
echo Adding required files...
git add index.html && echo   ✓ Added index.html
git add login.html && echo   ✓ Added login.html
git add main_admin.html && echo   ✓ Added main_admin.html
git add dashboard.html && echo   ✓ Added dashboard.html
git add config.js && echo   ✓ Added config.js
git add netlify.toml && echo   ✓ Added netlify.toml

REM Commit changes
echo.
echo Committing changes...
git commit -m "Clean repo for static site deployment - remove Node.js files"

echo.
echo ✅ Cleanup complete!
echo.
echo Next steps:
echo 1. Run: git push
echo 2. Go to Netlify and trigger a new deploy
echo 3. Your site should deploy successfully!
echo.
pause
