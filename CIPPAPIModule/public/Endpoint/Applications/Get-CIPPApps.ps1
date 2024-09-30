<#
.SYNOPSIS
Retrieves a list of apps for a specific customer tenant ID.

.DESCRIPTION
The Get-CIPPApps function retrieves a list of apps for a specific customer tenant ID by making a REST API call to the "/api/listapps" endpoint.

.PARAMETER CustomerTenantID
Specifies the customer tenant ID for which to retrieve the apps.

.EXAMPLE
Get-CIPPApps -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778"
Retrieves a list of apps for the customer tenant ID "7ced1621-b8f7-4231-868c-bc6b1a2f1778".

#>
function Get-CIPPApps {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID
    )

    Write-Verbose "Getting Apps for $CustomerTenantID"
    $Endpoint = '/api/listapps'
    $Params = @{
        tenantfilter = $CustomerTenantID
    }

    Invoke-CIPPRestMethod -Endpoint $Endpoint -Params $Params

}