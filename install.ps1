param([string]$SkillsPath)

$ErrorActionPreference = 'Stop'
if (-not $SkillsPath) {
    $codexBase = if ($env:CODEX_HOME) { $env:CODEX_HOME } else { Join-Path $env:USERPROFILE '.codex' }
    $SkillsPath = Join-Path $codexBase 'skills'
}
$source = $PSScriptRoot
$target = Join-Path ([IO.Path]::GetFullPath($SkillsPath)) 'strong-chancellor-community'
$entries = @('SKILL.md', 'README.md', 'INSTALL.md', 'CHANGELOG.md', 'LICENSE', 'NOTICE.md', 'install.ps1', 'install.sh', 'agents', 'references', 'tests')
foreach ($entry in $entries) {
    if (-not (Test-Path -LiteralPath (Join-Path $source $entry))) { throw "Package is incomplete: $entry" }
}
if (Test-Path -LiteralPath $target) {
    throw "Already installed: $target. No files changed. Back up and move the old folder outside the skills directory before upgrading."
}
New-Item -ItemType Directory -Path $target | Out-Null
foreach ($entry in $entries) {
    Copy-Item -LiteralPath (Join-Path $source $entry) -Destination $target -Recurse
}
Write-Output "Installed: $target"
Write-Output 'Open a new Codex session and invoke $strong-chancellor-community.'
