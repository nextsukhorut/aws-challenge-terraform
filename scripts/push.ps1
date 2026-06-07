Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$root = Split-Path -Parent $PSScriptRoot
$tokenPath = Join-Path $root "Token.md"

if (!(Test-Path -LiteralPath $tokenPath)) {
    throw "Token.md not found. Save your GitHub PAT in Token.md locally, then rerun this script."
}

$token = (Get-Content -Raw -LiteralPath $tokenPath).Trim()
if ([string]::IsNullOrWhiteSpace($token)) {
    throw "Token.md is empty."
}

Push-Location $root
try {
    git status --short
    git add -A -- .
    $changes = git diff --cached --name-only
    if ($changes) {
        git commit -m "Update Terraform challenge files"
    }
    else {
        Write-Host "No staged changes to commit."
    }

    $basic = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes("nextsukhorut:$token"))
    git -c http.https://github.com/.extraheader="AUTHORIZATION: basic $basic" push -u origin main
}
finally {
    Pop-Location
}
