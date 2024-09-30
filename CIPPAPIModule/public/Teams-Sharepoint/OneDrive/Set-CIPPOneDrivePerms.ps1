<#
.SYNOPSIS
Sets permissions for a user on a OneDrive.

.DESCRIPTION
The Set-CIPPOneDrivePerms function is used to give or remove access permissions for a specified user on a OneDrive.

.PARAMETER CustomerTenantID
The ID of the customer's tenant.

.PARAMETER OneDriveUserUPN
The User Principal Name (UPN) of the OneDrive user.

.PARAMETER RemovePermission
Specifies whether to remove the access permission for the specified user. If set to $true, the permission will be removed. If set to $false, the permission will be granted.

.PARAMETER GiveAccessToUPN
The User Principal Name (UPN) of the user to whom access is being granted or removed.

.EXAMPLE
Set-CIPPOneDrivePerms -CustomerTenantID "contoso.onmicrosoft.com" -OneDriveUserUPN "john@contoso.com" -RemovePermission $false -GiveAccessToUPN "jane@contoso.com"
Grants access to "jane@contoso.com" on the OneDrive of user "john@contoso.com" in the "contoso.onmicrosoft.com" tenant.

.EXAMPLE
Set-CIPPOneDrivePerms -CustomerTenantID "contoso.onmicrosoft.com" -OneDriveUserUPN "john@contoso.com" -RemovePermission $true -GiveAccessToUPN "jane@contoso.com"
Removes access for "jane@contoso.com" from the OneDrive of user "john@contoso.com" in the "contoso.onmicrosoft.com" tenant.
#>
function Set-CIPPOneDrivePerms {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $true)]
        [string]$OneDriveUserUPN,
        [Parameter(Mandatory = $true)]
        [bool]$RemovePermission,
        [Parameter(Mandatory = $true)]
        [string]$GiveAccessToUPN
    )

    Write-Verbose "Giving access to $GiveAccessToUPN on $OneDriveUserUPN's OneDrive."
    $endpoint = '/api/ExecSharePointPerms'
    $body = @{
        TenantFilter     = $CustomerTenantID
        UPN              = $OneDriveUserUPN
        URL              = $SiteUrl
        RemovePermission = $RemovePermission
        input            = $GiveAccessToUPN
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Body $body -Method POST
}
