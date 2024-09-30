<#
.SYNOPSIS
Retrieves licenses for a specific customer tenant.

.DESCRIPTION
The Get-CIPPLicenses function retrieves licenses for a specific customer tenant by making a REST API call to the "/api/ListLicenses" endpoint.

.PARAMETER CustomerTenantID
The ID of the customer tenant for which licenses need to be retrieved.

.EXAMPLE
Get-CIPPLicenses -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778"
Retrieves licenses for the customer tenant with the ID "7ced1621-b8f7-4231-868c-bc6b1a2f1778".

.EXAMPLE
Get-CIPPLicenses -CustomerTenantID "contoso.onmicrosoft.com"
Retrieves licenses for the customer tenant with the ID "contoso.onmicrosoft.com".

#>
function Get-CIPPLicenses {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID
    )
    
    Write-Verbose "Getting Licenses for $CustomerTenantID"
    $endpoint = '/api/ListLicenses'
    $params = @{
        tenantfilter = $CustomerTenantID
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}