goto start
:start
@echo off
title Hyper-V管理脚本2.0 作者：WUXI QQ:2430914223  2022年9月13日  
COLOR 02
goto moshi

:moshi
cls
title Hyper-V管理脚本2.0 模式选择 作者：WUXI QQ:2430914223  2022年9月13日  
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
echo  请选择模式类型：
echo      1.新建虚拟机
echo      2.更改虚拟机
echo      3.删除虚拟机
echo      4.退出
echo.
set num=0
set /p num=
if %num%==1 goto new
if %num%==2 goto change
if %num%==3 goto del
if %num%==4 exit
goto moshi

:new
cls
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
@echo off
title Hyper-V管理脚本2.0 创建虚拟机 作者：WUXI QQ:2430914223  2022年9月13日  
echo 请输入要开的镜像名称(自动差异存盘)
set System=0
set /p System=
echo 请输入虚拟机名称
set name=0
set /p name=
echo 设置静态内存（y是 n否）
set memory =n
set /p memory=
echo 请输入虚拟机内存大小（G）
set memorysize=0
set /p memorysize=
echo 请输入CPU核心数
set CPU=0
set /p CPU=
echo CPU嵌套（y开启 n关闭）
set cpuvt =n
set /p cpuvt=
echo 设置CPU限制（y是 n否）
set cpuban =n
set /p cpuban=
if %cpuban%==y echo 请输入CPU限制百分比
if %cpuban%==y set cpusize=0
if %cpuban%==y set /p cpusize=
echo 增加数据盘（y是 n否）
set datedish =n
set /p datedish=
if %datedish%==y echo 请输入附加数据盘大小（G）
if %datedish%==y set Dish=0
if %datedish%==y set /p Dish=
echo 请输入桥接网络名称（建议lan）
set network=0
set /p network=
echo 创建完毕直接开机（y是 n否）
set start =n
set /p start=
cls
title Hyper-V管理脚本2.0 执行中 作者：WUXI QQ:2430914223  2022年9月13日  
powershell New-VHD -ParentPath vmfile\%system%.vhdx -Path vhdfile\%name%.vhdx -Differencing
powershell New-VM -Name "%name%" -MemoryStartupBytes 1GB -VHDPath vhdfile\%name%.vhdx -SwitchName %network%
powershell Set-VM -VMName %name% -CheckpointType Disabled
if %cpuban%==n powershell Set-VMProcessor %name% -Count %CPU%
if %cpuban%==y powershell Set-VMProcessor %name% -Count %CPU% -Maximum %cpusize% -RelativeWeight 100
if %cpuvt%==n powershell Set-VMProcessor -ExposeVirtualizationExtensions $false -VMName %name%
if %cpuvt%==y powershell Set-VMProcessor -ExposeVirtualizationExtensions $true -VMName %name%
if %memory%==n powershell Set-VMMemory %name% -DynamicMemoryEnabled $true -MinimumBytes 512MB -StartupBytes %memorysize%GB -MaximumBytes %memorysize%GB -Priority 50 -Buffer 20
if %memory%==y powershell Set-VMMemory %name% -StartupBytes %memorysize%GB -Priority 50
if %datedish%==y powershell New-VHD -Path vhddatafile\%name%date.vhdx -BlockSizeBytes 128MB -LogicalSectorSize 4KB -SizeBytes %Dish%GB
if %datedish%==y powershell Add-VMHardDiskDrive -ControllerType SCSI -ControllerNumber 0 -VMName %name% -Path vhddatafile\%name%date.vhdx
if %start%==y PowerShell Start-VM -Name %name%
if %start%==n title 创建完成,请启动虚拟机
if %start%==y title 开机完成,虚拟机已启动
cls
title Hyper-V管理脚本2.0 执行完成 作者：WUXI QQ:2430914223  2022年9月13日  
echo 执行完成
pause
cls
title Hyper-V管理脚本2.0 执行完成 作者：WUXI QQ:2430914223  2022年9月13日  
echo y继续创建虚拟机 n返回模式选择
set newmoshi =n
set /p newmoshi=
if %newmoshi%==y goto new
if %newmoshi%==n goto moshi

:change
cls
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
@echo off
title Hyper-V管理脚本2.0 请输入要执行修改的操作编号 作者：WUXI QQ:2430914223  2022年9月13日  
echo 请输入要执行修改的操作编号
echo 1.列出VM实例
echo 2.开启VM实例
echo 3.关闭VM实例
echo 4.重启VM实例
echo 5.重装VM实例
echo 6.改变VM大小
echo 7.增加数据盘
echo 8.删除数据盘
echo 9.调整数据盘大小
echo 10.返回模式选择
set num=0
set /p num=
if %num%==1 goto change1
if %num%==2 goto change2
if %num%==3 goto change3
if %num%==4 goto change4
if %num%==5 goto change5
if %num%==6 goto change6
if %num%==7 goto change7
if %num%==8 goto change8
if %num%==9 goto change9
if %num%==10 goto moshi
goto change

:change1
cls
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
@echo off
title Hyper-V管理脚本2.0 列出VM实例 作者：WUXI QQ:2430914223  2022年9月13日  
powershell Get-VM
echo 列出成功
pause
goto change

:change2
cls
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
@echo off
title Hyper-V管理脚本2.0 开启VM实例 作者：WUXI QQ:2430914223  2022年9月13日  
echo 输入要开启的VM实例名称
set name=0
set /p name=
PowerShell Start-VM -Name %name%
echo 开启成功
pause
goto change

