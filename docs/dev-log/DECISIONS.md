# Decisions

This file records long-lived decisions for the skill repository.

## 2026-07-05: Personal global Claude Code skill plus source repo

Context: The workflow should be reusable in Claude Code and later uploadable to GitHub.

Decision: Keep the installable skill in `.claude/skills/project-docs-flow`, and use `scripts/install.ps1` to copy it to `$HOME\.claude\skills\project-docs-flow`.

Impact: The repository tracks `.claude/skills` intentionally, but ignores personal Claude local settings.

## 2026-07-05: Requirement packages live under `.claude/requirements`

Context: Each feature request should keep requirement docs, design docs, resources, demos, screenshots, and validation evidence together.

Decision: Use `.claude/requirements/<YYYYMMDD-slug>/` as the per-requirement home.

Impact: Project-level memory remains in `docs/dev-log/`; request-level evidence lives with the requirement package.

## 2026-07-05: Selective artifact versioning

Context: Demos and screenshots are useful review evidence, but raw scratch output can bloat repositories.

Decision: Track durable docs, selected demos, selected screenshots, and QA reports; ignore `scratch/`, cache, temporary logs, and personal local settings.

Impact: The workflow keeps evidence without turning every experiment into permanent repo history.
