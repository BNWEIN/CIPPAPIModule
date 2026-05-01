$repoRoot = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
$builtModulePath = Join-Path $repoRoot 'Output\CIPPAPIModule\CIPPAPIModule.psm1'

. (Join-Path $repoRoot 'Tools\Get-HelpByMarkDown.ps1')

. (Join-Path $repoRoot 'Tools\Generate-HelpDocs.ps1')

. (Join-Path $repoRoot 'Tools\New-MarkdownHelpPathTree.ps1')

. (Join-Path $repoRoot 'Tools\Update-ModuleVersion.ps1')

Push-Location $repoRoot
try {
    Update-ModuleVersion

    if (-not (Get-Command -Name 'Build-Module' -ErrorAction SilentlyContinue)) {
        if (-not (Get-Module -Name 'ModuleBuilder' -ListAvailable)) {
            Install-Module -Name 'ModuleBuilder' -Scope CurrentUser -Force -ErrorAction Stop
        }
        Import-Module ModuleBuilder -ErrorAction Stop
    }

    Build-Module

    Start-Sleep -Seconds 2

    if (-not (Test-Path $builtModulePath)) {
        throw "Built module not found at '$builtModulePath'. Build-Module may have failed."
    }

    Import-Module $builtModulePath -Force -ErrorAction Stop

    Export-HelpDocs

    New-MarkdownHelpPathTree
}
finally {
    Pop-Location
}