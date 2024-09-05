<#
.SYNOPSIS
Retrieves the CIPP standards for a specific customer tenant.

.DESCRIPTION
The Get-CIPPStandards function retrieves the CIPP standards for a specific customer tenant by making a REST API call to the "/api/liststandards" endpoint.

.PARAMETER CustomerTenantID
The ID of the customer tenant for which to retrieve the standards.

.EXAMPLE
Get-CIPPStandards -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778"
Retrieves the CIPP standards for the customer tenant with ID "7ced1621-b8f7-4231-868c-bc6b1a2f1778".

.EXAMPLE
Get-CIPPStandards -CustomerTenantID "test.onmicrosoft.com"
Retrieves the CIPP standards for the customer tenant with ID "test.onmicrosoft.com".

#>
function Get-CIPPStandards {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $false)]
        [string]$CustomerTenantID
    )
    
    Write-Verbose "Getting standards for $CustomerTenantID"
    $endpoint = "/api/liststandards"
    $params = @{
        tenantfilter = $CustomerTenantID
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}
