$commands = get-command -module CIPPAPIModule
foreach ($command in $commands) {
    Get-HelpByMarkDown $command.name > ".\Docs\$($command.name).md"
}