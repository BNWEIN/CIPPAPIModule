<#
.SYNOPSIS
Sets calendar permissions for a user in a customer's tenant.

.DESCRIPTION
The Set-CIPPCalendarPermissions function is used to edit calendar permissions for a specified user in a customer's tenant. It allows you to set different levels of permissions for the user on the calendar folder.

.PARAMETER CustomerTenantID
Specifies the ID of the customer's tenant.

.PARAMETER Permissions
Specifies the level of permissions to be set for the user on the calendar folder. Valid values are:
- Author
- Contributor
- Editor
- Owner
- Non Editing Author
- Publishing Author
- Publishing Editor
- Reviewer
- LimitedDetails
- AvailabilityOnly

.PARAMETER Userid
Specifies the ID of the user for whom the calendar permissions are being set.

.PARAMETER RemoveAccess
Specifies whether to remove the user's access to the calendar folder. This parameter is optional.

.PARAMETER usertogetpermissions
Specifies the ID of the user for whom you are giving permission to. This parameter is optional.

.PARAMETER FolderName
Specifies the name of the calendar folder. The default value is "Calendar".

.EXAMPLE
Set-CIPPCalendarPermissions -CustomerTenantID "contoso.onmicrosoft.com" -Permissions "Editor" -Userid "user@example.com"

This example sets the calendar permissions for the user with the ID "user@example.com" in the customer's tenant with the ID "contoso.onmicrosoft.com" to "Editor" level.

#>

function Set-CIPPCalendarPermissions {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $false)]
        [ValidateSet(
            "Author", 
            "Contributor", 
            "Editor", 
            "Owner",
            "Non Editing Author",
            "Publishing Author",
            "Publishing Editor", 
            "Reviewer", 
            "LimitedDetails", 
            "AvailabilityOnly" 
            )]
        [string]$Permissions,
        [Parameter(Mandatory = $true)]
        [string]$Userid,
        [Parameter(Mandatory = $false)]
        [string]$RemoveAccess,
        [Parameter(Mandatory = $false)]
        [string]$usertogetpermissions,
        [Parameter(Mandatory = $false)]
        [string]$FolderName = "Calendar"
    )


    Write-Verbose "Editing calendar permissions for $Userid"
    $endpoint = "/api/execeditcalendarpermissions"
    $params = @{
        TenantFilter = $CustomerTenantID
        permissions = $Permissions
        userid = $Userid
        removeaccess = $RemoveAccess
        usertogetpermissions = $usertogetpermissions
        FolderName = $FolderName
    }
    
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}
