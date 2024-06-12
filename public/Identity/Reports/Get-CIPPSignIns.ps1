function Get-CIPPSignIns {
    [CmdletBinding()]
        Param(
            [Parameter(Mandatory = $true)]
            [string]$CustomerTenantID,
            [Parameter(Mandatory = $false)]
            [switch]$failedlogononly,
            [Parameter(Mandatory = $false)]
            [string]$filter
        )
    
    Write-Verbose "Getting Signins for $CustomerTenantID"
    $endpoint = "/api/listsignins"
    $params = @{
        tenantfilter = $CustomerTenantID
        filter = $filter
    }

    if ($failedlogononly) {
        $params.failedlogononly = "true"
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}

