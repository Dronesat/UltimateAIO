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
@echo ===================================
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
@echo.
@echo 2. Hay nhap key roi an Enter ...
set /p key= - Nhap Key : 
@echo.
@echo 3. Dang cai dat key moi ... 
cscript OSPP.VBS /inpkey:%key% 
@echo.
@echo 4. Dang kich hoat ban quyen ...
cscript OSPP.VBS /act 
@echo.
@echo 5. Dang kiem tra ban quyen ...  
@echo.
cscript OSPP.VBS /dstatus |find "LICENSED"
if %errorlevel%==0  (
@echo     ** Da kich hoat ban quyen vinh vien **
) else (
@echo " Loi :
@echo       + ERROR CODE: 0xC004C003 - KEY san pham cua ban da bi chan
@echo       + ERROR CODE: 0xC004C020 - KEY da het luot kich hoat, hay chuyen sang kich hoat By Phone
)
@echo.
@echo ============================================
@echo   - An 1 de nhap key moi 
@echo   - An phim bat ki de thoat ...
set /p chon=      Lua chon cua ban la : 
if %chon% == 1 goto begin
exit



