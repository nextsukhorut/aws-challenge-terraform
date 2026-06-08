Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$repoRoot = Split-Path -Parent $PSScriptRoot
$root = $repoRoot
$requiredFiles = @(
    "versions.tf",
    "main.tf",
    "variables.tf",
    "terraform.tfvars",
    "outputs.tf",
    "modules\network\main.tf",
    "modules\network\variables.tf",
    "modules\network\outputs.tf",
    "modules\network_security\main.tf",
    "modules\network_security\variables.tf",
    "modules\network_security\outputs.tf",
    "modules\application\main.tf",
    "modules\application\variables.tf",
    "modules\application\outputs.tf",
    "modules\application\user_data.sh"
)

Write-Host "Checking required files..."
foreach ($file in $requiredFiles) {
    $path = Join-Path $root $file
    if (!(Test-Path -LiteralPath $path)) {
        throw "Missing required file: $file"
    }
    Write-Host "OK $file"
}

$terraform = Join-Path (Split-Path -Parent $repoRoot) ".tools\terraform-1.5.7\terraform.exe"
if (!(Test-Path -LiteralPath $terraform)) {
    throw "Terraform executable not found: $terraform"
}

Push-Location $root
try {
    & $terraform fmt -check -recursive
    if ($LASTEXITCODE -ne 0) {
        exit $LASTEXITCODE
    }

    & $terraform validate
    if ($LASTEXITCODE -ne 0) {
        exit $LASTEXITCODE
    }
}
finally {
    Pop-Location
}

Write-Host "Terraform files are ready."
