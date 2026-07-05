param(
  [Parameter(Mandatory = $true)]
  [string]$Title,
  [string]$ProjectRoot = (Get-Location).Path,
  [string]$Slug = "",
  [string]$Date = (Get-Date -Format "yyyyMMdd")
)

$ErrorActionPreference = "Stop"

function Convert-ToSlug {
  param([string]$Value)

  $lower = $Value.ToLowerInvariant()
  $slug = [regex]::Replace($lower, "[^a-z0-9]+", "-").Trim("-")
  if ([string]::IsNullOrWhiteSpace($slug)) {
    $slug = "requirement"
  }
  return $slug
}

function Copy-TemplateFile {
  param(
    [string]$Source,
    [string]$Destination,
    [hashtable]$Tokens
  )

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

$projectRootFull = [System.IO.Path]::GetFullPath($ProjectRoot)
if (-not (Test-Path -LiteralPath $projectRootFull)) {
  throw "Project root does not exist: $projectRootFull"
}

if ([string]::IsNullOrWhiteSpace($Slug)) {
  $Slug = Convert-ToSlug -Value $Title
}
else {
  $Slug = Convert-ToSlug -Value $Slug
}

$baseName = "$Date-$Slug"
$requirementsRoot = Join-Path $projectRootFull ".claude\requirements"
New-Item -ItemType Directory -Path $requirementsRoot -Force | Out-Null

$target = Join-Path $requirementsRoot $baseName
$counter = 2
while (Test-Path -LiteralPath $target) {
  $target = Join-Path $requirementsRoot "$baseName-$counter"
  $counter++
}

$skillRoot = Split-Path -Parent $PSScriptRoot
$template = Join-Path $skillRoot "templates\requirement"
$tokens = @{
  "TITLE" = $Title
  "SLUG" = (Split-Path -Leaf $target)
  "DATE" = $Date
}

Get-ChildItem -LiteralPath $template -Recurse -File -Force | ForEach-Object {
  $relative = $_.FullName.Substring($template.Length).TrimStart('\', '/')
  $destination = Join-Path $target $relative
  Copy-TemplateFile -Source $_.FullName -Destination $destination -Tokens $tokens
}

Write-Host "Created requirement package:"
Write-Host $target
