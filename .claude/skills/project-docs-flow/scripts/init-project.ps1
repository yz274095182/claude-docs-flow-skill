param(
  [string]$ProjectRoot = (Get-Location).Path,
  [string]$ProjectName = "",
  [switch]$Force
)

$ErrorActionPreference = "Stop"

function Copy-TemplateFile {
  param(
    [string]$Source,
    [string]$Destination,
    [hashtable]$Tokens,
    [switch]$Overwrite
  )

  if ((Test-Path -LiteralPath $Destination) -and -not $Overwrite) {
    return
  }

  $parent = Split-Path -Parent $Destination
  if ($parent) {
    New-Item -ItemType Directory -Path $parent -Force | Out-Null
  }

  $content = Get-Content -LiteralPath $Source -Encoding UTF8 -Raw
  foreach ($key in $Tokens.Keys) {
    $content = $content.Replace("{{$key}}", [string]$Tokens[$key])
  }
  Set-Content -LiteralPath $Destination -Value $content -Encoding UTF8 -NoNewline
}

function Copy-DirectoryTemplate {
  param(
    [string]$SourceRoot,
    [string]$DestinationRoot,
    [hashtable]$Tokens,
    [switch]$Overwrite
  )

  Get-ChildItem -LiteralPath $SourceRoot -Recurse -File -Force | ForEach-Object {
    $relative = $_.FullName.Substring($SourceRoot.Length).TrimStart('\', '/')
    $target = Join-Path $DestinationRoot $relative
    Copy-TemplateFile -Source $_.FullName -Destination $target -Tokens $Tokens -Overwrite:$Overwrite
  }
}

function Add-ManagedBlock {
  param(
    [string]$Path,
    [string]$Block
  )

  $start = "# BEGIN project-docs-flow"
  $end = "# END project-docs-flow"
  $existing = ""
  if (Test-Path -LiteralPath $Path) {
    $existing = Get-Content -LiteralPath $Path -Encoding UTF8 -Raw
  }

  if ($existing.Contains($start)) {
    return
  }

  $separator = ""
  if ($existing.Trim().Length -gt 0) {
    $separator = "`r`n`r`n"
  }
  Set-Content -LiteralPath $Path -Value ($existing.TrimEnd() + $separator + $Block.Trim() + "`r`n") -Encoding UTF8 -NoNewline
}

$projectRootFull = [System.IO.Path]::GetFullPath($ProjectRoot)
if (-not (Test-Path -LiteralPath $projectRootFull)) {
  New-Item -ItemType Directory -Path $projectRootFull -Force | Out-Null
}

if ([string]::IsNullOrWhiteSpace($ProjectName)) {
  $ProjectName = Split-Path -Leaf $projectRootFull
}

$skillRoot = Split-Path -Parent $PSScriptRoot
$projectTemplate = Join-Path $skillRoot "templates\project"
$requirementTemplate = Join-Path $skillRoot "templates\requirement"

$tokens = @{
  "PROJECT_NAME" = $ProjectName
  "DATE" = (Get-Date -Format "yyyy-MM-dd")
}

Copy-DirectoryTemplate -SourceRoot $projectTemplate -DestinationRoot $projectRootFull -Tokens $tokens -Overwrite:$Force

$templateTarget = Join-Path $projectRootFull ".claude\requirements\_template"
Copy-DirectoryTemplate -SourceRoot $requirementTemplate -DestinationRoot $templateTarget -Tokens @{
  "TITLE" = "Requirement Title"
  "SLUG" = "_template"
  "DATE" = (Get-Date -Format "yyyyMMdd")
} -Overwrite:$Force

$gitignorePath = Join-Path $projectRootFull ".gitignore"
$gitignoreBlock = @"
# BEGIN project-docs-flow
.claude/settings.local.json
.claude/settings.local.json.bak
.claude/.cache/
.claude/logs/
.claude/requirements/*/scratch/**
!.claude/requirements/_template/scratch/.gitkeep
.claude/requirements/*/outputs/logs/*.log
.claude/requirements/*/outputs/logs/*.tmp
# END project-docs-flow
"@
Add-ManagedBlock -Path $gitignorePath -Block $gitignoreBlock

Write-Host "Initialized project docs flow at:"
Write-Host $projectRootFull
Write-Host ""
Write-Host "Requirement template:"
Write-Host $templateTarget
