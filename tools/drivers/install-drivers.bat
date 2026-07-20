@echo off
chcp 65001 > nul
title 海信 A7 CC - 展讯驱动一键安装

echo ============================================================
echo   海信 A7 CC (HNR320T) 展讯驱动安装脚本
echo   请右键此脚本 → "以管理员身份运行"
echo ============================================================
echo.

REM 检查管理员权限
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo [错误] 请右键 → 以管理员身份运行此脚本!
    pause
    exit /b 1
)

echo [步骤 1/5] 关闭驱动强制签名...
bcdedit /set testsigning on >nul 2>&1
bcdedit /set nointegritychecks on >nul 2>&1
echo   完成(需要重启后生效)
echo.

echo [步骤 2/5] 安装 SciU2S 64位驱动...
cd /d "%~dp0\Spreadtrum Drivers\SciU2S\x64"
dpinst.exe /q /sh /f
echo   完成
echo.

echo [步骤 3/5] 安装 SciU2S 32位驱动(兼容模式)...
cd /d "%~dp0\Spreadtrum Drivers\SciU2S\x86"
dpinst.exe /q /sh /f
echo   完成
echo.

echo [步骤 4/5] 安装 Google USB 驱动(ADB 用)...
cd /d "%~dp0\Spreadtrum Drivers\google-usb_driver\amd64"
if exist dpinst.exe (
    dpinst.exe /q /sh /f
) else (
    echo   无 dpinst,使用 PnPUtil 添加...
    for %%i in (android_winusb.inf) do (
        pnputil /add-driver "%%i" /install
    )
)
echo   完成
echo.

echo [步骤 5/5] 安装 RedBox 展讯红盒子驱动安装器...
cd /d "%~dp0\Spreadtrum Drivers\红盒子"
if exist RedBoxDriverInstall_v1.2.exe (
    start /wait RedBoxDriverInstall_v1.2.exe /S
    echo   完成
)
echo.

echo ============================================================
echo   驱动安装完成!
echo   请重启电脑后:
echo   1. 关机状态按住 [音量上+音量下+电源] 10-15 秒
echo   2. 设备管理器应该看到 Spreadtrum 字样
echo   3. 如果显示 SPD USB... 或 SCI USB2SERIAL = 成功
echo ============================================================
pause
