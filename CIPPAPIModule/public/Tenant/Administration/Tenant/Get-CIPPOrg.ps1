<#
.SYNOPSIS
Retrieves information about a specific organization in the CIPP system.

.DESCRIPTION
The Get-CIPPOrg function retrieves information about a specific organization in the CIPP system based on the provided CustomerTenantID.

.PARAMETER CustomerTenantID
Specifies the unique identifier of the customer tenant.

.EXAMPLE
Get-CIPPOrg -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778"
This example retrieves information about the organization with the CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778".

.EXAMPLE
Get-CIPPOrg -CustomerTenantID "contoso.onmicrosoft.com"
This example retrieves information about the organization with the CustomerTenantID "contoso.onmicrosoft.com".

#>
function Get-CIPPOrg {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID
    )
    
    Write-Verbose "Getting org $CustomerTenantID"
    $endpoint = '/api/listorg'
    $params = @{
        tenantfilter = $CustomerTenantID
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}
