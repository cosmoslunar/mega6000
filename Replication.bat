@echo off
title Auto Replication

set "original_script_path=%~dpnx0"
set "log_file=replication_log.txt"

echo [%DATE% %TIME%] Script Start >> "%log_file%"

:LOOP_START
    set "random_folder_name=C:\Replication_Demo_Folder_%RANDOM%"
    md "%random_folder_name%" 2> nul

    if exist "%random_folder_name%" (
        echo [%DATE% %TIME%] Folder Creation Success: "%random_folder_name%" >> "%log_file%"
        copy "%original_script_path%" "%random_folder_name%" > nul
        if exist "%random_folder_name%\%~nx0" (
            echo [%DATE% %TIME%] Script Replication Success: "%random_folder_name%\%~nx0" >> "%log_file%"
        ) else (
            echo [%DATE% %TIME%] Script Replication Failed: "%random_folder_name%" >> "%log_file%"
        )
    ) else (
        echo [%DATE% %TIME%] Folder Creation Failed or Already Exists: "%random_folder_name%" >> "%log_file%"
    )

    timeout /t 0.1 /nobreak > nul
goto LOOP_START