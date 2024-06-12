function Set-CIPPCreateTap {
    [CmdletBinding()]
        Param(
            [Parameter(Mandatory = $true)]
            [string]$CustomerTenantID,
            [Parameter(Mandatory = $true)]
            [string]$UserID
        )

        Write-Verbose "Creating TAP for User: $userID"

    $endpoint = "/api/execcreatetap"
    $params = @{
        tenantfilter = $CustomerTenantID
        Id = $UserID
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}

