function Get-CIPPTenants {
    [CmdletBinding()]
        Param(
            [Parameter(Mandatory = $false)]
            [string]$CustomerTenantID,
            [Parameter(Mandatory = $false)]
            [switch]$ClearCache,
            [Parameter(Mandatory = $false)]
            [switch]$TriggerRefresh
        )
    
    Write-Verbose "Getting Tenants"
    $endpoint = "/api/listtenants"
    $params = @{
        tenantfilter = $CustomerTenantID
    }

    if ($ClearCache) {
        $params.ClearCache = "true"
    }

    if ($TriggerRefresh) {
        $params.TriggerRefresh = "true"
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}

