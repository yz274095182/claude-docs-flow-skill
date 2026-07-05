# Docs System Pattern

初始化新项目，或修复上下文散落在聊天历史里的项目时使用本文件。

## 文件分工

`CLAUDE.md`
: Claude Code 项目记忆。写入项目背景、仓库结构、事实来源顺序、边界、常用命令和验证要求。

`docs/dev-log/CURRENT.md`
: 当前阶段、最近完成、验证结果、阻塞项和下一步。每次有意义的工作后更新。

`docs/dev-log/DECISIONS.md`
: ADR-lite 决策记录。只记录长期有效的产品、架构、provider、部署、数据或工具决策。只追加，不重写历史。

`docs/dev-log/ISSUES.md`
: 真实 bug、阻塞项、后置风险和已解决经验。记录现象、原因、处理方式和关联文件。

`.claude/rules/docs-flow.md`
: 本 skill 安装的本地规则文件。它提醒 Claude 读取 dev-log，并把需求证据放在一起，同时不覆盖项目主 `CLAUDE.md` 的职责。

`.claude/requirements/`
: 单需求包目录。包含需求、规格、设计文档、实现任务、验证、handoff、源资源、生成资源、demo、截图、报告、日志和 scratch 文件。

## 初始化步骤

1. 运行 init 工作流。
2. 用项目真实技术栈和命令补齐 `CLAUDE.md` 占位内容。
3. dev-log 保持事实化、带日期。
4. 每个有意义的用户请求或功能创建一个需求包。
5. 任务收尾时，按需更新当前需求包和项目级 dev-log。

## 写作规则

- 文档保持简洁、事实化。
- 原始用户意图保存在 `REQUEST.md`。
- `SPEC.md` 表达当前可执行范围。
- 长期决策写进 `DECISIONS.md`，不要只放在 `CURRENT.md`。
- 真实问题写进 `ISSUES.md`，不要写成模糊提醒。
- 中文 Markdown 使用 UTF-8 读写。