:change3
cls
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
@echo off
title Hyper-V管理脚本2.0 关闭VM实例 作者：WUXI QQ:2430914223  2022年9月13日  
echo 输入要关闭的VM实例名称
set name=0
set /p name=
PowerShell Stop-VM -Name %name% -TurnOff
echo 关闭成功
pause
goto change

:change4
cls
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
@echo off
title Hyper-V管理脚本2.0 重启VM实例 作者：WUXI QQ:2430914223  2022年9月13日  
echo 输入要重启的VM实例名称
set name=0
set/p name=
powershell Restart-VM %name%
echo 重启成功
pause
goto change

:change5
cls
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
@echo off
title Hyper-V管理脚本2.0 重装VM实例 作者：WUXI QQ:2430914223  2022年9月13日  
echo 输入要重装的VM实例名称
set name=0
set /p name=
echo 输入要重装镜像名称
set system=0
set /p system=
PowerShell Stop-VM -Name %name% -TurnOff  
TIMEOUT /T 3
del vhdfile\%name%.vhdx
powershell Remove-VMHardDiskDrive -VMName %name% -ControllerType IDE -ControllerNumber 0 -ControllerLocation 0
powershell New-VHD -ParentPath vmfile\%system%.vhdx -Path vhdfile\%name%.vhdx -Differencing
ren vhdfile\%System%.vhdx %name%.vhdx
powershell Add-VMHardDiskDrive -VMName %name% -Path vhdfile\%name%.vhdx
PowerShell Start-VM -Name %name%  
echo 重装成功
pause
goto change

:change6
cls
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
@echo off
title Hyper-V管理脚本2.0 更改VM实例 作者：WUXI QQ:2430914223  2022年9月13日 
echo 输入要更改的VM实例名称
set name=0
set /p name=
echo 设置静态内存（y是 n否）
set memory =n
set /p memory=
echo 请输入虚拟机内存大小（G）
set memorysize=0
set /p memorysize=
echo 请输入CPU核心数
set CPU=0
set /p CPU=
echo CPU嵌套（y开启 n关闭）
set cpuvt =n
set /p cpuvt=
echo 设置CPU限制（y是 n否）
set cpuban =n
set /p cpuban=
if %cpuban%==y echo 请输入CPU限制百分比
if %cpuban%==y set cpusize=0
if %cpuban%==y set /p cpusize=
set mem=0
set /p mem=
PowerShell Stop-VM -Name %name% -TurnOff
if %cpuban%==n powershell Set-VMProcessor %name% -Count %CPU%
if %cpuban%==y powershell Set-VMProcessor %name% -Count %CPU% -Maximum %cpusize% -RelativeWeight 100
if %cpuvt%==n powershell Set-VMProcessor -ExposeVirtualizationExtensions $false -VMName %name%
if %cpuvt%==y powershell Set-VMProcessor -ExposeVirtualizationExtensions $true -VMName %name%
if %memory%==n powershell Set-VMMemory %name% -DynamicMemoryEnabled $true -MinimumBytes 512MB -StartupBytes %memorysize%GB -MaximumBytes %memorysize%GB -Priority 50 -Buffer 20
if %memory%==y powershell Set-VMMemory %name% -StartupBytes %memorysize%GB -Priority 50
PowerShell Start-VM -Name %name%
echo 更改成功
pause
goto change

:change7
cls
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
@echo off
title Hyper-V管理脚本2.0 增加数据盘 作者：WUXI QQ:2430914223  2022年9月13日 
echo 输入增加数据盘的VM实例名称
set name=0
set /p name=
echo 请输入增加数据盘大小（G）
set Dish=0
set /p Dish=
powershell New-VHD -Path vhddatafile\%name%date.vhdx -BlockSizeBytes 128MB -LogicalSectorSize 4KB -SizeBytes %Dish%GB
powershell Add-VMHardDiskDrive -ControllerType SCSI -ControllerNumber 0 -VMName %name% -Path vhddatafile\%name%date.vhdx
echo 增加成功
pause
goto change

:change8
cls
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
@echo off
title Hyper-V管理脚本2.0 删除数据盘 作者：WUXI QQ:2430914223  2022年9月13日 
echo 输入删除数据盘的VM实例名称
set name=0
set /p name=
powershell PowerShell Remove-VMHardDiskDrive -VMName %name% -ControllerType SCSI -ControllerNumber 0
del vhddatafile\%name%date.vhdx
echo 删除成功
pause
goto change

:change9
cls
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
@echo off
title Hyper-V管理脚本2.0 调整数据盘大小 作者：WUXI QQ:2430914223  2022年9月13日 
echo 输入调整数据盘大小的VM实例
set name=0
set /p name=
echo 请输入增加新数据盘的大小
echo 只能增加不能缩小
set capacity=0
set /p capacity=
powershell Resize-VHD -Path vhddatafile\%name%date.vhdx -SizeBytes %capacity%GB
echo 调整大小成功
pause
goto change

:del
cls
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
@echo off
title 关闭并删除虚拟机
echo 请输入关闭虚拟机的名称 比如VPS1
set name=0
set /p name=
PowerShell Stop-VM -Name %name% -TurnOff 
PowerShell Remove-VM -Name "%name% -Force
del vhdfile\%name%.vhdx 
del vhddatafile\%name%date.vhdx 
pause
goto moshi
