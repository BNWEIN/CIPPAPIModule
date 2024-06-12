function Get-CIPPBasicAuth {
    [CmdletBinding()]
        Param(
            [Parameter(Mandatory = $true)]
            [string]$CustomerTenantID
        )
    
    Write-Verbose "Getting Basic Auth for customer: $CustomerTenantID"
    $Endpoint = "/api/listbasicauth"
    $Params = @{
        tenantfilter = $CustomerTenantID
    }
    Invoke-CIPPRestMethod -Endpoint $Endpoint -Params $Params
}