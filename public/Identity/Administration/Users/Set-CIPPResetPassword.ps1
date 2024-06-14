function Set-CIPPResetPassword {
    [CmdletBinding()]
        Param(
            [Parameter(Mandatory = $true)]
            [string]$CustomerTenantID,
            [Parameter(Mandatory = $true)]
            [string]$UserID,
            [Parameter(Mandatory = $false)]
            [ValidateSet(
                "true",
                "false" 
                )]
            [string]$MustChange = "true"

        )
    
    Write-Verbose "Resetting password for $UserID"

    $endpoint = "/api/execresetpass"
    $params = @{
        tenantfilter     = $CustomerTenantID
        Id               = $UserID
        MustChange       = $MustChange
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}

