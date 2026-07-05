# Docs Flow Lessons

Use this as a compact rationale for the docs-flow workflow. The key lesson is that durable project docs beat chat history as the source of truth.

## What Worked

- Keep raw user intent separate from the executable spec.
- Keep current status, long-lived decisions, and issues in separate files.
- Use a short project rule file to tell future AI sessions what to read first.
- Keep generated demos, screenshots, and QA notes near the requirement that produced them.
- Merge useful subagent or thread output back into project docs.

## What To Avoid

- Do not bury durable decisions in chat history.
- Do not leave design prototypes and screenshots in random folders with no requirement context.
- Do not put secrets in examples, dev logs, or templates.
- Do not make the skill carry full project history. Put history in project docs.

## Transferable Pattern

Use global or project-level Claude instructions for repeated workflow rules, `docs/dev-log/` for project memory, and `.claude/requirements/<date-slug>/` for feature-level evidence.
