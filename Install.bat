@echo off
ECHO.::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
ECHO.::                                                                          ::
ECHO.::      欢迎使用Windows平台的Hyper-V管理脚本，                              ::
ECHO.::      本脚本由WUXI编写，如有疑问请联系本人！                              ::
ECHO.::      转载请不要删除本信息！                                              :: 
ECHO.::                                                                          ::
ECHO.::                                                                          ::
ECHO.::      作者：WUXI          QQ:2430914223      2022年9月13日                ::
ECHO.::                                                                          ::
ECHO.::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
ECHO.
ECHO. 
COLOR 02
title Hyper-V管理脚本安装程序2.0
echo 请输入模板位置 比如C:\VHD
set muban=0
set /p muban=
echo 请输入虚拟机磁盘位置 比如C:\VPS
set vps=0
set /p vps=
echo 请输入虚拟机数据盘位置 比如C:\VPS\data
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

echo 安装完成！

del install.bat


pause