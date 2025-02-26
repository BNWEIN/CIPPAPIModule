<#
.SYNOPSIS
Retrieves custom roles for a specific customer.

.DESCRIPTION
The Get-CIPPCustomRole function retrieves custom roles for a specific customer identified by their tenant ID.

.EXAMPLE
Get-CIPPCustomRole
Retrieves the custom roles for the customer.

.NOTES
Requires appropriate permissions to access custom role information.
#>

function Get-CIPPCustomRole {
    [CmdletBinding()]
    Param()

    Write-Verbose 'Getting Custom Roles'
    $endpoint = '/api/ListCustomRole'
    $params = @{}
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}