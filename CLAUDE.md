# CLAUDE.md

本仓库维护 `project-docs-flow` Claude Code skill。

## 项目结构

- Skill 源码：`.claude/skills/project-docs-flow/`
- 根安装脚本：`scripts/install.ps1`
- 项目文档：`docs/`
- 示例需求包：`examples/.claude/requirements/20260705-quick-capture-flow/`

## 工作规则

- 保持 Claude skill 结构稳定。可安装 skill 目录是 `.claude/skills/project-docs-flow`。
- `SKILL.md` 保持短入口，详细流程放进 `references/`。
- 中文 Markdown 必须使用 UTF-8。
- 不要把 secret、个人 Claude 本地设置或机器专属路径写进模板。
- 不要忽略本仓库的 `.claude/skills`；这个仓库就是要跟踪 skill 源码。
- 默认中文，英文只保留在必要的英文入口文档里，例如 `README.en.md`。

## 验证

修改后运行：

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\validate.ps1
```

如果只想验证安装流程、但不碰真实 home 目录：

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\install.ps1 -DestinationRoot "$env:TEMP\claude-skills-test"
```

## 开发日志

重要修改前先读：

- `docs/project-spec.md`
- `docs/dev-log/CURRENT.md`
- `docs/dev-log/DECISIONS.md`
- `docs/dev-log/ISSUES.md`

重要修改结束时，更新 `docs/dev-log/` 中的当前状态、长期决策和问题记录。
