<#
.SYNOPSIS
Retrieves named locations for a specific customer tenant.

.DESCRIPTION
The Get-CIPPNamedLocations function retrieves named locations for a specific customer tenant by making a REST API call to the "/api/listnamedlocations" endpoint.

.PARAMETER CustomerTenantID
The ID of the customer tenant for which to retrieve named locations.

.EXAMPLE
Get-CIPPNamedLocations -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778"
Retrieves named locations for the customer tenant with ID "7ced1621-b8f7-4231-868c-bc6b1a2f1778".

.EXAMPLE
Get-CIPPNamedLocations -CustomerTenantID "contoso.onmicrosoft.com"
Retrieves named locations for the customer tenant with ID "contoso.onmicrosoft.com".

#>
function Get-CIPPNamedLocations {
    [CmdletBinding()]
        Param(
            [Parameter(Mandatory = $true)]
            [string]$CustomerTenantID
        )
    
    Write-Verbose "Getting named locations for $CustomerTenantID"
    $endpoint = "/api/listnamedlocations"
    $params = @{
        tenantfilter = $CustomerTenantID
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}