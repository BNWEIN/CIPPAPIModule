<#
.SYNOPSIS
Retrieves a list of CIPP tenants.

.DESCRIPTION
The Get-CIPPTenants function retrieves a list of CIPP tenants based on the specified parameters. It makes a REST API call to the "/api/listtenants" endpoint and returns the result.

.PARAMETER CustomerTenantID
Specifies the ID of the customer tenant. This parameter is optional.

.PARAMETER ClearCache
Indicates whether to clear the cache before retrieving the tenants. This parameter is optional.

.PARAMETER TriggerRefresh
Indicates whether to trigger a refresh before retrieving the tenants. This parameter is optional.

.EXAMPLE
Get-CIPPTenants -CustomerTenantID "contoso.onmicrosoft.com" -ClearCache
This example retrieves the list of CIPP tenants for the specified customer tenant and clears the cache before retrieving the tenants.

#>
function Get-CIPPTenants {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $false)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $false)]
        [switch]$ClearCache,
        [Parameter(Mandatory = $false)]
        [switch]$TriggerRefresh
    )

    Write-Verbose "Getting Tenants"
    $endpoint = "/api/listtenants"
    $params = @{
        tenantfilter = $CustomerTenantID
    }

    if ($ClearCache) {
        $params.ClearCache = "true"
    }

    if ($TriggerRefresh) {
        $params.TriggerRefresh = "true"
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}
