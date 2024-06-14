function Set-CIPPGroupHideFromGAL {
    param (
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $true)]
        [guid]$GroupID,
        [Parameter(Mandatory = $true)]
        [validateset(
            'Distribution List',
            'Mail-Enabled Security',
            'Microsoft 365',
            'Security'
        )]
        [string]$Grouptype,
        [Parameter(Mandatory = $true)]
        [validateset(
            'true',
            'false'
            )]
        [string]$hidefromgal
    )

    Write-Verbose "Setting hide from GAL to $hidefromgal for $GroupID"

    $endpoint = "/api/execgroupshidefromgal"
    $params = @{
        tenantfilter                = $CustomerTenantID
        id                          = $GroupID
        grouptype                   = $Grouptype
        hidefromgal                 = $hidefromgal
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
    
}