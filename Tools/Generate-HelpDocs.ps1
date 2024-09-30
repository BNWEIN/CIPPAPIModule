function Export-HelpDocs {
    param (
        [string]$ModuleName = 'CIPPAPIModule',
        [string]$OutputPath = '.\Docs'
    )

    $commands = Get-Command -Module $ModuleName
    foreach ($command in $commands) {
        Get-HelpByMarkDown $command.name > "$OutputPath\$($command.name).md"
    }
}