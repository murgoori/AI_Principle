@echo off
chcp 65001 > nul
REM ============================================================
REM  Life Expectancy Lab - one-click virtual environment setup
REM  Double-click this file in the lab folder.
REM ============================================================
cd /d "%~dp0"

where py > nul 2>&1
if %errorlevel%==0 (set PY=py) else (set PY=python)

if not exist ".venv\Scripts\python.exe" (
    echo [1/3] Creating virtual environment .venv ...
    %PY% -m venv .venv
    if errorlevel 1 (
        echo [ERROR] Python not found. Install Python and check "Add python.exe to PATH".
        pause
        exit /b 1
    )
) else (
    echo [1/3] .venv already exists. Skip.
)

echo [2/3] Upgrading pip ...
".venv\Scripts\python.exe" -m pip install --upgrade pip

echo [3/3] Installing libraries from requirements.txt ...
".venv\Scripts\python.exe" -m pip install -r requirements.txt
if errorlevel 1 (
    echo [ERROR] Install failed. Check the internet connection and try again.
    pause
    exit /b 1
)

echo.
echo ============================================================
echo  DONE! Open this folder in VS Code and select the .venv kernel.
echo ============================================================
pause
