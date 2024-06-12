function Get-CIPPInactiveAccounts {
    [CmdletBinding()]
        Param(
            [Parameter(Mandatory = $true)]
            [string]$CustomerTenantID
        )
    
    Write-Verbose "Getting inactive accounts for customer: $CustomerTenantID"
    $endpoint = "/api/listinactiveaccounts"
    $params = @{
        tenantfilter = $CustomerTenantID
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}

