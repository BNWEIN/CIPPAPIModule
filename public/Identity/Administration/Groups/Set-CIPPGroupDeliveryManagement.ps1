function Set-CIPPGroupDeliveryManagement {
    param (
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $true)]
        [guid]$GroupID,
        [Parameter(Mandatory = $true)]
        [validateset(
            'Distribution List',
            'Mail-Enabled Security',
            'Microsoft 365'
        )]
        [string]$Grouptype,
        [Parameter(Mandatory = $true)]
        [validateset(
            'true',
            'false'
            )]
        [string]$onlyallowinternal
    )

    Write-Verbose "Setting delivery management for group: $GroupID"

    $endpoint = "/api/execgroupsdeliverymanagement"
    $params = @{
        tenantfilter                = $CustomerTenantID
        id                          = $GroupID
        grouptype                   = $Grouptype
        onlyallowinternal           = $onlyallowinternal
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
    
}