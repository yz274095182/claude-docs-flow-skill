# CLAUDE.md

This repository maintains the `project-docs-flow` Claude Code skill.

## Project Shape

- Skill source: `.claude/skills/project-docs-flow/`
- Root install script: `scripts/install.ps1`
- Project docs: `docs/`
- Example requirement package: `examples/.claude/requirements/20260705-quick-capture-flow/`

## Working Rules

- Preserve the Claude skill structure. The installable skill folder is `.claude/skills/project-docs-flow`.
- Keep `SKILL.md` concise and move detailed workflow rules into `references/`.
- Use UTF-8 for Chinese Markdown.
- Do not put secrets, personal Claude local settings, or machine-specific paths into templates.
- Do not ignore `.claude/skills` in this repository; this repo intentionally tracks the skill source.

## Validation

After edits, run:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\validate.ps1
```

For install verification without touching the real home directory:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\install.ps1 -DestinationRoot "$env:TEMP\claude-skills-test"
```

## Development Log

Before substantial changes, read:

- `docs/project-spec.md`
- `docs/dev-log/CURRENT.md`
- `docs/dev-log/DECISIONS.md`
- `docs/dev-log/ISSUES.md`

At the end of substantial changes, update `docs/dev-log/` with the current state, decisions, and issues.
