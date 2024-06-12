function Get-CIPPApps {
    [CmdletBinding()]
        Param(
            [Parameter(Mandatory = $true)]
            [string]$CustomerTenantID
        )
    
    Write-Verbose "Getting Apps for $CustomerTenantID"
    $Endpoint = "/api/listapps"
    $Params = @{
        tenantfilter = $CustomerTenantID
    }
    
    Invoke-CIPPRestMethod -Endpoint $Endpoint -Params $Params

}