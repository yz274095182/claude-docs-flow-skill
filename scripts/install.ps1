param(
  [string]$DestinationRoot = (Join-Path $HOME ".claude\skills"),
  [switch]$Force
)

$ErrorActionPreference = "Stop"

$repoRoot = Split-Path -Parent $PSScriptRoot
$source = Join-Path $repoRoot ".claude\skills\project-docs-flow"
$destinationRootFull = [System.IO.Path]::GetFullPath($DestinationRoot)
$destination = Join-Path $destinationRootFull "project-docs-flow"
$destinationFull = [System.IO.Path]::GetFullPath($destination)

if (-not (Test-Path -LiteralPath $source)) {
  throw "Skill source not found: $source"
}

if (-not $destinationFull.StartsWith($destinationRootFull, [System.StringComparison]::OrdinalIgnoreCase)) {
  throw "Refusing to install outside destination root: $destinationFull"
}

New-Item -ItemType Directory -Path $destinationRootFull -Force | Out-Null

if (Test-Path -LiteralPath $destinationFull) {
  if (-not $Force) {
    Write-Host "Replacing existing skill at $destinationFull"
  }
  Remove-Item -LiteralPath $destinationFull -Recurse -Force
}

Copy-Item -LiteralPath $source -Destination $destinationFull -Recurse -Force

Write-Host "Installed project-docs-flow skill to:"
Write-Host $destinationFull
Write-Host ""
Write-Host "Use in Claude Code:"
Write-Host "/project-docs-flow init"
Write-Host "/project-docs-flow new `"Your requirement title`""
