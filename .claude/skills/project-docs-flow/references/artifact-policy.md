# Artifact Policy

Use selective versioning.

## Track

- Requirement docs and design docs.
- HTML demos that explain or verify a UX.
- Key screenshots that support visual QA, bug reports, or acceptance.
- QA reports, test summaries, and review notes.
- Source assets needed to reproduce the work.
- Small generated assets that are part of the deliverable.

## Ignore Or Delete

- `scratch/` exploration.
- Cache files and build outputs.
- Personal Claude settings such as `.claude/settings.local.json`.
- Temporary logs, huge raw logs, and repeated failed-output dumps.
- Large binary exports unless they are explicitly part of the deliverable.

## Before Closing A Requirement

Move durable evidence from `scratch/` into the correct `assets/` or `outputs/` folder. Delete or leave ignored anything that is not worth preserving.

Record all important validation evidence in `VALIDATION.md`, even when the raw output file is not tracked.
