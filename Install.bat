@echo off
ECHO.::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
ECHO.::                                                                          ::
ECHO.::      ��ӭʹ��Windowsƽ̨��Hyper-V����ű���                              ::
ECHO.::      ���ű���WUXI��д��������������ϵ���ˣ�                              ::
ECHO.::      ת���벻Ҫɾ������Ϣ��                                              :: 
ECHO.::                                                                          ::
ECHO.::                                                                          ::
ECHO.::      ���ߣ�WUXI          QQ:2430914223      2022��9��13��                ::
ECHO.::                                                                          ::
ECHO.::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
ECHO.
ECHO. 
COLOR 02
title Hyper-V����ű���װ����2.0
echo ������ģ��λ�� ����C:\VHD
set muban=0
set /p muban=
echo ���������������λ�� ����C:\VPS
set vps=0
set /p vps=
echo �����������������λ�� ����C:\VPS\data
set data=0
set /p data=

========================================

@echo off&setlocal enabledelayedexpansion 

for /f "eol=* tokens=*" %%i in (Hyper-V.bat) do ( 

set a=%%i 
 
set "a=!a:vmfile=%muban%!" 

echo !a!>>$) 

move $ Hyper-V.bat
========================================

@echo off&setlocal enabledelayedexpansion 
 
for /f "eol=* tokens=*" %%i in (Hyper-V.bat) do ( 

set a=%%i 

set "a=!a:vhdfile=%vps%!" 

echo !a!>>$) 

move $ Hyper-V.bat
========================================

@echo off&setlocal enabledelayedexpansion 
 
for /f "eol=* tokens=*" %%i in (Hyper-V.bat) do ( 

set a=%%i 

set "a=!a:vhddatafile=%data%!" 

echo !a!>>$) 

move $ Hyper-V.bat
========================================

cls

echo ��װ��ɣ�

del install.bat


pause