@echo off
echo ===================================================
echo   Hindalco Authorization Tracker - Data Updater
echo ===================================================
echo.

echo 1. Reading Excel and generating updated pages...
node generate.js
if %errorlevel% neq 0 (
    echo.
    echo ❌ ERROR: Failed to generate pages. Make sure the Excel file is closed!
    pause
    exit /b %errorlevel%
)

echo.
echo 2. Uploading changes to GitHub...
git add -A
git commit -m "Automated data update from Excel"
git push
if %errorlevel% neq 0 (
    echo.
    echo ❌ ERROR: Failed to upload to GitHub. Check your internet connection.
    pause
    exit /b %errorlevel%
)

echo.
echo ✅ SUCCESS! Your updates have been published.
echo ⏳ Please wait 1-2 minutes for the live website to reflect the changes.
echo.
pause
