goto start
:start
@echo off
title Hyper-V����ű�2.0 ���ߣ�WUXI QQ:2430914223  2022��9��13��  
COLOR 02
goto moshi

:moshi
cls
title Hyper-V����ű�2.0 ģʽѡ�� ���ߣ�WUXI QQ:2430914223  2022��9��13��  
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
echo  ��ѡ��ģʽ���ͣ�
echo      1.�½������
echo      2.���������
echo      3.ɾ�������
echo      4.�˳�
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
@echo off
title Hyper-V����ű�2.0 ��������� ���ߣ�WUXI QQ:2430914223  2022��9��13��  
echo ������Ҫ���ľ�������(�Զ��������)
set System=0
set /p System=
echo ���������������
set name=0
set /p name=
echo ���þ�̬�ڴ棨y�� n��
set memory =n
set /p memory=
echo ������������ڴ��С��G��
set memorysize=0
set /p memorysize=
echo ������CPU������
set CPU=0
set /p CPU=
echo CPUǶ�ף�y���� n�رգ�
set cpuvt =n
set /p cpuvt=
echo ����CPU���ƣ�y�� n��
set cpuban =n
set /p cpuban=
if %cpuban%==y echo ������CPU���ưٷֱ�
if %cpuban%==y set cpusize=0
if %cpuban%==y set /p cpusize=
echo ���������̣�y�� n��
set datedish =n
set /p datedish=
if %datedish%==y echo �����븽�������̴�С��G��
if %datedish%==y set Dish=0
if %datedish%==y set /p Dish=
echo �������Ž��������ƣ�����lan��
set network=0
set /p network=
echo �������ֱ�ӿ�����y�� n��
set start =n
set /p start=
cls
title Hyper-V����ű�2.0 ִ���� ���ߣ�WUXI QQ:2430914223  2022��9��13��  
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
if %start%==n title �������,�����������
if %start%==y title �������,�����������
cls
title Hyper-V����ű�2.0 ִ����� ���ߣ�WUXI QQ:2430914223  2022��9��13��  
echo ִ�����
pause
cls
title Hyper-V����ű�2.0 ִ����� ���ߣ�WUXI QQ:2430914223  2022��9��13��  
echo y������������� n����ģʽѡ��
set newmoshi =n
set /p newmoshi=
if %newmoshi%==y goto new
if %newmoshi%==n goto moshi

:change
cls
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
@echo off
title Hyper-V����ű�2.0 ������Ҫִ���޸ĵĲ������ ���ߣ�WUXI QQ:2430914223  2022��9��13��  
echo ������Ҫִ���޸ĵĲ������
echo 1.�г�VMʵ��
echo 2.����VMʵ��
echo 3.�ر�VMʵ��
echo 4.����VMʵ��
echo 5.��װVMʵ��
echo 6.�ı�VM��С
echo 7.����������
echo 8.ɾ��������
echo 9.���������̴�С
echo 10.����ģʽѡ��
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
@echo off
title Hyper-V����ű�2.0 �г�VMʵ�� ���ߣ�WUXI QQ:2430914223  2022��9��13��  
powershell Get-VM
echo �г��ɹ�
pause
goto change

:change2
cls
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
@echo off
title Hyper-V����ű�2.0 ����VMʵ�� ���ߣ�WUXI QQ:2430914223  2022��9��13��  
echo ����Ҫ������VMʵ������
set name=0
set /p name=
PowerShell Start-VM -Name %name%
echo �����ɹ�
pause
goto change

:change3
cls
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
@echo off
title Hyper-V����ű�2.0 �ر�VMʵ�� ���ߣ�WUXI QQ:2430914223  2022��9��13��  
echo ����Ҫ�رյ�VMʵ������
set name=0
set /p name=
PowerShell Stop-VM -Name %name% -TurnOff
echo �رճɹ�
pause
goto change

:change4
cls
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
@echo off
title Hyper-V����ű�2.0 ����VMʵ�� ���ߣ�WUXI QQ:2430914223  2022��9��13��  
echo ����Ҫ������VMʵ������
set name=0
set/p name=
powershell Restart-VM %name%
echo �����ɹ�
pause
goto change

:change5
cls
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
@echo off
title Hyper-V����ű�2.0 ��װVMʵ�� ���ߣ�WUXI QQ:2430914223  2022��9��13��  
echo ����Ҫ��װ��VMʵ������
set name=0
set /p name=
echo ����Ҫ��װ��������
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
echo ��װ�ɹ�
pause
goto change

:change6
cls
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
@echo off
title Hyper-V����ű�2.0 ����VMʵ�� ���ߣ�WUXI QQ:2430914223  2022��9��13�� 
echo ����Ҫ���ĵ�VMʵ������
set name=0
set /p name=
echo ���þ�̬�ڴ棨y�� n��
set memory =n
set /p memory=
echo ������������ڴ��С��G��
set memorysize=0
set /p memorysize=
echo ������CPU������
set CPU=0
set /p CPU=
echo CPUǶ�ף�y���� n�رգ�
set cpuvt =n
set /p cpuvt=
echo ����CPU���ƣ�y�� n��
set cpuban =n
set /p cpuban=
if %cpuban%==y echo ������CPU���ưٷֱ�
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
echo ���ĳɹ�
pause
goto change

:change7
cls
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
@echo off
title Hyper-V����ű�2.0 ���������� ���ߣ�WUXI QQ:2430914223  2022��9��13�� 
echo �������������̵�VMʵ������
set name=0
set /p name=
echo ���������������̴�С��G��
set Dish=0
set /p Dish=
powershell New-VHD -Path vhddatafile\%name%date.vhdx -BlockSizeBytes 128MB -LogicalSectorSize 4KB -SizeBytes %Dish%GB
powershell Add-VMHardDiskDrive -ControllerType SCSI -ControllerNumber 0 -VMName %name% -Path vhddatafile\%name%date.vhdx
echo ���ӳɹ�
pause
goto change

:change8
cls
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
@echo off
title Hyper-V����ű�2.0 ɾ�������� ���ߣ�WUXI QQ:2430914223  2022��9��13�� 
echo ����ɾ�������̵�VMʵ������
set name=0
set /p name=
powershell PowerShell Remove-VMHardDiskDrive -VMName %name% -ControllerType SCSI -ControllerNumber 0
del vhddatafile\%name%date.vhdx
echo ɾ���ɹ�
pause
goto change

:change9
cls
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
@echo off
title Hyper-V����ű�2.0 ���������̴�С ���ߣ�WUXI QQ:2430914223  2022��9��13�� 
echo ������������̴�С��VMʵ��
set name=0
set /p name=
echo �����������������̵Ĵ�С
echo ֻ�����Ӳ�����С
set capacity=0
set /p capacity=
powershell Resize-VHD -Path vhddatafile\%name%date.vhdx -SizeBytes %capacity%GB
echo ������С�ɹ�
pause
goto change

:del
cls
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
@echo off
title �رղ�ɾ�������
echo ������ر������������ ����VPS1
set name=0
set /p name=
PowerShell Stop-VM -Name %name% -TurnOff 
PowerShell Remove-VM -Name "%name% -Force
del vhdfile\%name%.vhdx 
del vhddatafile\%name%date.vhdx 
pause
goto moshi
