<#
.SYNOPSIS
Retrieves Exo requests for a specific customer.

.DESCRIPTION
The Get-CIPPExoRequest function retrieves Exo requests for a specific customer identified by their tenant ID.

.PARAMETER CustomerTenantID
The tenant ID of the customer for whom to retrieve the Exo requests.

.EXAMPLE
Get-CIPPExoRequest -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778"
Retrieves the Exo requests for the customer with the tenant ID "7ced1621-b8f7-4231-868c-bc6b1a2f1778".

.NOTES
Requires appropriate permissions to access Exo request information.
#>

function Get-CIPPExoRequest {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID
    )

    Write-Verbose "Getting Exo Requests for customer: $CustomerTenantID"
    $endpoint = '/api/ListExoRequest'
    $params = @{
        tenantFilter = $CustomerTenantID
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}