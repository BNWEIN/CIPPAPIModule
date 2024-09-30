<#
.SYNOPSIS
Runs standards for a specific customer tenant.

.DESCRIPTION
The Set-CIPPStandardsRun function runs standards for a specific customer tenant by invoking a REST API endpoint.

.PARAMETER CustomerTenantID
The ID of the customer tenant for which the standards should be run.

.EXAMPLE
Set-CIPPStandardsRun -CustomerTenantID "contoso.onmicrosoft.com"
Runs standards for the customer tenant with ID "contoso.onmicrosoft.com".

#>
function Set-CIPPStandardsRun {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID
    )
    
    Write-Verbose "Running standards for $CustomerTenantID"
    $endpoint = '/api/execstandardsrun'
    $params = @{
        tenantfilter = $CustomerTenantID
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}
