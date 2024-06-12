function Set-CIPPClrImmID {
    [CmdletBinding()]
        Param(
            [Parameter(Mandatory = $true)]
            [string]$CustomerTenantID,
            [Parameter(Mandatory = $true)]
            [guid]$UserID
        )

        Write-Verbose "Clearing Immutable ID for User: $userID"

    $endpoint = "/api/execclrimmid"
    $params = @{
        tenantfilter = $CustomerTenantID
        Id = $UserID
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}

