function Set-CIPPTransportRule {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory)]
        [ValidateSet("Enable", "Disable")]
        [string]$State,
        [Parameter(Mandatory = $true)]
        [guid]$Guid
    )


    Write-Verbose "Editing transport rule for tenant $CustomerTenantID"
    $endpoint = "/api/edittransportrule"
    $params = @{
        TenantFilter = $CustomerTenantID
        state = $State
        GUID = $Guid
    }
    
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}

