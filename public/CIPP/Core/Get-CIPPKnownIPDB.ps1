function Get-CIPPKnownIPDB {
    [CmdletBinding()]
        Param(
            [Parameter(Mandatory = $false)]
            [string]$CustomerTenantID
        )
    
    Write-Verbose "Getting Known IP Database for $CustomerTenantID"
    $endpoint = "/api/listknownipdb"
    $params = @{
        tenantfilter = $CustomerTenantID
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}