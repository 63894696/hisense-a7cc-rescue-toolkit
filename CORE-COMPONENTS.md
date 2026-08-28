# Core Components (OIE-PCS-1.0 §1, §3)

This document is incorporated into the OI Enhancements Personal and
Commercial Source License (OIE-PCS-1.0). Modifications to the files and
directories listed below, when **Distributed** or made available as a
**Network Service** (as defined in LICENSE §1 and §3), must be made
available under the terms of OIE-PCS-1.0 per LICENSE §3.

This list is the **single source of truth** for which paths are
"Core Components". Paths NOT listed here are not Core Components and
are not subject to the source-availability obligation of LICENSE §3
when used outside Commercial Use.


## Core Components (modifications must be made available under OIE-PCS-1.0)

The following paths are Core Components. Modifications inside these
paths, when Distributed or made available as a Network Service, must
be made available under OIE-PCS-1.0.

### oiagent runtime (Python 后端)
- `oiagent_web.py`                          — 主 Web 后端(国画风聊天 UI + 路由 + LLM 代理)
- `oiagent_cli.py`                          — CLI 入口
- `oiagent_context.py`                      — 上下文用量统计
- `oiagent_dev_consumer.py`                 — 开发态消费者

### oiagent-shell (Electron 对话壳)
- `oiagent-shell/main.js`                   — 主进程(后端 spawn + 窗口/托盘/全局热键)
- `oiagent-shell/preload.js`                — 渲染层 preload(白名单 IPC)
- `oiagent-shell/package.json`              — 壳依赖与打包配置

### prisir_findex (Rust 本机文件搜索引擎)
- `prisir_findex/src/`                      — Rust 引擎源码
- `prisir_findex/Cargo.toml`
- `prisir_findex/Cargo.lock`
- `prisir_findex/shell_findex.py`           — Python ctypes 封装
- `prisir_findex/ffi/`                      — FFI 声明头(如有)

### prisir_fcontent (Rust + Python 文件内容索引)
- `prisir_fcontent/__init__.py`
- `prisir_fcontent/engine.py`
- `prisir_fcontent/extract.py`
- `prisir_fcontent/overlay_translate.py`
- `prisir_fcontent/tokenize.py`
- `prisir_fcontent/verify.py`
- `prisir_fcontent/ocr_eval.py`
- `prisir_fcontent/models/`                 — OCR 模型权重目录(单独授权,见 THIRD-PARTY-NOTICES)
- `prisr_fcontent/src/`                     — Rust 引擎源码(如有)

### Fastlane (LLM 路由层)
- `fastlane/adapters/`                      — LLM adapter(Anthropic / OpenAI / 兼容 API)
- `fastlane/providers/`                     — provider 工厂
- `fastlane/providers/llm_cloud.py`
- `fastlane/providers/factory.py`

### Prisir 桌面 / 端侧 Agent 核心
- `aureon/`                                 — 端侧 Agent 核心模块
- `aureon/nix/`

### 配对 / 局域网 / 遥控核心
- `e2e_share_a2h/`                          — agent ↔ host 共享/配对核心
- `e2e_share_rot/`                          — 旋转/路由
- `crypto_conduit/`                         — token / 加密通道核心
- `crypto_conduit/src/`


## NOT Core Components (modifications do NOT trigger LICENSE §3 obligations)

The following are NOT Core Components. Modifications to these paths
do NOT, on their own, trigger the source-availability obligation of
LICENSE §3, provided such modifications are not Distributed as part
of Commercial Use without a commercial license.

### 文档
- `README.md`, `ARCHITECTURE-*.md`, `docs/`
- `*.md` at any depth
- `chatroom.html`                           — 客户端页面 UI(纯前端)

### 测试 / 评估
- `*_test/`, `tests/`, `test/`, `*_eval/`
- `audio_voice_eval/`
- `e2e/`, `e2e_*`(除非上面已列为 Core)

### 第三方依赖与运行产物
- `node_modules/`
- `prisir_findex/target/`                   — Rust 编译产物
- `prisir_fcontent/models/` 已在 Core 列出(模型权重单独授权)
- `dist/`, `build/`, `__pycache__/`, `.venv/`

### 个人开发 / 实验 / 备份 / 临时
- `_*.py`, `_*.png`, `_*.log`, `_*.db`
- `backup-*/`
- `%TEMP%/`
- `*.bak`, `*.tmp`

### 用户级配置 / 运行时数据库(本机生成,不进入仓库)
- `prisir_findex/findex.db`
- `prisir_fcontent/fcontent.db`, `*-shm`, `*-wal`

### 构建与安装脚本(可独立选择许可证使用)
- `installer/`                              — 安装/卸载脚本(可作为独立产物使用)
- `fastlane/` 顶层 build / config 脚本(非 adapter/provider)

### 资源与第三方资源
- `assets/`                                 — 图标/UI 资源;Brand 元素使用受 TRADEMARKS.md 约束
- `audio/`, `audio_voice_eval/`             — 语音/TTS 样本


## How to interpret this list

- Paths are matched as **prefixes** (directory) or **exact files**.
- A modification that **transitively** affects a Core Component
  (e.g. by changing its public API used by another module) is
  itself considered a modification of the Core Component for the
  purposes of LICENSE §3.
- If a Core Component path is renamed or moved, this document is
  authoritative: the path listed here continues to be a Core Component
  regardless of the actual file system location, and the contributor
  of the rename must update this document in the same commit.
- If You are uncertain whether a path is a Core Component, treat it
  as a Core Component, or contact the Project Copyright Holder before
  Distribution.


## Changes to this document

This document may be amended by the Project Copyright Holder at any
time. The version of this document in effect at the time of Your
Distribution governs the source-availability obligation for that
Distribution.

Last updated: 2026-08-28
