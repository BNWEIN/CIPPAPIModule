function Set-CIPPHideFromGAL {
    param (
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $true)]
        [string]$UserID,
        [Parameter(Mandatory = $true)]
        [validateset(
            'true',
            'false'
            )]
        [string]$hidefromgal
    )

    Write-Verbose "Setting hide from GAL to $hidefromgal for $UserID"

    $endpoint = "/api/exechidefromgal"
    $params = @{
        tenantfilter                = $CustomerTenantID
        id                          = $UserID
        hidefromgal                 = $hidefromgal
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
    
}