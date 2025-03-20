<#
.SYNOPSIS
Retrieves OAuth apps for a specific customer tenant.

.DESCRIPTION
The Get-CIPPOAuthApps function retrieves OAuth apps for a specific customer tenant by making a REST API call to the "/api/listoauthapps" endpoint.

.PARAMETER CustomerTenantID
The ID of the customer tenant for which to retrieve OAuth apps.

.EXAMPLE
Get-CIPPOAuthApps -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778"
Retrieves OAuth apps for the customer tenant with the ID "7ced1621-b8f7-4231-868c-bc6b1a2f1778".

#>
function Get-CIPPOAuthApps {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID
    )
    
    Write-Verbose "Getting OAuth apps for $CustomerTenantID"
    $endpoint = '/api/listoauthapps'
    $params = @{
        tenantFilter = $CustomerTenantID
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}