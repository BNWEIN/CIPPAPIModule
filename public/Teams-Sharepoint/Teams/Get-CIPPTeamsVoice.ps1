function Get-CIPPTeamsVoice {
    [CmdletBinding()]
        Param(
            [Parameter(Mandatory = $true)]
            [string]$CustomerTenantID
        )
    
    Write-Verbose "Getting teams voice $CustomerTenantID"
    $endpoint = "/api/listteamsvoice"
    $params = @{
        tenantfilter = $CustomerTenantID
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}

