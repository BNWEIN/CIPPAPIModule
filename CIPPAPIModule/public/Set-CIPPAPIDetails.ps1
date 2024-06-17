<#
.SYNOPSIS
Sets the CIPP API details.

.DESCRIPTION
The Set-CIPPAPIDetails function is used to set the CIPP API details, including the client ID, client secret, API URL, and tenant ID.

.PARAMETER CIPPClientID
Specifies the client ID for the CIPP API.

.PARAMETER CIPPClientSecret
Specifies the client secret for the CIPP API.

.PARAMETER CIPPAPIUrl
Specifies the URL for the CIPP API.

.PARAMETER TenantID
Specifies the tenant ID for the CIPP API.

.EXAMPLE
Set-CIPPAPIDetails -CIPPClientID "d8d41058-97df-4b80-8e1b-7083d756409f" -CIPPClientSecret "YourSecurePassword" -CIPPAPIUrl "https://api.cipp.com" -TenantID "7c2f78c0-554e-4f42-a663-c4df3ce7f51f"

This example sets the CIPP API details with the specified values.

#>
function Set-CIPPAPIDetails {
    [CmdletBinding()]
    Param(
        [Parameter(ParameterSetName = 'CIPP', Mandatory = $true)]
        [string]$CIPPClientID,
        [Parameter(ParameterSetName = 'CIPP', Mandatory = $true)]
        [String]$CIPPClientSecret,
        [Parameter(ParameterSetName = 'CIPP', Mandatory = $true)]
        [String]$CIPPAPIUrl,
        [Parameter(ParameterSetName = 'CIPP', Mandatory = $true)]
        [String]$TenantID
    )
    write-Verbose "Setting CIPP API Keys"
    $script:CIPPClientID = $CIPPClientID
    $script:CIPPClientSecret = $CIPPClientSecret
    $script:CIPPAPIUrl = $CIPPAPIUrl
    $script:TenantID = $TenantID
}