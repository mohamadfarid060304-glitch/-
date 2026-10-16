@echo off
title Store Manager - Remix

echo ======================================================
echo             Store and Inventory Manager
echo                 Preparing to Launch...
echo ======================================================
echo.

:: Check if Node.js is installed
node -v >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Node.js is not installed on this computer!
    echo Please download and install Node.js first.
    echo Website: https://nodejs.org
    echo.
    echo Press any key to exit...
    pause >nul
    exit /b
)

:: Check if node_modules exists, if not run npm install
if not exist node_modules (
    echo [INFO] Installing required files for the first time...
    echo This may take 1-2 minutes depending on your internet speed.
    echo Please do NOT close this window.
    echo.
    call npm install
    if %errorlevel% neq 0 (
        echo.
        echo [ERROR] Installation failed!
        echo Please check your internet connection and try running this file again.
        echo.
        pause
        exit /b
    )
    echo [SUCCESS] Installation completed successfully!
    echo.
)

:: Start browser and dev server
echo [INFO] Starting the application...
echo The program will open in your browser automatically.
echo Keep this window open while using the program.
echo.

start "" "http://localhost:3000"
call npm run dev

pause
