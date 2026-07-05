param(
  [string]$ProjectRoot = (Split-Path -Parent $PSScriptRoot)
)

$ErrorActionPreference = "Stop"

$root = [System.IO.Path]::GetFullPath($ProjectRoot)
$skill = Join-Path $root ".claude\skills\project-docs-flow"
$skillMd = Join-Path $skill "SKILL.md"

$requiredFiles = @(
  "README.md",
  "CLAUDE.md",
  ".gitignore",
  ".claude\skills\project-docs-flow\SKILL.md",
  ".claude\skills\project-docs-flow\references\docs-flow-lessons.md",
  ".claude\skills\project-docs-flow\references\requirement-package.md",
  ".claude\skills\project-docs-flow\references\artifact-policy.md",
  ".claude\skills\project-docs-flow\scripts\init-project.ps1",
  ".claude\skills\project-docs-flow\scripts\new-requirement.ps1",
  ".claude\skills\project-docs-flow\templates\project\CLAUDE.md",
  ".claude\skills\project-docs-flow\templates\requirement\REQUEST.md"
)

foreach ($relative in $requiredFiles) {
  $path = Join-Path $root $relative
  if (-not (Test-Path -LiteralPath $path)) {
    throw "Missing required file: $relative"
  }
}

$skillText = Get-Content -LiteralPath $skillMd -Encoding UTF8 -Raw
if ($skillText -notmatch "(?ms)^---\s+name:\s*project-docs-flow\s+description:\s*.+?---") {
  throw "SKILL.md frontmatter must include name and description."
}

$tempRoot = Join-Path ([System.IO.Path]::GetTempPath()) ("project-docs-flow-validate-" + [guid]::NewGuid().ToString("N"))
$tempSkills = Join-Path $tempRoot "skills"
$tempProject = Join-Path $tempRoot "sample-project"
New-Item -ItemType Directory -Path $tempSkills, $tempProject -Force | Out-Null

try {
  & (Join-Path $root "scripts\install.ps1") -DestinationRoot $tempSkills | Out-Host

  $installedSkill = Join-Path $tempSkills "project-docs-flow"
  if (-not (Test-Path -LiteralPath (Join-Path $installedSkill "SKILL.md"))) {
    throw "Temporary install did not produce SKILL.md."
  }

  & (Join-Path $skill "scripts\init-project.ps1") -ProjectRoot $tempProject -ProjectName "Sample Project" | Out-Host
  & (Join-Path $skill "scripts\new-requirement.ps1") -ProjectRoot $tempProject -Title "Test Requirement" -Slug "test-requirement" -Date "20260705" | Out-Host

  $expectedRequirement = Join-Path $tempProject ".claude\requirements\20260705-test-requirement\REQUEST.md"
  if (-not (Test-Path -LiteralPath $expectedRequirement)) {
    throw "New requirement workflow did not create REQUEST.md."
  }
}
finally {
  if (Test-Path -LiteralPath $tempRoot) {
    Remove-Item -LiteralPath $tempRoot -Recurse -Force
  }
}

Write-Host "Validation passed."
