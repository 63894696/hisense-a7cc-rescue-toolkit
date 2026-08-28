# oi_enhancements / Prisir AI

> **Prisir(湃睿思) AI** — 本地对话式 AI 助手,免登录,系统级 Agent,本地优先。

这是 `oi_enhancements` 仓库,包含 Prisir AI、oiagent、prisr_findex、
prisr_fcontent、fastlane、aureon 等子项目。

更详细的架构说明请阅读 [ARCHITECTURE-2026-07-03.md](./ARCHITECTURE-2026-07-03.md)
与 [INVENTORY-2026-07-03.md](./INVENTORY-2026-07-03.md)。仓库根目录还有
按子项目组织的 `docs/` 目录,提供设计与计划文档。


## 子项目概览

| 子项目 | 说明 |
| ------ | ---- |
| `oiagent_web.py` | 主 Web 后端(国画风聊天 UI + LLM 路由 + SQLite 持久化) |
| `oiagent-shell/` | Electron 对话壳(系统托盘常驻,全局热键,自启动) |
| `prisir_findex/` | Rust 本机文件搜索引擎(类 Everything,只索引元数据) |
| `prisir_fcontent/` | 文件内容索引与 OCR(支持翻译、截图识图) |
| `fastlane/` | LLM provider 路由(Anthropic / OpenAI / 兼容 API) |
| `aureon/` | 端侧 Agent 核心模块 |
| `crypto_conduit/` | token / 加密通道 |
| `e2e_share_a2h/`, `e2e_share_rot/` | 配对 / 局域网 / 遥控 |
| `assets/` | 项目图标与 UI 资源(受 TRADEMARKS.md 约束) |
| `installer/` | 安装/卸载脚本(Windows NSIS + Linux bash) |
| `docs/` | 设计与计划文档 |

## 平台

- **Windows**:NSIS 安装包(`installer/PrisirAI-Setup-*.exe`)。
- **Linux**:Debian/Ubuntu bash 安装脚本(`installer/linux-install.sh`),
  X11 + GTK(测试于 Debian 13 + xfwm4)。
- **macOS**:未测试,代码路径已尽量跨平台但需用户自行打包。


## License

OI Enhancements is available for **personal non-commercial use** under
the **OI Enhancements Personal and Commercial Source License v1.0
(OIE-PCS-1.0)**.

- **Commercial use**, organizational deployment, paid services,
  commercial distribution, and integration into commercial products
  require a separate written commercial license from the Project
  Copyright Holder. See [COMMERCIAL-LICENSE.md](./COMMERCIAL-LICENSE.md).
- **Modifications to designated Core Components** (see
  [CORE-COMPONENTS.md](./CORE-COMPONENTS.md)) must be made available
  under OIE-PCS-1.0 when Distributed or made available as a Network
  Service.
- **Brand and trademarks** — including the names "Prisir AI",
  "oiagent", "prisraiclass", the Prisir flame logo, and the icons in
  `assets/` — are **not** licensed by OIE-PCS-1.0. See
  [TRADEMARKS.md](./TRADEMARKS.md).
- **Past versions** may be additionally available under the Apache
  License 2.0. See [LICENSE-POLICY.md](./LICENSE-POLICY.md) for the
  delayed permissive licensing strategy.

SPDX-License-Identifier: `LicenseRef-OI-Enhancements-PCS-1.0`

> **Note**: OIE-PCS-1.0 is **not** an OSI-approved open source
> license because it restricts Commercial Use and reserves Brand
> rights. It is a source-available license with a commercial
> licensing pathway.

### Legal framework (current version)

- **Governing law**: laws of the Hong Kong Special Administrative
  Region (HK SAR).
- **Dispute resolution**: arbitration administered by the Hong Kong
  International Arbitration Centre (HKIAC), seat Hong Kong.
- **Language of arbitration**: English, with right to submit
  Chinese-language evidence without translation at the tribunal's
  discretion.
- **Commercial license defaults**: 1-year term; devices/users per
  executed agreement; minor-version upgrades included; major-version
  upgrades by paid addendum.
- **Breach**: 30-day written notice + 30-day cure period for general
  breaches; immediate termination for unlicensed Commercial Use,
  Brand misuse, undisclosed Core Component modifications, and patent
  litigation against the Project Copyright Holder.
- **Enforcement**: arbitral award enforceable under Mainland-HK
  Reciprocal Enforcement Arrangement (2019), New York Convention
  (1958), and Hague Judgments Convention (2019/2023).

The full 23-section text is in [LICENSE](./LICENSE).

### Per-version licensing summary

| Version | Primary License | Additional Future License | Status |
| ------- | --------------- | ------------------------- | ------ |
| Latest stable (v2.x) | OIE-PCS-1.0 | (none) | Active |
| v1.x after v2.0 ships | OIE-PCS-1.0 | Apache-2.0 | Legacy Community Release |
| v0.x and earlier | as published | (none) | Archived |

See [LICENSE-POLICY.md](./LICENSE-POLICY.md) for the detailed policy.


## Contributing

See [CONTRIBUTING.md](./CONTRIBUTING.md). All contributions require
DCO sign-off (`git commit -s`); contributions to Core Components or
large contributions additionally require a CLA.


## Third-party components

See [THIRD-PARTY-NOTICES](./THIRD-PARTY-NOTICES) for the full list
of Python / Rust / Node.js dependencies and their licenses.


## Security

Please report security issues privately to the contact listed in
[COMMERCIAL-LICENSE.md](./COMMERCIAL-LICENSE.md). Do **not** open a
public GitHub issue for security vulnerabilities.


## Trademark and brand use

See [TRADEMARKS.md](./TRADEMARKS.md). Factual references are
permitted; use of the Brand for commercial purposes requires a
separate Brand license.


## Contact

- GitHub: https://github.com/63894696/oi_enhancements
- Commercial license inquiries: open a GitHub issue with the
  `commercial-license` label.
- See [COMMERCIAL-LICENSE.md](./COMMERCIAL-LICENSE.md) for full
  contact details.


## Copyright

Copyright (c) 2026 63894696. All rights reserved.

The Software is licensed (not sold) under the terms of
[OIE-PCS-1.0](./LICENSE). Brand elements are reserved under
[TRADEMARKS.md](./TRADEMARKS.md).
