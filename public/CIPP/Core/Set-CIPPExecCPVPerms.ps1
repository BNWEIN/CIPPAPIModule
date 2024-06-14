function Set-CIPPExecCPVPerms {
    [CmdletBinding()]
        Param(
            [Parameter(Mandatory = $true)]
            [guid]$CustomerTenantID,
            [Parameter(Mandatory = $false)]
            [ValidateSet(
                "true",
                "false" 
                )]
            [string]$resetsp = "false"
        )
    
    Write-Verbose "Refreshing CPV for $CustomerTenantID"
    $endpoint = "/api/execcpvpermissions"
    $params = @{
        tenantfilter    = $CustomerTenantID
        ResetSP         = $resetsp
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}

