<#
.SYNOPSIS
Gets the list of trusted IPs.

.DESCRIPTION
The Get-CIPPTrustedIP function retrieves the list of trusted IP addresses from CIPP.

.EXAMPLE
Get-CIPPTrustedIP
Returns all trusted IP addresses configured in CIPP.

.NOTES
Requires CIPP.Core.Read permissions.
#>

function Get-CIPPTrustedIP {
    [CmdletBinding()]
    param ()

    Write-Verbose 'Getting trusted IP addresses'

    $endpoint = '/api/ListIPWhitelist'

    Invoke-CIPPRestMethod -Endpoint $endpoint -Method GET
}