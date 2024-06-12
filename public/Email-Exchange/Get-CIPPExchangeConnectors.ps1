function Get-CIPPExchangeConnectors {
    [CmdletBinding()]
        Param(
            [Parameter(Mandatory = $true)]
            [string]$CustomerTenantID
        )
    
    Write-Verbose "Getting Exchange Connectors for customer: $CustomerTenantID"
    $endpoint = "/api/listexchangeconnectors"
    $params = @{
        tenantfilter = $CustomerTenantID
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}

