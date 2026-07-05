# Issues

This file records real problems, blockers, and deferred risks.

## Known Issues

### 2026-07-05: Windows PowerShell 5 misread UTF-8 script content without BOM

Status: resolved

Symptom: `scripts/validate.ps1` initially failed to parse after a Chinese string was placed directly inside the `.ps1` file.

Cause: Windows PowerShell 5 can read UTF-8 no-BOM scripts through the legacy code page, corrupting non-ASCII bytes before parsing.

Handling: Keep PowerShell script source ASCII-only. Chinese remains in Markdown templates and can still be passed as runtime arguments and written with `-Encoding UTF8`.
