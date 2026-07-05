# Docs System Pattern

Use this when initializing a new project or repairing a project whose context is scattered across chat history.

## Files And Jobs

`CLAUDE.md`
: Claude Code project memory. Include project background, repo layout, source-of-truth order, do-not-do boundaries, common commands, and validation expectations.

`docs/dev-log/CURRENT.md`
: Current phase, recently completed work, verification, blockers, and next step. Update after meaningful work.

`docs/dev-log/DECISIONS.md`
: ADR-lite records for long-lived product, architecture, provider, deployment, data, or tooling decisions. Append only.

`docs/dev-log/ISSUES.md`
: Real bugs, blockers, deferred risks, and resolved lessons with symptom, cause, handling, and related files.

`.claude/rules/docs-flow.md`
: Extra local rule file installed by this skill. It reminds Claude to read dev-log and keep requirement evidence together without overwriting the project's main `CLAUDE.md`.

`.claude/requirements/`
: Per-requirement packages containing request, spec, design docs, implementation tasks, validation, handoff, source assets, generated assets, demos, screenshots, reports, logs, and scratch files.

## Setup Steps

1. Run the init workflow.
2. Fill `CLAUDE.md` placeholders with the project's real stack and commands.
3. Keep dev-log files factual and dated.
4. Create one requirement package per meaningful user request or feature.
5. At task end, update both the active requirement package and project-level dev-log when appropriate.

## Writing Rules

- Keep docs concise and factual.
- Preserve raw user intent in `REQUEST.md`.
- Rewrite `SPEC.md` as the current executable scope.
- Put durable decisions in `DECISIONS.md`, not only in `CURRENT.md`.
- Put real problems in `ISSUES.md`, not vague warnings.
- For Chinese projects, read and write Markdown as UTF-8.
