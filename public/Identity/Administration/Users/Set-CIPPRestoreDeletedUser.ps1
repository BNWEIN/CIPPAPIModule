function Set-CIPPRestoreDeletedUser {
    [CmdletBinding()]
        Param(
            [Parameter(Mandatory = $true)]
            [string]$CustomerTenantID,
            [Parameter(Mandatory = $true)]
            [string]$ID
        )
    
    Write-Verbose "Restoring user: $ID"

    $endpoint = "/api/execrestoredeleted"
    $params = @{
        tenantfilter     = $CustomerTenantID
        Id               = $ID
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}

