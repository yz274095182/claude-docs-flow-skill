# CLAUDE.md

本文件为 `{{PROJECT_NAME}}` 提供 Claude Code 工作指引。

## 项目背景

描述这个项目是什么、面向谁、当前处于什么阶段。

## 事实来源

开始开发任务前，先读取：

- `docs/dev-log/CURRENT.md`
- `docs/dev-log/DECISIONS.md`
- `docs/dev-log/ISSUES.md`

如果是具体需求，还要读取当前需求包：

```txt
.claude/requirements/<YYYYMMDD-slug>/
```

## 工作目录

- 项目文档：`docs/`
- 开发日志：`docs/dev-log/`
- 需求包：`.claude/requirements/`
- Claude 本地规则：`.claude/rules/`

## 规则

- 优先复用项目现有模式，不轻易引入新抽象。
- 保留用户改动，不回滚无关工作。
- 不要把 secret 写进 tracked 文件、示例、日志或截图。
- 中文 Markdown 使用 UTF-8 读写。
- 需求级资源、demo、截图、验证和 handoff 记录都放在当前需求包里。

## 验证

实现后运行项目内可用检查。把通过项和未运行项记录到当前需求包；必要时同步到项目 dev-log。

## 开发日志

任务收尾时：

- 更新 `docs/dev-log/CURRENT.md`，记录当前阶段、最近完成、验证结果、阻塞项和下一步。
- 只有出现长期有效决策时，才追加 `docs/dev-log/DECISIONS.md`。
- 只有遇到真实问题、阻塞项或后置风险时，才新增或更新 `docs/dev-log/ISSUES.md`。
