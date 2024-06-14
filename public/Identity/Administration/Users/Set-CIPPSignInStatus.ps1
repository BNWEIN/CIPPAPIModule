function Set-CIPPSignInStatus {
    [CmdletBinding()]
        Param(
            [Parameter(Mandatory = $true)]
            [string]$CustomerTenantID,
            [Parameter(Mandatory = $true)]
            [string]$UserID,
            [Parameter(Mandatory = $true)]
            [ValidateSet(
                "true",
                "false" 
                )]
            [string]$Enable

        )
    
    if ($Enable -eq "true") {
        Write-Verbose "Enabling signin for $UserID"
    } else {
        Write-Verbose "Disabling signin for $UserID"
    }
    $endpoint = "/api/execdisableuser"
    $params = @{
        tenantfilter = $CustomerTenantID
        Id = $UserID
        Enable = $Enable
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}

