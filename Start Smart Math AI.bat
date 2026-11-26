@echo off
set "PROJECT_ROOT=%~dp0"
set "FRONTEND_DIR=%PROJECT_ROOT%frontend"
set "ELECTRON_EXE=%FRONTEND_DIR%\node_modules\electron\dist\electron.exe"

if not exist "%ELECTRON_EXE%" (
    echo Desktop dependencies are missing. Run npm.cmd install in the frontend folder first.
    pause
    exit /b 1
)

call npm.cmd --prefix "%FRONTEND_DIR%" run build:desktop
if errorlevel 1 (
    pause
    exit /b 1
)

start "" "%ELECTRON_EXE%" "%FRONTEND_DIR%"
