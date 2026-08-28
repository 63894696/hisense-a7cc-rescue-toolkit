# Contributing to OI Enhancements

Thanks for considering contributing to OI Enhancements (Prisir AI,
oiagent, prisir_findex, prisir_fcontent, fastlane, and related
projects in this repository). This document explains how to
contribute, what license Your contribution will be under, and how
the project handles relicensing of past releases.


## License of Your contribution

By submitting a contribution (patch, pull request, code, document,
icon, translation, or any other material) to this repository, You
agree to the following:

### Developer Certificate of Origin (DCO) — required

All commits MUST be signed off using the DCO. Add a `-s` flag to
`git commit`, which adds a `Signed-off-by:` line to the commit
message:

```
Signed-off-by: Your Name <your.email@example.com>
```

The `Signed-off-by:` line certifies, under penalty of perjury, that:

> (a) I created this contribution myself, OR
> (b) I have the right to submit it under the project's license, OR
> (c) I have received explicit permission from the contributor to
>     submit it on their behalf.

This is the [Developer Certificate of Origin 1.1](https://developercertificate.org/).
The full text is at the bottom of this document.


### Contributor License Agreement (CLA) — required for substantial contributions

For contributions larger than ~200 lines OR contributions to Core
Components (see CORE-COMPONENTS.md) OR any contribution that will
be part of a release that the Project Copyright Holder intends to
relicense under Apache-2.0 (see LICENSE-POLICY.md), You must also
sign a CLA.

The CLA grants the Project Copyright Holder the right to:

- redistribute Your contribution under the project's current license
  (OIE-PCS-1.0);
- redistribute Your contribution under any Future License that the
  Project Copyright Holder may choose to apply to that release
  (including Apache-2.0);
- hold copyright for the purpose of enforcing the project license.

The CLA does NOT transfer ownership of Your contribution to the
Project Copyright Holder; You retain copyright and are credited
in the NOTICE / AUTHORS file as appropriate.

The CLA process is light-weight: a per-PR bot will ask You to
sign the CLA via GitHub (electronic signature is sufficient).


### Why we ask for DCO + CLA

The DCO certifies Your right to submit. The CLA preserves the
Project Copyright Holder's ability to apply **Future Licenses** as
described in LICENSE-POLICY.md. Without CLA, the Project Copyright
Holder cannot safely relicense a release under Apache-2.0 because
there would be no record of Your consent.

The CLA does **not** allow the Project Copyright Holder to do
anything other than what LICENSE-POLICY.md already says is the
project's intent. It is purely an evidence-of-consent mechanism.


## How to submit a contribution

1. **Fork** the repository on GitHub.
2. **Create a feature branch** (`git checkout -b my-feature`).
3. **Make your changes**. Add tests where reasonable.
4. **Sign off** each commit (`git commit -s`).
5. **Push** the branch to Your fork.
6. **Open a Pull Request** against `master` of the upstream.

The maintainers will review Your PR. Reviews may take 5–15 business
days. We may ask for changes, additional tests, or documentation.

### Coding style

- Python: PEP 8; type hints where reasonable; comments in
  Simplified Chinese / English.
- JavaScript / TypeScript: 2-space indent; match existing style in
  the same file.
- Rust: standard `cargo fmt` and `cargo clippy`.
- Use the existing logging and error-handling patterns of the
  module You are editing.


## What kinds of contributions are welcome

| Kind | Welcome? | Notes |
| ---- | -------- | ----- |
| Bug fix | yes | add a regression test if practical |
| Documentation fix | yes | typo / clarity / translation |
| Performance improvement | yes | include before/after numbers |
| New tool / connector | yes | if it fits the project scope |
| New LLM provider in fastlane | yes | add adapter + tests |
| Translation (UI strings) | yes | PRs to docs/ and assets |
| New icon / logo | discuss first | Brand policy applies |
| Major architectural change | discuss first | open an issue first |
| Anything that adds a network call to a third-party server | discuss first | privacy / egress discipline |
| Re-branding the project under a different name | NO | this is the original project |


## What kinds of contributions are NOT accepted

- Anything that adds advertising, tracking, or telemetry to the
  Software without the user's informed consent.
- Anything that weakens the LICENSE §3 source-availability obligation
  for Core Components.
- Anything that takes code from a third-party project whose license
  is incompatible with OIE-PCS-1.0 (e.g. GPLv3-only code into MIT
  modules), unless properly isolated.
- Anything that introduces a non-trivial dependency on a non-open
  source library, without prior approval.


## Code of conduct

We follow the Contributor Covenant 2.1. The full text is at
https://www.contributor-covenant.org/version/2/1/code_of_conduct/.

In short: be respectful, be constructive, assume good faith, and
focus on the technical merits.


## Security vulnerabilities

If You find a security issue, **DO NOT open a public issue**. Send
a private email to the address in COMMERCIAL-LICENSE.md, or use
GitHub's private vulnerability reporting. We aim to acknowledge
within 3 business days.


## Release process

Releases are tagged on `master`. Each release tag is immutable;
the LICENSE / LICENSE-APACHE / CORE-COMPONENTS.md state at the tag
governs that release. LICENSE-POLICY.md describes when a release
transitions to Legacy Community Release under Apache-2.0.


## DCO full text (1.1)

```
Developer Certificate of Origin
Version 1.1

By making a contribution to this project, I certify that:

(a) The contribution was created in whole or in part by me and I
    have the right to submit it under the open source license
    indicated in the file; or

(b) The contribution is based upon previous work that, to the best
    of my knowledge, is covered under an appropriate open source
    license and I have the right under that license to submit that
    work with modifications, whether created in whole or in part
    by me, under the same open source license (unless I am
    permitted to submit under a different license), as indicated
    in the file; or

(c) The contribution was provided directly to me by some other
    person who certified (a), (b) or (c) and I have not modified
    it.

(d) I understand and agree that this project and the contribution
    are public and that a record of the contribution (including all
    personal information I submit with it, including my sign-off) is
    maintained indefinitely and may be redistributed consistent with
    this project or the open source license(s) involved.
```


Last updated: 2026-08-28
