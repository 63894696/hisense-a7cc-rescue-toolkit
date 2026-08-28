# Security Policy

OI Enhancements takes security seriously. This document explains how
to report vulnerabilities and what to expect from the maintainers.


## Supported versions

The following versions of OI Enhancements receive security updates:

| Version | Supported |
| ------- | --------- |
| Latest stable (v2.x) | yes |
| Previous major (v1.x) | best-effort, only critical fixes |
| v0.x and earlier | no |

We follow a "fix in next minor" policy: security fixes for the
latest stable release are typically shipped in the next minor
release (e.g. v2.6.x → v2.6.x+1) within 30 days of confirmed
fix. Critical vulnerabilities affecting local data integrity or
authentication are expedited.


## How to report a security issue

**Do NOT open a public GitHub issue for security vulnerabilities.**

Instead, use one of these private channels:

1. **GitHub private vulnerability reporting**: on the repository's
   Security tab, click "Report a vulnerability". This sends the
   report privately to the maintainers.
2. **Email**: see [COMMERCIAL-LICENSE.md](./COMMERCIAL-LICENSE.md)
   for the security contact email.

Please include:

- a clear description of the vulnerability;
- steps to reproduce (or a proof-of-concept);
- the affected version(s) and platform (Windows / Linux / macOS);
- any known impact (data exposure, code execution, etc.);
- your name / handle if You would like to be credited in the
  advisory.


## What to expect

| Stage | Time target |
| ----- | ----------- |
| Acknowledgement of the report | within 3 business days |
| Initial triage (severity, scope) | within 7 business days |
| Status update on the fix | every 14 days until resolved |
| Public advisory | after a fix is released, or within 90 days of the report, whichever is earlier |

We follow a **coordinated disclosure** model: we ask that You do
not disclose the vulnerability publicly until we have released a
fix, or until 90 days have passed since the report, whichever is
earlier.


## Severity rating

We use the [CVSS 3.1](https://www.first.org/cvss/calculator/3.1)
scoring as a guide:

| Severity | CVSS | Example |
| -------- | ---- | ------- |
| Critical | 9.0–10.0 | remote code execution from a sandboxed component |
| High | 7.0–8.9 | local privilege escalation, plaintext token exposure |
| Medium | 4.0–6.9 | cross-site scripting, unauthenticated access to non-sensitive routes |
| Low | 0.1–3.9 | denial of service via malformed input |

The actual severity is decided by the maintainers based on
real-world impact, not just the CVSS score.


## Out-of-scope

The following are NOT considered vulnerabilities in OI Enhancements
unless caused by a bug in the Software itself:

- vulnerabilities in third-party dependencies (report upstream
  instead; we will pick up the fix in our next dep refresh);
- vulnerabilities in user-supplied local model servers;
- vulnerabilities in user-supplied PrisirWork tokens stored at
  `~/.prisir/work.json` (this is the user's responsibility; the
  Software reads it with appropriate file mode on Unix);
- reports that require the user to install a malicious package
  themselves (e.g. typosquatting);
- issues that are entirely about the Brand or license terms (use
  TRADEMARKS.md / LICENSE-POLICY.md instead).


## Bug bounty

OI Enhancements does **not** currently run a paid bug bounty
program. We credit reporters in the advisory and in the
`AUTHORS.md` file (when present) at the reporter's option.

If Your organization requires a paid bounty or paid SLAs, please
contact us for a commercial security agreement via
[COMMERCIAL-LICENSE.md](./COMMERCIAL-LICENSE.md).


## Past advisories

Past security advisories will be published in the GitHub Security
tab under "Advisories". A consolidated list will be added here
once any advisories exist.


## Acknowledgement

Thanks to the security researchers and users who report
vulnerabilities responsibly.


Last updated: 2026-08-28
