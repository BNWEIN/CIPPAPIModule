<#
.SYNOPSIS
Retrieves SharePoint sites for a specified customer tenant.

.DESCRIPTION
The Get-CIPPSharePointSites function retrieves SharePoint sites for a specified customer tenant. It uses the Invoke-CIPPRestMethod function to make a REST API call to retrieve the sites.

.PARAMETER CustomerTenantID
The ID of the customer tenant for which to retrieve SharePoint sites. This parameter is mandatory.

.PARAMETER urlonly
Specifies whether to retrieve only the URLs of the SharePoint sites. By default, this parameter is not specified.

.PARAMETER UserUPN
The user's UPN (User Principal Name) for which to retrieve SharePoint sites. This parameter is optional.

.EXAMPLE
Get-CIPPSharePointSites -CustomerTenantID "contoso.onmicrosoft.com"
Retrieves all SharePoint sites for the customer tenant "contoso.onmicrosoft.com".

.EXAMPLE
Get-CIPPSharePointSites -CustomerTenantID "contoso.onmicrosoft.com" -urlonly
Retrieves only the URLs of the SharePoint sites for the customer tenant "contoso.onmicrosoft.com".

.EXAMPLE
Get-CIPPSharePointSites -CustomerTenantID "contoso.onmicrosoft.com" -UserUPN "user@contoso.com"
Retrieves SharePoint sites for the user "user@contoso.com" in the customer tenant "contoso.onmicrosoft.com".
#>

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
