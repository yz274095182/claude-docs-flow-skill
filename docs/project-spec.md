# Claude Docs Flow Skill Spec

## Goal

Create a reusable Claude Code skill that installs a docs-first project operating system and manages each feature request as a self-contained requirement package.

## User

The primary user is a developer using Claude Code across personal coding projects. They want future Claude sessions to recover project state from files instead of chat history, and they want requirements, design notes, demos, screenshots, and validation evidence grouped by feature.

## MVP Scope

Must have:

- Installable skill at `.claude/skills/project-docs-flow`.
- Project init workflow that creates `CLAUDE.md`, `docs/dev-log/*`, `.claude/rules/docs-flow.md`, `.claude/requirements/_template/`, and `.gitignore` rules.
- New requirement workflow that creates `.claude/requirements/<YYYYMMDD-slug>/` with docs, assets, outputs, and scratch folders.
- Selective artifact policy for reviewable outputs versus temporary files.
- GitHub-friendly root README and validation script.

Not now:

- No package manager or compiled CLI.
- No external services.
- No automatic GitHub repository creation.
- No migration of private project files.

## Technical Shape

- Claude Code skill: Markdown `SKILL.md` plus references, scripts, and templates.
- Automation: PowerShell scripts for Windows-first use, with plain file operations and no secrets.
- Distribution: source repo plus install script that copies the skill to `$HOME\.claude\skills`.

## Validation Plan

- Validate required files exist.
- Parse skill frontmatter for `name` and `description`.
- Run install script into a temporary destination.
- Run skill scripts in a temporary project to create project docs and a sample requirement.
- Inspect Git status and ensure no unrelated private project files were modified.
