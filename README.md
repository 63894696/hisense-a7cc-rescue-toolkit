# Hisense A7 CC (HNR320T) 救砖工具与文档

海信阅读手机 A7 CC / HNR320T / 紫光展锐 UD710 (T7510) 救砖工具包

> **成功救活案例**:2026-07-20 从完全黑屏 + USB 不识状态成功救活

## 🎯 这是什么

- **救砖工具**:`spd_dump` (Linux) + Windows 驱动 + WSL 配置
- **完整文档**:从完全黑屏到恢复系统的每一步操作
- **备份文件**:原厂 SPL/teecfg/tos/sml 安全分区备份
- **踩坑记录**:Zadig / usbipd / WSL / autodload 模式的所有坑

## 🚀 快速开始

### 前置条件

- Windows 10/11 + WSL2 Ubuntu
- 海信 A7 CC (HNR320T) 手机
- 手机能进 autodload 模式(音量上+音量下+电源)

### 救砖流程

```bash
# 1. 装 WinUSB 驱动(用 Zadig)
# 2. 装 usbipd-win, bind + attach iWHALE2 到 WSL
# 3. 在 WSL 里跑 spd_dump 命令
```

完整步骤见 [docs/救砖复盘-成功.md](docs/救砖复盘-成功.md)

## 📁 目录结构

```
hisense-a7cc-rescue-toolkit/
├── README.md                       ← 本文档
├── docs/
│   ├── 救砖复盘-成功.md            ← 完整救砖过程
│   ├── 救砖后必做清单.md           ← 救砖后注意事项
│   └── 按键组合.md                 ← 所有按键模式
├── tools/
│   ├── spd_dump                    ← Linux 版 spd_dump
│   ├── spd_dump_interactive        ← 交互版
│   ├── fdl1-dl.bin                 ← FDL1 下载协议
│   ├── uboot-mod.bin               ← 修改版 uboot
│   ├── u-boot-spl-16k-sign.bin     ← 签名版 SPL
│   ├── userdata.bin                ← 清空模板
│   └── drivers/                    ← Windows 驱动集合
├── backup/
│   ├── spl.bin                     ← 原厂 SPL 备份
│   ├── teecfg.bin                  ← TEE 配置备份
│   ├── tos.bin                     ← TOS 备份
│   ├── sml.bin                     ← SML 备份
│   └── contacts.vcf                ← 联系人备份
└── scripts/
    ├── install-drivers.bat         ← Windows 一键装驱动
    ├── make-update-zip.ps1         ← update.zip 打包
    └── rescue.sh                   ← 救砖一键脚本
```

## ⚠️ 重要提示

1. **救砖有风险** - 擦 SPL 后必须立刻写新 SPL,不能断电
2. **WSL 必需** - spd_dump.exe 在 Windows 下找不到设备(已知问题)
3. **驱动必须 WinUSB** - Zadig 装 libusbK 会拦截 spd_dump
4. **按键组合要对** - autodload 是 音量上+下+电源,重启是 电源+音量上

## 🙏 参考与致谢

- [4bitFox/hisense_a7cc](https://github.com/4bitFox/hisense_a7cc) - 救砖工具来源
- [4bitFox/CVE-2022-38694](https://github.com/4bitFox/CVE-2022-38694_unlock_bootloader) - spd_dump 工具
- [TomKing062/CVE-2022-38694](https://github.com/TomKing062/CVE-2022-38694_unlock_bootloader) - CVE 研究
- [Zadig](https://zadig.akeo.ie/) - USB 驱动安装
- [usbipd-win](https://github.com/dorssel/usbipd-win) - USB 转发工具

## 📝 License

MIT - 自由使用,欢迎分享

---

**如果你也有海信 A7 CC 救砖需求,这个仓库能帮你少走弯路。**
