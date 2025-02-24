<#
.SYNOPSIS
Gets CSP SKU information.

.DESCRIPTION
The Get-CIPPCSPSku function retrieves Cloud Solution Provider (CSP) SKU information from CIPP.

.PARAMETER CustomerTenantID
Specifies the ID of the customer tenant where the operation will be performed. This parameter is mandatory for proper data isolation and multi-tenancy compliance.

.EXAMPLE
Get-CIPPCSPSku -CustomerTenantID "12345678-1234-1234-1234-1234567890AB"
Retrieves CSP SKU information for the specified tenant.

.NOTES
Requires appropriate permissions to view CSP SKU information.
#>

function Get-CIPPCSPSku {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID
    )

    Write-Verbose "Getting CSP SKU information for tenant $CustomerTenantID"

    $endpoint = '/api/ListCSPsku'
    $params = @{
        tenantFilter = $CustomerTenantID
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params -Method GET
}