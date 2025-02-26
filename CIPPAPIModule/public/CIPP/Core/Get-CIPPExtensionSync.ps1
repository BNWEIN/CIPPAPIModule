<#
.SYNOPSIS
Retrieves extension sync information for a specific customer.

.DESCRIPTION
The Get-CIPPExtensionSync function retrieves extension sync information for a specific customer identified by their tenant ID.

.EXAMPLE
Get-CIPPExtensionSync
Retrieves the extension sync information for the customer.

.NOTES
Requires appropriate permissions to access extension sync information.
#>

function Get-CIPPExtensionSync {
    [CmdletBinding()]
    Param()

    Write-Verbose 'Getting Extension Sync'
    $endpoint = '/api/ListExtensionSync'
    $params = @{}
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}