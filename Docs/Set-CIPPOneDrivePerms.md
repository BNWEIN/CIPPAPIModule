# Set-CIPPOneDrivePerms
## SYNOPSIS
Sets permissions for a user on a OneDrive.
## DESCRIPTION
The Set-CIPPOneDrivePerms function is used to give or remove access permissions for a specified user on a OneDrive.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The ID of the customer's tenant.

  ## **-OneDriveUserUPN**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The User Principal Name (UPN) of the OneDrive user.

  ## **-RemovePermission**
> ![Foo](https://img.shields.io/badge/Type-Boolean-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) ![Foo](https://img.shields.io/badge/DefaultValue-False-Blue?color=5547a8)\
Specifies whether to remove the access permission for the specified user. If set to $true, the permission will be removed. If set to $false, the permission will be granted.

  ## **-GiveAccessToUPN**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The User Principal Name (UPN) of the user to whom access is being granted or removed.

 #### EXAMPLE 1
```powershell
PS > Set-CIPPOneDrivePerms -CustomerTenantID "contoso.onmicrosoft.com" -OneDriveUserUPN "john@contoso.com" -RemovePermission $false -GiveAccessToUPN "jane@contoso.com"
```
 #### EXAMPLE 2
```powershell
PS > Set-CIPPOneDrivePerms -CustomerTenantID "contoso.onmicrosoft.com" -OneDriveUserUPN "john@contoso.com" -RemovePermission $true -GiveAccessToUPN "jane@contoso.com"
```

