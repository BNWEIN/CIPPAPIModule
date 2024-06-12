function Get-CIPPTeamsActivity {
    [CmdletBinding()]
        Param(
            [Parameter(Mandatory = $true)]
            [string]$CustomerTenantID
        )
    
    Write-Verbose "Getting teams activity $CustomerTenantID"
    $endpoint = "/api/listteamsactivity"
    $params = @{
        tenantfilter = $CustomerTenantID
        type = "TeamsUserActivityUser"
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}

