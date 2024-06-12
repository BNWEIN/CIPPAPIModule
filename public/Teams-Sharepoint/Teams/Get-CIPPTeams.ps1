function Get-CIPPTeams {
    [CmdletBinding()]
        Param(
            [Parameter(Mandatory = $true)]
            [string]$CustomerTenantID,
            [Parameter(Mandatory = $false)]
            [string]$ID
        )
    
    Write-Verbose "Getting teams sites for $CustomerTenantID"
    $endpoint = "/api/listteams"
    $params = @{
        tenantfilter = $CustomerTenantID
        type = if ($ID) { "team" } else { "list" }
        ID = $id
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}

