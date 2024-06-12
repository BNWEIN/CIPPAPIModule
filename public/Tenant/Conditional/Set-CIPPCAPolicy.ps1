function Set-CIPPCAPolicy {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [ValidateSet("Enabled", "Disabled")]
        [string]$State,
        [Parameter(Mandatory = $true)]
        [guid]$Guid
    )

    Write-Verbose "Editing CA Policy for tenant $CustomerTenantID"
    $endpoint = "/api/editcapolicy"
    $params = @{
        tenantfilter = $CustomerTenantID
        state = $State
        guid = $Guid
    }
    
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}

