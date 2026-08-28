# License Policy (OIE-PCS-1.0 §8)

This document is incorporated into the OI Enhancements Personal and
Commercial Source License (OIE-PCS-1.0). It describes the project's
**delayed permissive licensing strategy**: how current and historical
versions of the Software are licensed, and how future versions may be
licensed.

This is a **policy** statement — it is not itself a license grant.
The actual license grants are in LICENSE (OIE-PCS-1.0), LICENSE-APACHE
(when applicable), and per-release commercial agreements.


## Goals

This project adopts a **delayed permissive licensing** strategy to
balance two legitimate interests:

1. **Protect the project during promotion**. While a version is the
   current "active" release, it is licensed under OIE-PCS-1.0 so that
   Commercial Use requires a paid commercial license. This preserves
   the option of selling commercial support, OEM integration rights,
   and enterprise features to for-profit users, and prevents direct
   cloning of the active version as a competing commercial product.

2. **Reward the community over time**. Once a version is no longer
   the active release, it becomes a **Legacy Community Release** and
   is made additionally available under the **Apache License 2.0**.
   Users who do not need the active release's features may use the
   legacy version under Apache-2.0 for any purpose, including
   commercial use, closed-source integration, and redistribution.

This policy is publicly stated in advance so that users can rely on
its terms and so that the project does not appear to change license
terms arbitrarily.


## Per-version licensing

For each released version of the Software, the following license set
applies:

### Current version (active release)

| Version | Primary License | Future License | Status |
| ------- | --------------- | -------------- | ------ |
| Latest stable release tag | OIE-PCS-1.0 | (none) | Active |

Only OIE-PCS-1.0 applies. Users may not use the active release under
Apache-2.0. Commercial Use of the active release requires a commercial
license from the Project Copyright Holder.

### Previous major version (legacy)

After the **next major version** (e.g. v2.0) is published as the new
active release, the immediately preceding major version (e.g. v1.x)
enters the following state:

| Version | Primary License | Additional Future License | Status |
| ------- | --------------- | ------------------------- | ------ |
| v(N-1).x | OIE-PCS-1.0 | Apache-2.0 | Legacy Community Release |

From the date the next major version is published, users of that
legacy release may choose to rely on **either** OIE-PCS-1.0 **or**
Apache-2.0. Both licenses are granted for that specific release; the
recipient may pick whichever license better fits their use case.

### Older versions

Releases older than two major versions remain under the license set
in effect at their original publication. The Project Copyright
Holder will not retroactively revoke any license previously granted,
but is not obligated to add Apache-2.0 to releases that did not
receive it when they became legacy.


## Concretely: how a v1.x → v2.0 transition will work

When v2.0 is published:

1. v2.0 is licensed **only** under OIE-PCS-1.0 (the new active
   release).
2. v1.x becomes a **Legacy Community Release** and is additionally
   available under Apache-2.0 from the same source. The v1.x LICENSE
   file is amended by adding a NOTICE OF ADDITIONAL LICENSE GRANT
   pointing to LICENSE-APACHE-2.0; OIE-PCS-1.0 is NOT removed.
3. Users of v1.x may now use v1.x under either license. OIE-PCS-1.0
   continues to bind those who choose it. Apache-2.0 binds those who
   choose it. **A user of v1.x is NOT required to use Apache-2.0.**
4. v0.x (and earlier, if any) remains under whatever license set
   was in effect at its publication and is not changed retroactively.

The Project Copyright Holder will publish a clear NOTICE in each
affected Git tag and GitHub Release explaining the additional license
grant.


## Why not just publish everything as Apache-2.0?

Publishing the active release under Apache-2.0 would, in practice,
allow any company to take the active release as the basis of a
competing commercial product (closed-source fork, rebranded SaaS,
bundled hardware), with no obligation beyond retaining the LICENSE
and NOTICE files. The Project Copyright Holder would have no way
to monetize Commercial Use of the active release, which would
remove the economic option of funding future development through
commercial support.

The delayed-permissive model preserves the long-term community
benefit (every past version eventually becomes Apache-2.0) while
protecting the active release long enough to fund ongoing work.


## Contributor licensing

For any version to be relicensed under a Future License (including
Apache-2.0) on this schedule, **all contributors to that version
must have agreed** that their contributions may be redistributed
under such Future License.

This is implemented in `CONTRIBUTING.md` via the Developer Certificate
of Origin (DCO) sign-off and an optional Contributor License
Agreement (CLA). Without DCO sign-off and, where required, CLA
signature, a contribution cannot be accepted into a release that
will later be relicensed under Apache-2.0.


## What this policy does NOT do

- It does **not** revoke or reduce any license rights already
  granted.
- It does **not** commit the Project Copyright Holder to release
  any specific Future License on any specific schedule. The policy
  in this document states an intent; the actual Future License
  grant requires a per-release NOTICE of ADDITIONAL LICENSE GRANT.
- It does **not** allow the Project Copyright Holder to change the
  license of a version retroactively against any contributor's
  rights. If a contributor objects to a Future License, the Project
  Copyright Holder will either omit the Future License for that
  release, replace the contributor's code, or remove the contribution.
- It does **not** affect the Brand. Brand is **always** subject to
  TRADEMARKS.md and is **never** relicensed under Apache-2.0 or any
  other Future License.
- It does **not** affect third-party components, which remain under
  their own licenses per THIRD-PARTY-NOTICES.


## How to use this policy

If You are integrating this project:

- For the **latest active release**, read LICENSE (OIE-PCS-1.0)
  and obtain a commercial license if You plan Commercial Use.
- For a **legacy release** that has a NOTICE OF ADDITIONAL LICENSE
  GRANT, You may pick whichever license is more convenient for
  Your use case. If Your use case is commercial, Apache-2.0 is
  typically the simpler path.
- For a **legacy release** that does not yet have such a NOTICE,
  OIE-PCS-1.0 applies in full.

If You are contributing code, read CONTRIBUTING.md and follow the
DCO / CLA process so that Your contribution can be part of future
releases that are relicensed under Apache-2.0.


## Contact

Questions about this policy, license grants, or commercial licensing
should be directed to the contact listed in COMMERCIAL-LICENSE.md.


Last updated: 2026-08-28
