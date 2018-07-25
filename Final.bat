@echo off
title  FINAL BAT
@echo. 
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
    echo  Requesting Admin access...
    goto goUAC 
) else (
 goto goADMIN )

:goUAC
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"=""
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"
    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:goADMIN
    pushd "%CD%"
    CD /D "%~dp0"
:nhan
cls
type OEM\files\text\final.txt
color 0a
@echo.
@echo ==========================
set /p chon= + Lua chon cua ban la ? :


If %chon% == 1 (
start Activate\Activate.exe >nul
goto begin
)

If %chon% == 2 (
start OEM\OEM.exe >nul
goto begin
)

