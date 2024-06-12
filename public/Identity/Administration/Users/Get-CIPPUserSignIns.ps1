function Get-CIPPUserSignIns {
    [CmdletBinding()]
        Param(
            [Parameter(Mandatory = $true)]
            [string]$CustomerTenantID,
            [Parameter(Mandatory = $true)]
            [guid]$UserID
        )

        Write-Verbose "Getting sign in logs for User $userID"

    $endpoint = "/api/listusersigninlogs"
    $params = @{
        tenantfilter = $CustomerTenantID
        userId = $UserID
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}

