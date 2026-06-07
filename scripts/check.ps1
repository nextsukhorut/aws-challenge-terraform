Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$root = Split-Path -Parent $PSScriptRoot
$terraformDirs = @(
    "tf_code_1",
    "tf_code_2"
)

$requiredFiles = @(
    "versions.tf",
    "main.tf",
    "variables.tf",
    "terraform.tfvars"
)

Write-Host "Checking required files..."
foreach ($dir in $terraformDirs) {
    foreach ($file in $requiredFiles) {
        $path = Join-Path (Join-Path $root $dir) $file
        if (!(Test-Path -LiteralPath $path)) {
            throw "Missing required file: $dir/$file"
        }
        Write-Host "OK $dir/$file"
    }
}

$terraform = Join-Path (Split-Path -Parent $root) ".tools\terraform-1.5.7\terraform.exe"
if (!(Test-Path -LiteralPath $terraform)) {
    throw "Terraform executable not found: $terraform"
}

Push-Location $root
try {
    & $terraform fmt -check -recursive
    if ($LASTEXITCODE -ne 0) {
        exit $LASTEXITCODE
    }

    foreach ($dir in $terraformDirs) {
        Push-Location (Join-Path $root $dir)
        try {
            & $terraform validate
            if ($LASTEXITCODE -ne 0) {
                exit $LASTEXITCODE
            }
        }
        finally {
            Pop-Location
        }
    }
}
finally {
    Pop-Location
}

Write-Host "Terraform files are ready."
