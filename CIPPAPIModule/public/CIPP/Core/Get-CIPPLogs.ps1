<#
.SYNOPSIS
Retrieves CIPP logs from the API.

.DESCRIPTION
The Get-CIPPLogs function retrieves logs from the CIPP API by invoking the "/api/ListLogs" endpoint.

.PARAMETER None
This function does not accept any parameters.

.EXAMPLE
Get-CIPPLogs
Retrieves CIPP logs from the API.

#>

function Get-CIPPLogs {
    [CmdletBinding()]
    Param()

    Write-Verbose "Getting CIPP Logs"
    $endpoint = "/api/ListLogs"
    
    Invoke-CIPPRestMethod -Endpoint $endpoint
}
