<#
.SYNOPSIS
Sets the SharePoint site admin for a given site.

.DESCRIPTION
The Set-CIPPSharePointSiteAdmin function sets the SharePoint site admin for a specified site by making a REST API call to the CIPP API.

.PARAMETER CustomerTenantID
The ID of the customer's tenant.

.PARAMETER CurrentAdminUPN
The UPN (User Principal Name) of the current site admin.

.PARAMETER SiteUrl
The URL of the SharePoint site.

.PARAMETER RemovePermission
Specifies whether to remove the admin permission for the current admin UPN.

.PARAMETER AdditionalAdminUPN
The UPN of the additional admin to be added.

.EXAMPLE
Set-CIPPSharePointSiteAdmin -CustomerTenantID "contoso.onmicrosoft.com" -CurrentAdminUPN "admin@contoso.com" -SiteUrl "https://contoso.sharepoint.com/sites/site1" -RemovePermission $true -AdditionalAdminUPN "admin2@contoso.com"
Sets the SharePoint site admin for the site "https://contoso.sharepoint.com/sites/site1" by removing the admin permission for "admin@contoso.com" and adding "admin2@contoso.com" as an additional admin.

#>
function Set-CIPPSharePointSiteAdmin {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $true)]
        [string]$CurrentAdminUPN,
        [Parameter(Mandatory = $true)]
        [string]$SiteUrl,
        [Parameter(Mandatory = $true)]
        [bool]$RemovePermission,
        [Parameter(Mandatory = $true)]
        [string]$AdditionalAdminUPN
    )

    Write-Verbose "Setting SharePoint Owner on $Url"
    $endpoint = "/api/ExecSharePointPerms"
    $body = @{
        TenantFilter = $CustomerTenantID
        UPN = $CurrentAdminUPN
        URL = $SiteUrl
        RemovePermission = $RemovePermission
        input = $AdditionalAdminUPN
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Body $body -Method POST
}
