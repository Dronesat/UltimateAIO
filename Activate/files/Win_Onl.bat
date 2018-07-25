@echo off
title  ACTIVE FULL BY NGUYEN HOANG NAM
@echo. 
@echo                                             KICH HOAT OFFICE 2010, 2013, 2016  
@echo                                           KICH HOAT WINDOWS 7,8,8.1,10 PRO/ENT 
@echo.                        
@echo                                    ==================== SUPPORT ====================
@echo                                    [  https://www.facebook.com/davis.nguyen.98837  ]
@echo                                    [               Nguyen Hoang Nam                ]
@echo                                    =================================================
@echo.
color 0a

@echo 0. Dang kiem tra ban quyen ...  
@echo.
cscript "C:\Windows\System32\slmgr.vbs" /xpr |find "permanently"
if %errorlevel%==0  (
@echo           == Windows da kich hoat ban quyen vinh vien . Khong can kich hoat lai ==
@echo.
@echo   - An 1 de nhap key moi va kich hoat lai co the se bi mat ban quyen 
@echo   - Hoac tat cua so nay ...
set /p chon=      Lua chon cua ban la : 
if %chon% == 1 goto begin
exit
)
:begin
@echo 1. Hay nhap key roi an Enter ...
set /p key= - Nhap Key : 
@echo 2. Dang xoa bo key cu ...
slmgr.vbs -upk
@echo 3. Dang xoa bo register cu ...
slmgr.vbs -cpky 
@echo 4. Dang cai dat key moi ... 
slmgr.vbs -ipk %key%
@echo 5. Dang kich hoat ban quyen
slmgr.vbs -ato
@echo 6. Dang kiem tra ban quyen ...  
@echo.
cscript "C:\Windows\System32\slmgr.vbs" /xpr |find "permanently"
if %errorlevel%==0  (
@echo     == Da kich hoat ban quyen vinh vien ==
@echo %key% >KEY_Win.txt
pause >nul
exit
) else (
@echo     == Key cua ban da het luot kich hoat ==
 )
@echo.
@echo   - An phim so 1 de nhap key moi ... 
@echo   - An phim so 0 de thoat ...
set /p chon=      Lua chon cua ban la : 
if %chon% == 1 goto begin
exit



