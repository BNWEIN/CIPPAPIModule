function Get-CIPPSharePointSites {
    [CmdletBinding()]
        Param(
            [Parameter(Mandatory = $true)]
            [string]$CustomerTenantID,
            [Parameter(Mandatory = $false)]
            [switch]$urlonly,
            [Parameter(Mandatory = $false)]
            [string]$UserUPN
            
        )
    
    Write-Verbose "Getting sites for $CustomerTenantID"
    $endpoint = "/api/listsites"
    $params = @{
        tenantfilter = $CustomerTenantID
        type = "SharePointSiteUsage"
        userupn = $UserUPN
    }

    if ($urlonly) {
        $params.URLOnly = "true"
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}

