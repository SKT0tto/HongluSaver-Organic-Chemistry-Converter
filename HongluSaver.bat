@echo off
title HongluSaver - Chemistry Formula Converter
echo.
echo  ========================================
echo   HongluSaver - Chemistry Formula Converter
echo   Author: Henry Lin
echo  ========================================
echo.
echo  Starting application...
echo  (Keep this window open while using the app)
echo.

cd /d "%~dp0"

:: Check Python
python --version >nul 2>&1
if errorlevel 1 (
    echo  [ERROR] Python not found. Please install Python 3.10+ first.
    echo  https://www.python.org/downloads/
    pause
    exit /b 1
)

:: Install dependencies if needed
if not exist ".deps_installed" (
    echo  Installing dependencies (first run only)...
    pip install -r requirements.txt -q
    if errorlevel 1 (
        echo  [ERROR] Failed to install dependencies.
        pause
        exit /b 1
    )
    echo ok > .deps_installed
    echo  Dependencies installed successfully.
    echo.
)

:: Launch Streamlit and open browser
echo  Application running at: http://localhost:8501
echo  Press Ctrl+C to stop.
echo.
start http://localhost:8501
python -m streamlit run app.py --server.headless true --browser.gatherUsageStats false
pause
