@echo off
set scriptpath=%~dp0
goto check_Permissions

:check_Permissions
net session >nul 2>&1
SET admin=0
if %errorLevel% == 0 (
    SET admin=1
)

ECHO ******************MUASSL.com**************
ECHO CAP NHAT ROOT Trusted MuaSSL.com TLS/CA
ECHO:
ECHO Phan nay se cai dat cac tap tin .crt
ECHO trong thu muc nay vao may tinh cua ban
ECHO:
IF %admin% == 1  (
    ECHO Ban dang nhap voi quyen ADMIN
    ECHO:
	ECHO %scriptpath%
) else (
    ECHO Khi cai dat se co 1 hop thoai hien len
    ECHO Ban can bam "Yes" de xac nhan cai dat
)
ECHO:
ECHO *******************************************
ECHO:

SET /P ok=Tiep tuc cai dat [Y/N]:
IF "%ok%"=="y" GOTO Caidat
IF "%ok%"=="Y" GOTO Caidat
IF "%ok%"=="n" GOTO Khongcai
IF "%ok%"=="N" GOTO Khongcai

:Caidat
	for %%a in (%scriptpath%*.crt) do (
		ECHO %%a
		IF %admin% == 1  (
			certutil -enterprise -f -addstore "Root" %%a
		) else (
			certutil -user -addstore "Root" %%a
		)
	)
	ECHO:
	ECHO:
	ECHO Cai dat thanh cong
	

ECHO:
ECHO *******************************************
ECHO:

SET /P yesno=Ban co muon khoi dong lai may khong? [Y/N]:
    IF "%yesno%"=="y" GOTO Confirmation
    IF "%yesno%"=="Y" GOTO Confirmation
    IF "%yesno%"=="n" GOTO End
    IF "%yesno%"=="N" GOTO End
	
    :Confirmation
    
    ECHO:
    ECHO:
    ECHO May tinh se khoi dong lai bay gio
    
    shutdown.exe /r
    
    GOTO :EOF
	
	:Khongcai
    ECHO:
    ECHO:  
    ECHO May tinh cua ban se khong the
    ECHO truy cap duoc cac chung chi ban hanh boi
    ECHO MuaSSL.com TLS/CA
    ECHO Bam phim bat ky de thoat
    ECHO:  
    
    TIMEOUT 5 >nul
    GOTO :EOF
	
    :End
    
    ECHO:
    ECHO:  
    ECHO Cam on ban da cai dat cap nhat bao mat tu MuaSSL.com TLS/CA
    ECHO Bam phim bat ky de thoat
    ECHO:  
    
    TIMEOUT 5 >nul
    
    GOTO :EOF
    exit
