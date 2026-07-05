---
name: project-docs-flow
description: 初始化并维护 docs-first Claude Code 项目工作流。Use when the user wants Claude Code project rules, CLAUDE.md memory, docs/dev-log files, per-requirement folders under .claude/requirements, requirement/spec/backend/frontend design docs, resource and output directories, HTML demos, screenshots, validation records, or a reusable project documentation flow.
---

# Project Docs Flow

使用这个 skill 让项目具备稳定的文档化上下文，并把每个需求的文档、资源、demo、截图和验证证据收束在同一个需求包里。

## 命令意图

解析 `/project-docs-flow` 后面的用户意图：

- `init`：在当前项目中安装项目规则、dev-log 文件和需求包模板。
- `new <title>`：在 `.claude/requirements/<YYYYMMDD-slug>/` 下创建一个新需求包。
- `continue <slug>`：先读取项目文档和对应需求包，再继续工作。
- `close <slug>`：收尾前更新验证记录、handoff 和项目 dev-log。

如果命令不清晰，根据用户文字推断最接近的工作流，并说明你的假设。

## 优先读取

在已初始化项目里做实现或设计前，先读取：

1. `CLAUDE.md`
2. `docs/dev-log/CURRENT.md`
3. `docs/dev-log/DECISIONS.md`
4. `docs/dev-log/ISSUES.md`
5. 当前需求包文件，尤其是 `REQUEST.md`、`SPEC.md`、`TASKS.md`、`VALIDATION.md` 和 `HANDOFF.md`

## 工作流

执行 `init` 时，运行内置脚本：

```powershell
powershell -ExecutionPolicy Bypass -File <skill-root>\scripts\init-project.ps1 -ProjectRoot <project-root>
```

执行 `new <title>` 时，运行：

```powershell
powershell -ExecutionPolicy Bypass -File <skill-root>\scripts\new-requirement.ps1 -ProjectRoot <project-root> -Title "<title>"
```

创建需求包后，把用户原始请求写入 `REQUEST.md`。如果信息足够，再补一版初始 `SPEC.md` 和 `TASKS.md`。

执行 `continue <slug>` 时，先读对应需求包，再从 `TASKS.md` 和 `HANDOFF.md` 继续。新证据继续放在同一个需求包内。

执行 `close <slug>` 时，更新：

- `<requirement>/VALIDATION.md`：记录已运行和未运行的检查。
- `<requirement>/HANDOFF.md`：记录变更、剩余事项和下一步建议。
- `docs/dev-log/CURRENT.md`：记录项目级当前状态。
- `docs/dev-log/DECISIONS.md`：只记录长期有效决策。
- `docs/dev-log/ISSUES.md`：只记录真实问题或后置风险。

## 需求包规则

创建或整理需求包时，读取 `references/requirement-package.md`。

默认需求包结构：

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

## 产物策略

决定是否保留生成产物前，读取 `references/artifact-policy.md`。保留有助于审查或复现需求的精选 demo、截图、QA 报告和源资源。临时探索放进 `scratch/`。

## 项目记忆规则

初始化或修复项目 docs 时，读取 `references/docs-system-pattern.md`。当用户询问这个工作流为什么存在，或需要理解背后的设计理由时，读取 `references/docs-flow-lessons.md`。

以稳定文件作为事实来源。不要把聊天历史当作需求、决策、问题或验证记录的唯一来源。
