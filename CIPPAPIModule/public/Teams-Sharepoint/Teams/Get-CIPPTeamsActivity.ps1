<#
.SYNOPSIS
Retrieves the activity of Teams users in a specified customer tenant.

.DESCRIPTION
The Get-CIPPTeamsActivity function retrieves the activity of Teams users in a specified customer tenant. It makes use of the Invoke-CIPPRestMethod function to send a request to the "/api/listteamsactivity" endpoint with the provided parameters.

.PARAMETER CustomerTenantID
The ID of the customer tenant for which to retrieve the Teams activity.

.EXAMPLE
Get-CIPPTeamsActivity -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778"
Retrieves the Teams activity for the customer tenant with the ID "7ced1621-b8f7-4231-868c-bc6b1a2f1778".

#>
function Get-CIPPTeamsActivity {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID
    )
    
    Write-Verbose "Getting teams activity $CustomerTenantID"
    $endpoint = "/api/listteamsactivity"
    $params = @{
        tenantfilter = $CustomerTenantID
        type = "TeamsUserActivityUser"
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}
