# 需求包规范

每个有意义的功能需求都应该在下面创建一个需求包：

```txt
.claude/requirements/<YYYYMMDD-slug>/
```

## 文件分工

`REQUEST.md`
: 原始用户请求、重要对话摘录、硬约束，以及关联 issue 或历史需求链接。

`SPEC.md`
: 当前可执行需求。这是实现时最主要的契约。

`BACKEND_DESIGN.md`
: API、数据模型、服务、集成、安全、迁移和后端验证说明。

`FRONTEND_DESIGN.md`
: UI 流程、状态、组件、交互、可访问性、响应式行为和视觉 QA 说明。

`TASKS.md`
: 有序实现清单。必要时记录负责人和状态。

`VALIDATION.md`
: 已运行命令、浏览器/手工检查、已审查截图、已知缺口，以及未运行项目的原因。

`HANDOFF.md`
: 最终状态、变更文件摘要、未完成工作、下一步建议命令和后续会话上下文。

## 目录分工

`assets/source/`
: 用户提供的参考、源图片、样例数据、设计输入或 API 示例。

`assets/generated/`
: 生成图片、转换后的资源、fixtures 或需要随需求保留的样例数据。

`outputs/html/`
: HTML 原型、demo、复现页面或报告页面。

`outputs/screenshots/`
: 可审查截图、视觉 QA 证据或前后对比截图。

`outputs/reports/`
: 设计 QA 记录、审计报告、测试摘要或导出的分析结果。

`outputs/logs/`
: 值得保留的精选日志。临时日志默认忽略。

`scratch/`
: 一次性探索。不要把 scratch 内容作为长期记忆。

## 命名

使用 `YYYYMMDD-slug`，例如：

```txt
20260705-quick-capture-flow
```

如果标题是中文且没有明显英文 slug，可以使用 `requirement`；只有当 slug 会影响辨识时，才向用户确认一个短 slug。
