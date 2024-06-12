function Get-CIPPDeviceCompliance {
    [CmdletBinding()]
        Param(
            [Parameter(Mandatory = $true)]
            [string]$CustomerTenantID
        )
    
    Write-Verbose "Getting Device Compliance for $CustomerTenantID"
    $endpoint = "/api/listalltenantdevicecompliance"
    $params = @{
        tenantfilter = $CustomerTenantID
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}