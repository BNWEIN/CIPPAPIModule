function Get-CIPPRecipients {
    [CmdletBinding()]
        Param(
            [Parameter(Mandatory = $true)]
            [string]$CustomerTenantID
        )
    
    Write-Verbose "Getting recipients for $CustomerTenantID"
    $endpoint = "/api/listrecipients"
    $params = @{
        tenantfilter = $CustomerTenantID
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}

