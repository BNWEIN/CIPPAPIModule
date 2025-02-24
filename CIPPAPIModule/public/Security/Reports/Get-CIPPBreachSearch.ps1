<#
.SYNOPSIS
Searches for security breaches.

.DESCRIPTION
The Get-CIPPBreachSearch function executes a search for security breaches in the CIPP system.

.PARAMETER CustomerTenantID
Specifies the ID of the customer tenant where the operation will be performed. This parameter is mandatory for proper data isolation and multi-tenancy compliance.

.EXAMPLE
Get-CIPPBreachSearch -CustomerTenantID "12345678-1234-1234-1234-1234567890AB"
Gets all breach information for the specified tenant.

.NOTES
Requires appropriate permissions to access security breach information.
#>

function Get-CIPPBreachSearch {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID
    )

    Write-Verbose "Getting breach information for tenant $CustomerTenantID"

    $endpoint = '/api/ExecBreachSearch'
    $params = @{
        tenantFilter = $CustomerTenantID
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params -Method GET
}