function Send-CIPPPush {
    [CmdletBinding()]
        Param(
            [Parameter(Mandatory = $true)]
            [string]$CustomerTenantID,
            [Parameter(Mandatory = $true)]
            [string]$UserEmail
        )
    
    Write-Verbose "Sending Push Notification to $UserEmail"

    $endpoint = "/api/execsendpush"
    $params = @{
        tenantfilter     = $CustomerTenantID
        Useremail        = $UserEmail
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}

