@echo off
title  Kich hoat Windows 10 Professional Version 1511 Online
@echo.
color 0a
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
@echo 1. Dang lay quyen Admin ...
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
type text\w10.txt
@echo.
@echo.
@echo 1. Dang kiem tra ban quyen ...  
@echo.
cscript "C:\Windows\System32\slmgr.vbs" /xpr |find "permanently"
if %errorlevel%==0  (
color 0a
@echo           == Windows da kich hoat ban quyen vinh vien. Khong can kich hoat lai ==
pause >nul
exit
)
@echo 2. Kiem tra Version Windows
REM Check Windows Version
systeminfo | findstr /i "10 Pro" > nul
if %errorlevel%==1 (
@echo - Loi : Day khong phai la Windows 10 Professional
pause > nul
exit )
ver | findstr /i "10586" > nul
if %errorlevel%==0 goto begin
ver
@echo - Yeu cau : Hay nang cap Windows len Version 1511 Build 10.0.10586.
start link.txt
pause > nul
exit
:begin    
@echo 3. Dang go bo key cu ...
slmgr /upk
@echo 4. Dang lam sach Registry ...
slmgr /cpky
@echo 5. Dang xoa may chu KMS ...
slmgr /ckms
@echo 6. Dang cai dat key moi ... 
slmgr /ipk NF3RK-PHM7C-8743J-X2X92-J44DB
@echo 7. Dang chuyen huong sang tep van ban ...
start key.txt
pause > nul
slui 3
pause > nul
@echo 8. Dang thuc hien lenh kich hoat ...
slmgr /ato
@echo 9. Dang kiem tra ban quyen ...
@echo.
cscript "C:\Windows\System32\slmgr.vbs" /xpr |find "permanently"
if %errorlevel%==0  (
@echo           == Windows da kich hoat ban quyen vinh vien == 
)else (
@echo     == KEY ban nhap vao da het so luot kich hoat cho phep. Hay nhap key khac ==
)
pause > nul

exit


