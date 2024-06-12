function Get-CIPPExternalTenantInfo {
    [CmdletBinding()]
        Param(
            [Parameter(Mandatory = $true)]
            [string]$Tenant
        )
   
    Write-Verbose "Getting Tenant info for $Tenant"
    $endpoint = "/api/ListExternalTenantInfo"
    $params = @{
        tenant = $Tenant
    }
    
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}