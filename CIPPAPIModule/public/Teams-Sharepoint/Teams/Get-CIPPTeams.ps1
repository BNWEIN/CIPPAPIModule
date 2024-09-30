<#
.SYNOPSIS
Retrieves teams sites for a specified customer tenant ID.

.DESCRIPTION
The Get-CIPPTeams function retrieves teams sites for a specified customer tenant ID. It uses the Invoke-CIPPRestMethod function to make a REST API call to retrieve the teams sites.

.PARAMETER CustomerTenantID
The customer tenant ID for which to retrieve teams sites. This parameter is mandatory.

.PARAMETER ID
The ID of the teams site to retrieve. This parameter is optional.

.EXAMPLE
Get-CIPPTeams -CustomerTenantID "contoso.onmicrosoft.com"
Retrieves all teams sites for the "contoso.onmicrosoft.com" tenant.

.EXAMPLE
Get-CIPPTeams -CustomerTenantID "contoso.onmicrosoft.com" -ID "12345"
Retrieves the teams site with the ID "12345" for the "contoso.onmicrosoft.com" tenant.
#>


function Get-CIPPTeams {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $false)]
        [string]$ID
    )

    Write-Verbose "Getting teams sites for $CustomerTenantID"
    $endpoint = '/api/listteams'
    $params = @{
        tenantfilter = $CustomerTenantID
        type         = if ($ID) { 'team' } else { 'list' }
        ID           = $id
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}
