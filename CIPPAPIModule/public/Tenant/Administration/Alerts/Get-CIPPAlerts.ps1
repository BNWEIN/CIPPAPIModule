<#
.SYNOPSIS
Retrieves CIPP alerts from the API.

.DESCRIPTION
The Get-CIPPAlerts function retrieves CIPP alerts from the API by invoking the "/api/getcippalerts" endpoint.

.PARAMETER None
This function does not accept any parameters.

.EXAMPLE
Get-CIPPAlerts
Retrieves CIPP alerts from the API.

#>

function Get-CIPPAlerts {
    [CmdletBinding()]
    param ()
    
    Write-Verbose "Getting CIPP Alerts"

    # Define the endpoint and parameters
    $endpoint = "/api/getcippalerts"

    Invoke-CIPPRestMethod -Endpoint $endpoint
}
