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

set "DRV=%~dp0Spreadtrum Drivers"

echo [步骤 1/5] 关闭驱动强制签名(需重启)...
bcdedit /set testsigning on >nul 2>&1
bcdedit /set nointegritychecks on >nul 2>&1
echo   完成
echo.

echo [步骤 2/5] 安装 SciU2S 64位驱动...
cd /d "%DRV%\SciU2S\x64"
dpinst.exe /q /sh /f
echo   完成
echo.

echo [步骤 3/5] 安装 SciU2S 32位驱动(兼容性备份)...
cd /d "%DRV%\SciU2S\x86"
dpinst.exe /q /sh /f
echo   完成
echo.

echo [步骤 4/5] 安装 Google USB 驱动(ADB 用)...
cd /d "%DRV%\google-usb_driver\amd64"
if exist dpinst.exe (
    dpinst.exe /q /sh /f
) else (
    pnputil /add-driver "%DRV%\google-usb_driver\amd64\android_winusb.inf" /install
)
echo   完成
echo.

echo [步骤 5/5] 安装 RedBox 展讯驱动安装器...
cd /d "%DRV%\红盒子"
if exist RedBoxDriverInstall_v1.2.exe (
    start /wait RedBoxDriverInstall_v1.2.exe /S
    echo   完成
)
echo.

echo ============================================================
echo   驱动安装完成!请重启电脑。
echo.
echo   重启后操作步骤:
echo   1. 手机关机,完全断电
echo   2. 同时按住 [音量上 + 音量下 + 电源] 10-15 秒
echo   3. 出现黑屏或震动后松手
echo   4. 插 USB 连电脑
echo   5. 打开设备管理器,查看是否有:
echo      - Spreadtrum USB
echo      - SCI USB2SERIAL
echo      - SPD USB xxx
echo.
echo   6. 如果设备管理器还是"未知 USB 设备",
echo      请右键它 → 更新驱动 → 浏览我的电脑 →
echo      指向 "%DRV%\SciU2S\x64\driver" 文件夹
echo ============================================================
pause
