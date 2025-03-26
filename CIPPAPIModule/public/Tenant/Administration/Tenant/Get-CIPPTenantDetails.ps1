<#
.SYNOPSIS
Retrieves the details of a specific CIPP tenant.

.DESCRIPTION
The Get-CIPPTenantDetails function retrieves the details of a specific CIPP (Customer Information Protection Platform) tenant using the provided CustomerTenantID.

.PARAMETER CustomerTenantID
The unique identifier of the CIPP tenant.

.EXAMPLE
Get-CIPPTenantDetails -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778"
Retrieves the details of the CIPP tenant with the ID "7ced1621-b8f7-4231-868c-bc6b1a2f1778".

.EXAMPLE
Get-CIPPTenantDetails -CustomerTenantID "contoso.onmicrosoft.com"
Retrieves the details of the CIPP tenant with the ID "contoso.onmicrosoft.com".

#>
function Get-CIPPTenantDetails {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID
    )
    
    Write-Verbose "Getting Tenant Details for $CustomerTenantID"
    $endpoint = '/api/ListTenantDetails'
    $params = @{
        tenantFilter = $CustomerTenantID
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}
