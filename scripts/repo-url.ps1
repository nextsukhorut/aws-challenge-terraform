Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$root = Split-Path -Parent $PSScriptRoot
$tokenPath = Join-Path $root "Token.md"

if (!(Test-Path -LiteralPath $tokenPath)) {
    throw "Token.md not found."
}

$token = (Get-Content -Raw -LiteralPath $tokenPath).Trim()
if ([string]::IsNullOrWhiteSpace($token)) {
    throw "Token.md is empty."
}

Set-Clipboard -Value "https://nextsukhorut:$token@github.com/nextsukhorut/aws-challenge-terraform.git"
Write-Host "Repository URL with token copied to clipboard."
Write-Host "Branch: main"
Write-Host "Folder: ."
