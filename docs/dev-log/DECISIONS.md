# 决策记录

本文件记录 skill 仓库的长期有效决策。

## 2026-07-05：个人全局 Claude Code skill + 源码仓库

背景：这个工作流需要能在 Claude Code 中复用，也需要能推送到 GitHub 备份和分发。

决定：可安装 skill 放在 `.claude/skills/project-docs-flow`，通过 `scripts/install.ps1` 复制到 `$HOME\.claude\skills\project-docs-flow`。

影响：本仓库有意跟踪 `.claude/skills`，但忽略个人 Claude 本地设置。

## 2026-07-05：需求包统一放在 `.claude/requirements`

背景：每个功能需求都应该把需求文档、设计文档、资源、demo、截图和验证证据放在一起。

决定：使用 `.claude/requirements/<YYYYMMDD-slug>/` 作为单个需求的管理目录。

影响：项目级长期记忆仍放在 `docs/dev-log/`；需求级证据跟随需求包。

## 2026-07-05：采用精选产物入库策略

背景：demo 和截图是有价值的审查证据，但原始 scratch 输出会让仓库快速膨胀。

决定：跟踪长期文档、精选 demo、精选截图和 QA 报告；忽略 `scratch/`、缓存、临时日志和个人本地设置。

影响：工作流能保留关键证据，但不会把每次实验都变成永久 Git 历史。

## 2026-07-05：默认中文，仅保留中英文

背景：初版文档主要是英文，实际使用者更希望中文作为默认入口，同时保留英文说明便于 GitHub 展示和分享。

决定：项目默认文档、skill 正文、references、模板和示例包使用中文；根 `README.md` 为中文，`README.en.md` 为英文。

影响：Claude Code 生成的新项目和新需求默认中文；英文只作为补充入口，不再扩展其他语言版本。
