<#
.SYNOPSIS
Retrieves Basic Authentication information for a specific customer.

.DESCRIPTION
The Get-CIPPBasicAuth function retrieves Basic Authentication information for a specific customer by making a REST API call to the "/api/listbasicauth" endpoint.

.PARAMETER CustomerTenantID
The unique identifier of the customer's tenant.

.EXAMPLE
Get-CIPPBasicAuth -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778"
Retrieves Basic Authentication information for the customer with the tenant ID "7ced1621-b8f7-4231-868c-bc6b1a2f1778".

#>
function Get-CIPPBasicAuth {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID
    )
    
    Write-Verbose "Getting Basic Auth for customer: $CustomerTenantID"
    $Endpoint = '/api/listbasicauth'
    $Params = @{
        tenantFilter = $CustomerTenantID
    }
    Invoke-CIPPRestMethod -Endpoint $Endpoint -Params $Params
}