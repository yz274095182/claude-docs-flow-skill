# 问题记录

本文件记录真实问题、阻塞项和后置风险。

## 已知问题

### 2026-07-05：Windows PowerShell 5 会误读无 BOM UTF-8 脚本内容

状态：resolved

现象：曾经把中文字符串直接放入 `.ps1` 后，`scripts/validate.ps1` 出现解析失败。

原因：Windows PowerShell 5 可能用旧代码页读取无 BOM UTF-8 脚本，导致非 ASCII 字节在解析前损坏。

处理：PowerShell 脚本源码保持 ASCII-only。中文放在 Markdown 模板中，或作为运行时参数传入，再用 `-Encoding UTF8` 写入文件。
