function Set-CIPPRevokeSessions {
    [CmdletBinding()]
        Param(
            [Parameter(Mandatory = $true)]
            [string]$CustomerTenantID,
            [Parameter(Mandatory = $true)]
            [string]$UserID
        )
    
    Write-Verbose "Revoking Sessions for user: $UserID"

    $endpoint = "/api/execrevokesessions"
    $params = @{
        tenantfilter     = $CustomerTenantID
        Id               = $UserID
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}

