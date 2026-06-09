# ApplicantLens

> Status: **scaffolding / pending rebuild.** The application was originally built
> on a personal machine and is being rebuilt here from a handoff bundle
> (`HANDOFF.md` + screenshots + source). This file should be filled in with the
> real details once that bundle lands.

## What this is

ApplicantLens — a Motive TA (Talent Acquisition) Hackathon project. _(Fill in a
one-line description and the core user flows from the handoff doc.)_

## Stack

_TBD — populate from the handoff bundle (language, framework, UI library,
package manager)._

## Setup & run

Dependencies install automatically via the SessionStart hook
(`.claude/hooks/session-start.sh`). To run manually:

```bash
# install:  <fill in once stack is known>
# dev:      <fill in>
# test:     <fill in>
# lint:     <fill in>
```

## Conventions (Motive)

- **Commits**: Conventional Commits with an uppercase Jira key —
  `type(JIRA-KEY): subject` (e.g. `feat(DEVPRD-123): add resume parser`).
  Allowed types: `feat, fix, perf, revert, docs, style, refactor, test, build,
  ci, chore`. Imperative subject, no trailing period, max 100 chars.
- **Branches / PRs**: include the Jira ID.
- **Tests**: new behavior ships with unit tests in the same PR.
- **Data**: keep real applicant PII and secrets out of the repo; use
  `.env.example` and synthetic/sample data only.

## Design fidelity

Preserving the original look & feel is a priority. Use the screenshots and the
design-system section of the handoff doc as the source of truth when rebuilding
UI.
