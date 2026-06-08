Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$repoRoot = Split-Path -Parent $PSScriptRoot
$root = $repoRoot
$requiredFiles = @(
    "versions.tf",
    "main.tf",
    "data.tf",
    "locals.tf",
    "compute.tf",
    "load_balancer.tf",
    "variables.tf",
    "terraform.tfvars",
    "user_data.sh.tftpl"
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
