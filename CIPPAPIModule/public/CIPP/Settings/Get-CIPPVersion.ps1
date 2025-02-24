<#
.SYNOPSIS
    Retrieves the version of the CIPP application.

.DESCRIPTION
    The Get-CIPPVersion function retrieves the version of the CIPP application by making a REST API call to the "/api/GetVersion" endpoint.

.PARAMETER None
    This function does not accept any parameters.

.EXAMPLE
    Get-CIPPVersion
    Retrieves the version of the CIPP application.

#>
function Get-CIPPVersion {
    [CmdletBinding()]
    Param()

    Write-Verbose 'Getting CIPP Version'
    $endpoint = '/api/GetVersion'
    
    Invoke-CIPPRestMethod -Endpoint $endpoint
}
