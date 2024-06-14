function Remove-CIPPGroup {
    param (
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $true)]
        [guid]$GroupID,
        [Parameter(Mandatory = $true)]
        [string]$Grouptype,
        [Parameter(Mandatory = $true)]
        [string]$DisplayName
    )

    Write-Verbose "Removing group: $GroupID"

    $endpoint = "/api/execgroupsdelete"
    $params = @{
        tenantfilter        = $CustomerTenantID
        id                  = $GroupID
        grouptype           = $Grouptype
        displayname         = $DisplayName
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
    
}