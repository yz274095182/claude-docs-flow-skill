# Claude Docs Flow Skill

[English](./README.en.md)

`project-docs-flow` 是一个面向 Claude Code 的 docs-first 项目工作流 skill。它把项目长期记忆放进稳定文档，把每个需求的需求文档、设计文档、资源、HTML demo、截图和验证记录统一收束到 `.claude/requirements/<date-slug>/`。

这个仓库用于维护和备份 skill 源码，也方便后续推到 GitHub。实际使用时，skill 会安装到你的个人 Claude Code skill 目录。

## 安装

在本仓库根目录运行：

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\install.ps1
```

脚本会把 `.claude/skills/project-docs-flow` 复制到：

```txt
$HOME\.claude\skills\project-docs-flow
```

## 在项目中使用

进入目标项目后，在 Claude Code 里执行：

```txt
/project-docs-flow init
```

`init` 工作流会创建或更新：

- `CLAUDE.md`
- `docs/dev-log/CURRENT.md`
- `docs/dev-log/DECISIONS.md`
- `docs/dev-log/ISSUES.md`
- `.claude/rules/docs-flow.md`
- `.claude/requirements/_template/`
- `.gitignore` 中的 docs-flow 忽略规则

创建新需求时：

```txt
/project-docs-flow new "新增快速记录"
```

它会生成：

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

## 产物策略

默认采用“精选入库”：

- 入库：需求文档、设计说明、可审查 HTML demo、关键截图和 QA 报告。
- 忽略：`scratch/`、临时日志、缓存、个人 Claude 设置和一次性大文件。
- 临时探索统一放进 `scratch/`，方便删除或忽略。

## 官方参考

- [Claude Code skills](https://code.claude.com/docs/en/skills)
- [Claude Code memory](https://docs.anthropic.com/en/docs/claude-code/memory)

## 当前状态

第一版保持轻量：只有 skill 指令、参考文档、模板和 PowerShell 脚本。不引入包管理器、构建系统或后台服务。
