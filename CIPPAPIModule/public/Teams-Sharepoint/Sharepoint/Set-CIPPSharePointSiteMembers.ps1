<#
.SYNOPSIS
Sets SharePoint site members with specified permissions.

.DESCRIPTION
The Set-CIPPSharePointSiteMembers function is used to set SharePoint site members with specified permissions. It sends a request to the CIPP API to execute the operation.

.PARAMETER CustomerTenantID
Specifies the ID of the customer's tenant.

.PARAMETER SharePointType
Specifies the type of SharePoint site.

.PARAMETER SiteUrl
Specifies the URL of the SharePoint site.

.PARAMETER AddPermission
Specifies whether to add or remove permissions for the user.

.PARAMETER GroupUPN
Specifies the UPN (User Principal Name) of the site group.

.PARAMETER UserToGiveAccessUPN
Specifies the UPN of the user to give access to.

.EXAMPLE
Set-CIPPSharePointSiteMembers -CustomerTenantID "contoso.onmicrosoft.com" -SharePointType "Group" -SiteUrl "https://contoso.sharepoint.com/sites/TeamSite" -AddPermission $true -GroupUPN "group@contoso.com" -UserToGiveAccessUPN "user@contoso.com"
Sets the SharePoint site members by adding permissions for the specified user.
.
#>
function Set-CIPPSharePointSiteMembers {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $true)]
        [string]$SharePointType,
        [Parameter(Mandatory = $true)]
        [string]$SiteUrl,
        [Parameter(Mandatory = $true)]
        [bool]$AddPermission,
        [Parameter(Mandatory = $true)]
        [string]$GroupUPN,
        [Parameter(Mandatory = $true)]
        [string]$UserToGiveAccessUPN
    )

    Write-Verbose "Setting SharePoint Member on $Url"
    $endpoint = "/api/ExecSetSharePointMember"
    $body = @{
        TenantFilter = $CustomerTenantID
        SharePointType = $SharePointType
        URL = $SiteUrl
        add = $AddPermission
        GroupId = $GroupUPN
        input = $UserToGiveAccessUPN
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Body $body -Method POST
}
