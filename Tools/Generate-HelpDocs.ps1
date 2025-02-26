function Export-HelpDocs {
    param (
        [string]$ModuleName = 'CIPPAPIModule',
        [string]$OutputPath = '.\Docs'
    )

    $Commands = Get-Command -Module $ModuleName
    foreach ($command in $Commands) {
        Get-HelpByMarkDown $command.Name > "$OutputPath\$($command.Name).md"
    }

    Write-Host "Help documents exported to: $OutputPath"
}