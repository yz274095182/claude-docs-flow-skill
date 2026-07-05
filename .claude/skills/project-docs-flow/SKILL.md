---
name: project-docs-flow
description: Initialize and maintain a docs-first Claude Code project workflow. Use when the user wants Claude Code project rules, CLAUDE.md memory, docs/dev-log files, per-requirement folders under .claude/requirements, requirement/spec/backend/frontend design docs, resource and output directories, HTML demos, screenshots, validation records, or a reusable project documentation flow.
---

# Project Docs Flow

Use this skill to make a project self-orienting and to keep each requirement's docs, resources, demos, screenshots, and validation evidence together.

## Command Intent

Interpret the user's request after `/project-docs-flow`:

- `init`: install project rules, dev-log files, and the requirement template into the current project.
- `new <title>`: create a new requirement package under `.claude/requirements/<YYYYMMDD-slug>/`.
- `continue <slug>`: read the project docs and that requirement package before doing more work.
- `close <slug>`: update validation, handoff, and project dev-log entries before finishing.

If the command is unclear, infer the closest workflow from the user's words and explain the assumption.

## Read First

Before implementation or design work in an initialized project, read:

1. `CLAUDE.md`
2. `docs/dev-log/CURRENT.md`
3. `docs/dev-log/DECISIONS.md`
4. `docs/dev-log/ISSUES.md`
5. The active requirement package files, especially `REQUEST.md`, `SPEC.md`, `TASKS.md`, `VALIDATION.md`, and `HANDOFF.md`

## Workflow

For `init`, run the bundled script:

```powershell
powershell -ExecutionPolicy Bypass -File <skill-root>\scripts\init-project.ps1 -ProjectRoot <project-root>
```

For `new <title>`, run:

```powershell
powershell -ExecutionPolicy Bypass -File <skill-root>\scripts\new-requirement.ps1 -ProjectRoot <project-root> -Title "<title>"
```

After creating the package, fill `REQUEST.md` from the user's raw request and sketch the initial `SPEC.md`/`TASKS.md` if enough information is available.

For `continue <slug>`, read the package first, then continue from `TASKS.md` and `HANDOFF.md`. Keep new evidence inside the same package.

For `close <slug>`, update:

- `<requirement>/VALIDATION.md` with checks run and checks not run.
- `<requirement>/HANDOFF.md` with what changed, remaining work, and next command.
- `docs/dev-log/CURRENT.md` with project-level status.
- `docs/dev-log/DECISIONS.md` only for durable decisions.
- `docs/dev-log/ISSUES.md` only for real problems or deferred risks.

## Requirement Package Rules

Read `references/requirement-package.md` when creating or reorganizing requirement folders.

Use this default package shape:

```txt
.claude/requirements/<YYYYMMDD-slug>/
  REQUEST.md
  SPEC.md
  BACKEND_DESIGN.md
  FRONTEND_DESIGN.md
  TASKS.md
  VALIDATION.md
  HANDOFF.md
  assets/source/
  assets/generated/
  outputs/html/
  outputs/screenshots/
  outputs/reports/
  outputs/logs/
  scratch/
```

## Artifact Policy

Read `references/artifact-policy.md` before deciding whether to keep generated assets. Track selected demos, screenshots, QA reports, and source assets that help review or reproduce the requirement. Keep temporary exploration in `scratch/`.

## Project Memory Rules

Read `references/docs-system-pattern.md` when initializing or repairing project docs. Read `references/docs-flow-lessons.md` when the user asks why this workflow exists or wants the rationale behind the pattern.

Use durable files as the source of truth. Do not rely on chat history as the only record of requirements, decisions, issues, or validation.
