<#
.SYNOPSIS
Connects to the CIPP API using the provided credentials.

.DESCRIPTION
The Connect-CIPP function establishes a connection to the CIPP API by obtaining an access token using the client credentials flow. It requires the CIPP API URL, client ID, client secret, and tenant ID as input parameters.

.PARAMETER CIPPAPIUrl
The URL of the CIPP API.

.PARAMETER CIPPClientID
The client ID used to authenticate with the CIPP API.

.PARAMETER CIPPClientSecret
The client secret used to authenticate with the CIPP API.

.PARAMETER TenantID
The ID of the tenant associated with the CIPP API.

.EXAMPLE
Connect-CIPP -CIPPAPIUrl "https://api.cipp.com" -CIPPClientID "12345678-1234-1234-1234-1234567890ab" -CIPPClientSecret "MyClientSecret" -TenantID "98765432-4321-4321-4321-0987654321ba"
Connects to the CIPP API using the specified credentials.

#>
function Connect-CIPP {
    [CmdletBinding()]
    Param(
        [string]$CIPPAPIUrl,
        [string]$CIPPClientID,
        [string]$CIPPClientSecret,
        [string]$TenantID
    )

    $Script:AuthBody = @{
        client_id     = $script:CIPPClientID
        client_secret = $script:CIPPClientSecret
        scope         = "api://$($script:CIPPClientID)/.default"
        grant_type    = 'client_credentials'
    }
    $token = Invoke-RestMethod -Uri "https://login.microsoftonline.com/$script:TenantId/oauth2/v2.0/token" -Method POST -Body $AuthBody

    $script:AuthHeader = @{ Authorization = "Bearer $($token.access_token)" }
    $script:TokenAcquiredTime = Get-Date
    $script:ExpiresIn = $token.expires_in

}
