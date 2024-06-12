function Get-CIPPUserDevices {
    [CmdletBinding()]
        Param(
            [Parameter(Mandatory = $true)]
            [string]$CustomerTenantID,
            [Parameter(Mandatory = $true)]
            [string]$UserID
        )
    
    
        Write-Verbose "Getting user devices for $userID"
    
    $endpoint = "/api/listuserdevices"
    $params = @{
        tenantfilter = $CustomerTenantID
        userId = $UserID
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}

