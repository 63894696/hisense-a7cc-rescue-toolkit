#!/bin/bash
# 海信 A7 CC (HNR320T) 救砖一键脚本
# 需要在 WSL Ubuntu 里运行

set -e

echo "============================================================"
echo "  海信 A7 CC (HNR320T) 救砖一键脚本"
echo "============================================================"
echo ""

# 检查是否 root
if [ "$EUID" -ne 0 ]; then
    echo "[错误] 请用 root 用户运行 (sudo 或 WSL 默认 root)"
    exit 1
fi

# 检查 spd_dump 是否存在
if [ ! -f "./spd_dump" ]; then
    echo "[错误] spd_dump 不存在,请确认你在正确的目录"
    echo "        应该是 tools/ 目录,包含 spd_dump / fdl1-dl.bin 等"
    exit 1
fi

echo "[步骤 1/4] 备份原厂安全分区..."
./spd_dump skip_confirm 1 fdl fdl1-dl.bin 0x5500 fdl uboot-mod.bin 0x9efffe00 \
  exec read_part splloader 0 1m spl.bin \
       read_part teecfg 0 1M teecfg.bin \
       read_part trustos 0 6M tos.bin \
       read_part sml 0 1M sml.bin \
       erase_part splloader erase_part splloader_bak reset

echo ""
echo "[步骤 2/4] 等待 5 秒..."
sleep 5

echo ""
echo "[步骤 3/4] 写回安全分区..."
./spd_dump fdl fdl1-dl.bin 0x5500 fdl uboot-mod.bin 0x9efffe00 \
  fdl teecfg.bin 0x9401fe00 \
  fdl tos.bin 0x9403fe00 \
  fdl sml.bin 0x93fffe00 \
  exec skip_confirm 1

echo ""
echo "[步骤 4/4] 写签名 SPL + 清 userdata..."
./spd_dump fdl fdl1-dl.bin 0x5500 fdl uboot-mod.bin 0x9efffe00 \
  exec skip_confirm 1 erase_part uboot_log \
       write_part splloader u-boot-spl-16k-sign.bin \
       timeout 100000 \
       write_part userdata userdata.bin reset

echo ""
echo "============================================================"
echo "  救砖完成!"
echo "============================================================"
echo ""
echo "接下来:"
echo "1. 手机会自动重启"
echo "2. 第一次开机时间较长,耐心等 5-10 分钟"
echo "3. 如果还是黑屏,长按电源 20 秒强制重启"
