<#
.SYNOPSIS
Gets CSP license information.

.DESCRIPTION
The Get-CIPPCSPLicenses function retrieves Cloud Solution Provider (CSP) license information from CIPP.

.PARAMETER CustomerTenantID
Specifies the ID of the customer tenant where the operation will be performed. This parameter is mandatory for proper data isolation and multi-tenancy compliance.

.EXAMPLE
Get-CIPPCSPLicenses -CustomerTenantID "12345678-1234-1234-1234-1234567890AB"
Retrieves CSP license information for the specified tenant.

.NOTES
Requires appropriate permissions to view CSP license information.
#>

function Get-CIPPCSPLicenses {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID
    )

    Write-Verbose "Getting CSP license information for tenant $CustomerTenantID"

    $endpoint = '/api/ListCSPLicenses'
    $params = @{
        tenantFilter = $CustomerTenantID
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params -Method GET
}