param(
    [Parameter(Mandatory = $true)]
    [ValidateSet("init", "fmt", "validate", "plan", "apply", "destroy")]
    [string] $Command
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$root = Split-Path -Parent $PSScriptRoot
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

    switch ($Command) {
        "init" {
            & $terraform init
        }
        "fmt" {
            & $terraform fmt -recursive
        }
        "validate" {
            & $terraform validate
        }
        "plan" {
            & $terraform plan -out challenge.tfplan
        }
        "apply" {
            & $terraform apply challenge.tfplan
        }
        "destroy" {
            & $terraform destroy -auto-approve
        }
    }
}
finally {
    Pop-Location
}
