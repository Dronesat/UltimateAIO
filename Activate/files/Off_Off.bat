@echo off
title  ACTIVE FULL COMBO WINDOWS + OFFICE + BACK UP
@echo.
@echo                             Kich hoat Office 2010, 2013, 2016  Offline
@echo.                        
@echo                         ===================== Ho tro ====================
@echo                         [  https://www.facebook.com/davis.nguyen.98837  ]
@echo		                [                Nguyen Hoang Nam               ]
@echo                         =================================================
@echo.
color 0a
:nhap
@echo ====================================
@echo 1. Ban muon kich hoat Office nao : 
@echo             + Office 2010  : Go 10 
@echo             + Office 2013  : Go 13 
@echo             + Office 2016  : Go 16 
set /p chon=      Lua chon cua ban la : 
if %chon% == 10 goto 2010 
if %chon% == 13 goto 2013
if %chon% == 16 goto 2016
goto nhap
exit
:2016 
if exist "%ProgramFiles%\Microsoft Office\Office16\ospp.vbs" (
cd /d "%ProgramFiles%\Microsoft Office\Office16"
if exist "%ProgramFiles(x86)%\Microsoft Office\Office16\ospp.vbs" cd /d "%ProgramFiles(x86)%\Microsoft Office\Office16"
)else (
@echo - BAN CHUA CAI DAT OFFICE 2016
goto nhap
)
goto begin
:2013 
if exist "%ProgramFiles%\Microsoft Office\Office15\ospp.vbs" (
cd /d "%ProgramFiles%\Microsoft Office\Office15"
if exist "%ProgramFiles(x86)%\Microsoft Office\Office15\ospp.vbs" cd /d "%ProgramFiles(x86)%\Microsoft Office\Office15"
)else (
@echo - BAN CHUA CAI DAT OFFICE 2013
goto nhap
)
goto begin
:2010
if exist "%ProgramFiles%\Microsoft Office\Office14\ospp.vbs" (
cd /d "%ProgramFiles%\Microsoft Office\Office14"
if exist "%ProgramFiles(x86)%\Microsoft Office\Office14\ospp.vbs" cd /d "%ProgramFiles(x86)%\Microsoft Office\Office14"
)else (
@echo - BAN CHUA CAI DAT OFFICE 2010
goto nhap
)
:begin
@echo
@echo 3. Hay nhap key roi an Enter ...
set /p key= - Nhap Key : 
@echo.
@echo 4. Dang cai dat key moi ... 
cscript OSPP.VBS /inpkey:%key% > nul
@echo.
@echo 5. Step 2 cua ban la :
cscript OSPP.VBS /dinstid |find "Installation ID" >iidoff.txt
FOR /F "tokens=*" %%i in (iidoff.txt) do  ( 
@echo %%i 
)
start iidoff.txt 
@echo.
@echo 6. Hay luu lai va gui Step 2 vao dia chi Facebook de lay Step 3 :
@echo.
:nhapcid
@echo 7. Hay nhap Step 3 roi an Enter . Neu chua co hay tat cua so nay va mo lai sau khi co Step 3.
set /p cid= - Confirmation ID :
@echo.
@echo 8. Dang kich hoat ban quyen .
cscript OSPP.VBS /actcid:%cid%
@echo.

@echo 9. Dang kiem tra ban quyen ...
cscript OSPP.VBS /act >nul  
@echo.
cscript OSPP.VBS /dstatus |find "LICENSED"
if %errorlevel%==0  (
@echo          == Da kich hoat ban quyen vinh vien ==
@echo %key% >KEY_Office.txt
pause >nul
exit
) else (
@echo     == Step 3 Not Vaid ! Kiem tra lai ==
goto nhapcid
)
pause>null
exit


