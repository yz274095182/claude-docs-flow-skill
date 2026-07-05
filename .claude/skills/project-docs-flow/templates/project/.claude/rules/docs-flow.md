# Docs Flow Rules

每个有意义的需求都使用 `.claude/requirements/<YYYYMMDD-slug>/` 作为管理目录。

开始处理需求前，先读取：

- `REQUEST.md`
- `SPEC.md`
- `TASKS.md`
- `VALIDATION.md`
- `HANDOFF.md`

相关后端设计、前端设计、资源、HTML demo、截图、报告、日志和 scratch 工作都放在同一个需求包里。

需求任务收尾前，更新 `VALIDATION.md` 和 `HANDOFF.md`。同时更新 `docs/dev-log/CURRENT.md`；只有出现项目级长期决策或真实问题时，才追加 `DECISIONS.md` 或 `ISSUES.md`。
