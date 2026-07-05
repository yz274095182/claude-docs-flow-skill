# Claude Docs Flow Skill 规格

## 目标

创建一个可复用的 Claude Code skill，用来安装 docs-first 项目工作流，并把每个需求管理成独立的需求包。

## 用户

主要用户是在多个个人项目里使用 Claude Code 的开发者。他们希望后续 Claude 会话能从文件恢复项目状态，而不是依赖聊天历史；同时希望每个功能需求的需求文档、设计说明、demo、截图和验证证据都按需求归档。

## MVP 范围

必须包含：

- 可安装 skill：`.claude/skills/project-docs-flow`。
- 项目初始化工作流：创建 `CLAUDE.md`、`docs/dev-log/*`、`.claude/rules/docs-flow.md`、`.claude/requirements/_template/` 和 `.gitignore` 规则。
- 新需求工作流：创建 `.claude/requirements/<YYYYMMDD-slug>/`，包含文档、资源、输出和 scratch 目录。
- 精选产物入库策略，区分可审查输出和临时文件。
- GitHub 友好的默认中文 README、英文 README，以及验证脚本。

暂不包含：

- 不引入包管理器或编译型 CLI。
- 不接外部服务。
- 不自动创建 GitHub 仓库。
- 不迁移任何私有项目文件。

## 技术形态

- Claude Code skill：Markdown `SKILL.md` 加 references、scripts 和 templates。
- 自动化：Windows 优先的 PowerShell 脚本，使用普通文件操作，不接触 secret。
- 分发：源码仓库加安装脚本，将 skill 复制到 `$HOME\.claude\skills`。

## 验证计划

- 验证必需文件存在。
- 解析 skill frontmatter 中的 `name` 和 `description`。
- 将安装脚本跑到临时目录。
- 在临时项目中运行 skill 脚本，创建项目 docs 和示例需求。
- 检查 Git 状态，确认没有改动无关私有项目文件。
