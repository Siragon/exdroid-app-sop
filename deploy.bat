REM exdroid rev2
@echo off
bin\adb start-server
:genesis
@set A=0
@set B=0 
@set C=0
@set D=0
@set E=0
@set F=0
@set G=0
@set H=0
@set I=0
@set J=0

set /a linea=0
@for /F "tokens=1" %%x in ('bin\adb devices') do (
call :show %%x
)
goto fin
goto:eof

:show
set /a linea+=1
if /I %linea%==2 @set A=%*
if /I %linea%==3 @set B=%* 
if /I %linea%==4 @set C=%*
if /I %linea%==5 @set D=%*
if /I %linea%==6 @set E=%*º
if /I %linea%==7 @set F=%*
if /I %linea%==8 @set G=%*
if /I %linea%==9 @set H=%*
if /I %linea%==10 @set I=%*
if /I %linea%==11 @set J=%*
goto:Eof

:fin

bin\colous writesec "[10] ==================================================================="
if NOT %A%==0 bin\colous writesec "[12] 1=%A%"
if NOT %B%==0 bin\colous writesec "[12] 2=%B%"
if NOT %C%==0 bin\colous writesec "[12] 3=%C%"
if NOT %D%==0 bin\colous writesec "[12] 4=%D%"
if NOT %E%==0 bin\colous writesec "[12] 5=%E%"
if NOT %F%==0 bin\colous writesec "[12] 6=%F%"
if NOT %G%==0 bin\colous writesec "[12] 7=%G%"
if NOT %H%==0 bin\colous writesec "[12] 8=%H%"
if NOT %I%==0 bin\colous writesec "[12] 9=%I%"
if NOT %J%==0 bin\colous writesec "[12] 0=%J%"
bin\colous writesec "[10] ==================================================================="
if %linea%==1 (
bin\colous writesec "[12] CONECTA ALGUN DISPOSITIVO"
	@pause
	goto genesis
	goto:eof
)
if %linea%==2 (
	@set S=%A%
	goto begin
	goto:eof
)
set INPUT=
set /P INPUT=CON CUAL TABLET DESEA TRABAJAR? %=%
if /I %INPUT%==1 @set S=%A%
if /I %INPUT%==2 @set S=%B%
if /I %INPUT%==3 @set S=%C%
if /I %INPUT%==4 @set S=%D%
if /I %INPUT%==5 @set S=%E%
if /I %INPUT%==6 @set S=%F%
if /I %INPUT%==7 @set S=%G%
if /I %INPUT%==8 @set S=%H%
if /I %INPUT%==9 @set S=%I%
if /I %INPUT%==0 @set S=%J%

:begin
title %S%

@echo off
bin\adb -s %S% wait-for-device shell input keyevent 26
FOR %%F IN (qc/*.apk) DO (
bin\colous writesec "[10] Instalando File : %%F"
@adb wait-for-device install -r qc/%%F
)
bin\adb -s %S% wait-for-device shell mount -o remount,rw /system
bin\adb -s %S% wait-for-device shell rm -r /system/preinstall
bin\adb -s %S% wait-for-device shell rm /system/app/FileExplore.apk
bin\adb -s %S% wait-for-device push aosp\system /system
bin\adb -s %S% wait-for-device shell chmod 6755 /system/bin/su
bin\adb -s %S% wait-for-device shell chmod 6755 /system/xbin/xx
bin\adb -s %S% wait-for-device shell chmod 644 /system/app/com.mgyun.shua.su.apk
bin\colous writesec "[12] PROSIGA AL CONTROL DE CALIDAD"
bin\adb -s %S% wait-for-device shell input keyevent 26
pause
REM bin\adb -s %S% wait-for-device shell rm /system/app/com.mgyun.shua.su.apk
REM bin\adb -s %S% wait-for-device shell rm /system/bin/su
REM bin\adb -s %S% wait-for-device shell wipe data
REM bin\adb -s %S% wait-for-device reboot
REM pause
