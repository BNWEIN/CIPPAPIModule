<#
.SYNOPSIS
Gets extensions configuration.

.DESCRIPTION
The Get-CIPPExtensionsConfig function retrieves the configuration settings for CIPP extensions, including special handling for HaloPSA ticket types.

.EXAMPLE
Get-CIPPExtensionsConfig
Returns the current extensions configuration settings.

.NOTES
Requires CIPP.Extension.Read permissions.
HaloPSA ticket types are automatically formatted for autocomplete compatibility.
#>

function Get-CIPPExtensionsConfig {
    [CmdletBinding()]
    param ()

    Write-Verbose 'Getting extensions configuration'

    $endpoint = '/api/ListExtensionsConfig'

    Invoke-CIPPRestMethod -Endpoint $endpoint -Method GET
}