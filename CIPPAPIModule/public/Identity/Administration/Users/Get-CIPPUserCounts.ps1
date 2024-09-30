<#
.SYNOPSIS
Retrieves user counts for a specific customer tenant ID.

.DESCRIPTION
The Get-CIPPUserCounts function retrieves user counts for a specific customer tenant ID by making a REST API call to the "/api/listusercounts" endpoint.

.PARAMETER CustomerTenantID
The customer tenant ID for which to retrieve user counts.

.EXAMPLE
Get-CIPPUserCounts -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778"
Retrieves user counts for the customer tenant ID "7ced1621-b8f7-4231-868c-bc6b1a2f1778".

#>

function Get-CIPPUserCounts {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID
    )

    Write-Verbose "Getting User Counts for $CustomerTenantID"
    $endpoint = '/api/listusercounts'
    $params = @{
        tenantfilter = $CustomerTenantID
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}
