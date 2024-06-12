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
