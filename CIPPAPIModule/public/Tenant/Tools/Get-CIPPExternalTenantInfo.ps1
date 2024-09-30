<#
.SYNOPSIS
Retrieves external tenant information for a specified tenant.

.DESCRIPTION
The Get-CIPPExternalTenantInfo function retrieves external tenant information for a specified tenant by making a REST API call to the "/api/ListExternalTenantInfo" endpoint.

.PARAMETER Tenant
Specifies the name of the tenant for which to retrieve the external tenant information.

.EXAMPLE
Get-CIPPExternalTenantInfo -Tenant "Contoso.com"
Retrieves the external tenant information for the "Contoso" tenant.

#>
function Get-CIPPExternalTenantInfo {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$Tenant
    )
   
    Write-Verbose "Getting Tenant info for $Tenant"
    $endpoint = '/api/ListExternalTenantInfo'
    $params = @{
        tenant = $Tenant
    }
    
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}