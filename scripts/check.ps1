Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$root = Split-Path -Parent $PSScriptRoot
$requiredFiles = @(
    "variables.tf",
    "ssh.tf",
    "ec2.tf"
)

Write-Host "Checking required files..."
foreach ($file in $requiredFiles) {
    $path = Join-Path $root $file
    if (!(Test-Path -LiteralPath $path)) {
        throw "Missing required file: $file"
    }
    Write-Host "OK $file"
}

$terraform = Join-Path (Split-Path -Parent $root) ".tools\terraform-1.5.7\terraform.exe"
if (!(Test-Path -LiteralPath $terraform)) {
    throw "Terraform executable not found: $terraform"
}

Push-Location $root
try {
    if (!$env:TF_VAR_ssh_key) {
        $publicKeyPath = Join-Path $root "keys\aws-challenge-ssh.pub"
        if (Test-Path -LiteralPath $publicKeyPath) {
            $env:TF_VAR_ssh_key = (Get-Content -Raw -LiteralPath $publicKeyPath).Trim()
        }
    }

    & $terraform fmt -check -recursive
    & $terraform validate
}
finally {
    Pop-Location
}

Write-Host "Terraform files are ready."
