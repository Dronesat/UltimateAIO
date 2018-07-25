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
@echo   - An phim 0 de thoat ...
set /p chon=      Lua chon cua ban la : 
if %chon% == 1 goto nhap
exit
)
:nhap
@echo 1. Hay nhap key roi an Enter ...
set /p key= - Nhap Key : 
@echo 2. Dang xoa bo key cu ...
slmgr.vbs -upk
@echo 3. Dang xoa bo register cu ...
slmgr.vbs -cpky
@echo 4. Dang cai dat key moi ... 
slmgr.vbs -ipk %key%
cscript "C:\Windows\System32\slmgr.vbs" /dti |find "Installation ID" >iid.txt
FOR /F "tokens=*" %%i in (iid.txt) do  (
@echo 5. Installation ID cua ban la :  
@echo %%i 
start iid.txt 
)
@echo 6. Hay luu lai va gui Installation ID de lay Confirmation ID :
@echo 7. Hay nhap Confirmation ID roi an Enter. Neu chua co hay tat cua so nay va mo lai sau khi co Confirmation ID
slui 4
cscript "C:\Windows\System32\slmgr.vbs" /xpr |find "permanently"
if %errorlevel%==0  (
@echo           == Da kich hoat ban quyen vinh vien ==
@echo %key% >KEY_Win.txt
) 
pause >nul
exit


