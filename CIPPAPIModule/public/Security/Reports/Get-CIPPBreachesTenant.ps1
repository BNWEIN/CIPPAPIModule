<#
.SYNOPSIS
Gets tenant-wide breach information.

.DESCRIPTION
The Get-CIPPBreachesTenant function retrieves information about potential security breaches across the entire tenant in CIPP.

.PARAMETER CustomerTenantID
Specifies the ID of the customer tenant where the operation will be performed. This parameter is mandatory for proper data isolation and multi-tenancy compliance.

.EXAMPLE
Get-CIPPBreachesTenant -CustomerTenantID "12345678-1234-1234-1234-1234567890AB"
Retrieves breach information for all accounts in the specified tenant.

.NOTES
Requires appropriate permissions to view security breach information.
#>

function Get-CIPPBreachesTenant {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID
    )

    Write-Verbose "Getting tenant-wide breach information for tenant $CustomerTenantID"

    $endpoint = '/api/ListBreachesTenant'
    $params = @{
        tenantFilter = $CustomerTenantID
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params -Method GET
}