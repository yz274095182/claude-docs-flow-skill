# Requirement Package

Each meaningful feature request should get one package under:

```txt
.claude/requirements/<YYYYMMDD-slug>/
```

## File Roles

`REQUEST.md`
: Raw user request, conversation excerpts that matter, hard constraints, and links to related issues or prior requirements.

`SPEC.md`
: Current executable requirement. This is the main implementation contract.

`BACKEND_DESIGN.md`
: API, data model, service, integration, security, migration, and backend validation notes.

`FRONTEND_DESIGN.md`
: UI flow, state, components, interaction, accessibility, responsive behavior, and visual QA notes.

`TASKS.md`
: Ordered implementation checklist with owner/status when useful.

`VALIDATION.md`
: Commands run, browser/manual checks, screenshots reviewed, known gaps, and why anything was not run.

`HANDOFF.md`
: Final state, changed files summary, unresolved work, next recommended command, and context for future sessions.

## Directory Roles

`assets/source/`
: User-provided references, source images, sample data, design inputs, or API examples.

`assets/generated/`
: Generated images, transformed assets, fixtures, or sample data that should remain with the requirement.

`outputs/html/`
: HTML prototypes, demos, repro pages, or report pages.

`outputs/screenshots/`
: Reviewable screenshots, visual QA evidence, or before/after captures.

`outputs/reports/`
: Design QA notes, audit reports, test summaries, or exported analysis.

`outputs/logs/`
: Selected logs worth preserving. Temporary logs are ignored by default.

`scratch/`
: Disposable exploration. Do not rely on scratch content for long-term memory.

## Naming

Use `YYYYMMDD-slug`, for example:

```txt
20260705-quick-capture-flow
```

If the title is Chinese and no English slug is obvious, use `requirement` or ask the user for a short slug only if the ambiguity matters.
