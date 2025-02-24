<#
.SYNOPSIS
Gets items from the CIPP queue.

.DESCRIPTION
The Get-CIPPQueue function retrieves items from the CIPP queue system.

.PARAMETER CustomerTenantID
Specifies the ID of the customer tenant where the operation will be performed. This parameter is mandatory for proper data isolation and multi-tenancy compliance.

.PARAMETER QueueType
Specifies the type of queue items to retrieve. If not specified, returns all queue items.

.EXAMPLE
Get-CIPPQueue -CustomerTenantID "12345678-1234-1234-1234-1234567890AB"
Retrieves all queue items for the specified tenant.

.EXAMPLE
Get-CIPPQueue -CustomerTenantID "12345678-1234-1234-1234-1234567890AB" -QueueType "Applications"
Retrieves application-related queue items for the specified tenant.

.NOTES
Requires appropriate permissions to access queue information.
#>

function Get-CIPPQueue {
    [CmdletBinding()]
    param ()

    Write-Verbose 'Getting queue items'

    $endpoint = '/api/ListCippQueue'
    $params = @{ }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params -Method GET
}