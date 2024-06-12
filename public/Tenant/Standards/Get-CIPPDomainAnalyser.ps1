function Get-CIPPDomainAnalyser {
    [CmdletBinding()]
        Param(
            [Parameter(Mandatory = $true)]
            [string]$CustomerTenantID
        )
    
    Write-Verbose "Getting Domain Analyser List for customer: $CustomerTenantID"
    $endpoint = "/api/ListDomainAnalyser"
    $params = @{
        tenantfilter = $CustomerTenantID
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}

