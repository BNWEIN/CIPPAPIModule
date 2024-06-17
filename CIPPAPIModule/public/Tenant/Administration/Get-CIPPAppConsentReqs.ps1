<#
.SYNOPSIS
Retrieves app consent requests for a specific customer tenant.

.DESCRIPTION
The Get-CIPPAppConsentReqs function retrieves app consent requests for a specific customer tenant by making a REST API call to the "/api/listappconsentrequests" endpoint.

.PARAMETER CustomerTenantID
The ID of the customer tenant for which to retrieve app consent requests. This parameter is mandatory.

.EXAMPLE
Get-CIPPAppConsentReqs -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778"
Retrieves app consent requests for the customer tenant with the ID "7ced1621-b8f7-4231-868c-bc6b1a2f1778".

#>
function Get-CIPPAppConsentReqs {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID
    )
    
    Write-Verbose "Getting app consent requests for customer: $CustomerTenantID"
    $Endpoint = "/api/listappconsentrequests"
    $Params = @{
        tenantfilter = $CustomerTenantID
    }
    
    Invoke-CIPPRestMethod -Endpoint $Endpoint -Params $Params

}