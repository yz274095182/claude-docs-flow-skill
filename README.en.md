# Claude Docs Flow Skill

[中文](./README.md)

`project-docs-flow` is a Claude Code skill for running a docs-first project workflow. It keeps project memory in durable files and keeps each feature request in a dedicated `.claude/requirements/<date-slug>/` package.

The repository is source-controlled so the skill can be backed up and pushed to GitHub. The installed runtime target is your personal Claude Code skill directory.

## Install

From this repository root:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\install.ps1
```

This copies `.claude/skills/project-docs-flow` to:

```txt
$HOME\.claude\skills\project-docs-flow
```

## Use In A Project

In the target project, ask Claude Code:

```txt
/project-docs-flow init
```

The init workflow creates or updates:

- `CLAUDE.md`
- `docs/dev-log/CURRENT.md`
- `docs/dev-log/DECISIONS.md`
- `docs/dev-log/ISSUES.md`
- `.claude/rules/docs-flow.md`
- `.claude/requirements/_template/`
- `.gitignore` docs-flow ignore rules

For a new requirement:

```txt
/project-docs-flow new "Add quick capture"
```

That creates:

```txt
.claude/requirements/<YYYYMMDD-slug>/
  REQUEST.md
  SPEC.md
  BACKEND_DESIGN.md
  FRONTEND_DESIGN.md
  TASKS.md
  VALIDATION.md
  HANDOFF.md
  assets/
    source/
    generated/
  outputs/
    html/
    screenshots/
    reports/
    logs/
  scratch/
```

## Artifact Policy

Use selective versioning:

- Track durable requirement docs, design notes, reviewable demos, key screenshots, and QA reports.
- Ignore scratch work, temporary logs, cache files, personal Claude settings, and large throwaway binaries.
- Put temporary exploration under `scratch/` so it is easy to delete or ignore.

## Official Claude Code References

- [Claude Code skills](https://code.claude.com/docs/en/skills)
- [Claude Code memory](https://docs.anthropic.com/en/docs/claude-code/memory)

## Repository Status

This first version is intentionally lightweight: skill instructions, reference docs, templates, and PowerShell scripts. It does not introduce a package manager, build system, or service runtime.
