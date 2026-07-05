# CLAUDE.md

This file provides Claude Code guidance for `{{PROJECT_NAME}}`.

## Project Background

Describe what this project is, who it is for, and the current stage.

## Source Of Truth

Before development tasks, read:

- `docs/dev-log/CURRENT.md`
- `docs/dev-log/DECISIONS.md`
- `docs/dev-log/ISSUES.md`

For requirement-specific work, also read the active package under:

```txt
.claude/requirements/<YYYYMMDD-slug>/
```

## Working Directories

- Project docs: `docs/`
- Development log: `docs/dev-log/`
- Requirement packages: `.claude/requirements/`
- Claude local rules: `.claude/rules/`

## Rules

- Prefer existing project patterns over new abstractions.
- Preserve user changes and do not revert unrelated work.
- Keep secrets out of tracked files, examples, logs, and screenshots.
- For Chinese Markdown, read and write UTF-8.
- Keep request-level resources, demos, screenshots, validation, and handoff notes inside the active requirement package.

## Validation

Run available project checks after implementation. Record what passed and what could not run in both the active requirement package and project dev-log when relevant.

## Development Log

At task end:

- Update `docs/dev-log/CURRENT.md` with current phase, recent work, verification, blockers, and next step.
- Append `docs/dev-log/DECISIONS.md` only for durable decisions.
- Add or update `docs/dev-log/ISSUES.md` only for real problems, blockers, or deferred risks.
