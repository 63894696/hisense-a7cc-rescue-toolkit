# 海信 A7 CC 升级包一键打包脚本
# 把 HNR320T_N1771.6.13.01.00_full 文件夹打成 recovery 可识别的 update.zip
#
# 使用方法:
#   1. 右键 PowerShell → 以管理员身份运行
#   2. cd C:\Users\Administrator\Documents\hisense-a7cc-recovery
#   3. .\make-update-zip.ps1

$ErrorActionPreference = "Stop"
chcp 65001 > $null
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

Write-Host "============================================================" -ForegroundColor Cyan
Write-Host "  海信 A7 CC 升级包 → update.zip 一键打包脚本" -ForegroundColor Cyan
Write-Host "============================================================" -ForegroundColor Cyan
Write-Host ""

$src = "D:\BaiduNetdiskDownload\HNR320T_N1771.6.13.01.00_full"
$dst = "D:\update.zip"

# 检查源目录
if (-not (Test-Path $src)) {
    Write-Host "[错误] 源目录不存在: $src" -ForegroundColor Red
    Write-Host "        请确认升级包已解压到 D:\BaiduNetdiskDownload\"
    pause
    exit 1
}

# 检查关键文件
$metaInf = Join-Path $src "META-INF\com\google\android\update-binary"
if (-not (Test-Path $metaInf)) {
    Write-Host "[错误] 升级包结构异常,缺少 META-INF/com/google/android/update-binary" -ForegroundColor Red
    Write-Host "        这不是一个合法的 AOSP 卡刷包"
    pause
    exit 1
}

Write-Host "[步骤 1/3] 验证升级包完整性..." -ForegroundColor Yellow
$totalSize = (Get-ChildItem $src -Recurse -File | Measure-Object -Property Length -Sum).Sum
Write-Host "  升级包大小: $([math]::Round($totalSize / 1GB, 2)) GB"
Write-Host "  update-binary: ✓ 已找到"
Write-Host ""

# 检查目标 zip 是否已存在
if (Test-Path $dst) {
    Write-Host "[警告] 目标文件已存在: $dst" -ForegroundColor Yellow
    $ans = Read-Host "  是否覆盖? (y/n)"
    if ($ans -ne "y" -and $ans -ne "Y") {
        Write-Host "已取消"
        pause
        exit 0
    }
    Remove-Item $dst -Force
}

Write-Host "[步骤 2/3] 打包 update.zip..." -ForegroundColor Yellow
Write-Host "  从: $src"
Write-Host "  到: $dst"
Write-Host "  (压缩可能需要 3-10 分钟)"
Write-Host ""

# 使用 .NET 压缩
try {
    Add-Type -AssemblyName System.IO.Compression.FileSystem
    [System.IO.Compression.ZipFile]::CreateFromDirectory(
        $src,
        $dst,
        [System.IO.Compression.CompressionLevel]::Optimal,
        $false  # includeBaseDirectory = false
    )
    Write-Host "  打包完成!" -ForegroundColor Green
} catch {
    Write-Host "[错误] 打包失败: $_" -ForegroundColor Red
    pause
    exit 1
}

Write-Host ""
Write-Host "[步骤 3/3] 验证 update.zip 结构..." -ForegroundColor Yellow
try {
    Add-Type -AssemblyName System.IO.Compression
    $zip = [System.IO.Compression.ZipFile]::OpenRead($dst)
    $hasMetaInf = $false
    $hasBoot = $false
    $hasSystem = $false

    foreach ($entry in $zip.Entries) {
        if ($entry.FullName -like "META-INF/com/google/android/update-binary") {
            $hasMetaInf = $true
        }
        if ($entry.FullName -like "boot.img") {
            $hasBoot = $true
        }
        if ($entry.FullName -like "system.new.dat*") {
            $hasSystem = $true
        }
    }
    $zip.Dispose()

    if ($hasMetaInf -and $hasBoot -and $hasSystem) {
        Write-Host "  ✓ META-INF/com/google/android/update-binary"
        Write-Host "  ✓ boot.img"
        Write-Host "  ✓ system.new.dat*"
        Write-Host "  验证通过!" -ForegroundColor Green
    } else {
        Write-Host "  警告:某些关键文件缺失" -ForegroundColor Yellow
        Write-Host "    META-INF: $hasMetaInf"
        Write-Host "    boot.img: $hasBoot"
        Write-Host "    system.new.dat: $hasSystem"
    }
} catch {
    Write-Host "  验证过程出错,但 zip 已生成。请手动检查。" -ForegroundColor Yellow
}

Write-Host ""
Write-Host "============================================================" -ForegroundColor Cyan
Write-Host "  完成! update.zip 已生成" -ForegroundColor Green
Write-Host "  位置: $dst"
Write-Host ""
Write-Host "  下一步操作:" -ForegroundColor Yellow
Write-Host "  1. 把 update.zip 复制到 U 盘根目录"
Write-Host "  2. U 盘格式化为 FAT32 或 exFAT"
Write-Host "  3. 手机进 recovery 模式(电源+音量上,或音量上+下+电源)"
Write-Host "  4. 通过 OTG 连接 U 盘"
Write-Host "  5. recovery 菜单:Apply update from SD card"
Write-Host "============================================================" -ForegroundColor Cyan
pause
