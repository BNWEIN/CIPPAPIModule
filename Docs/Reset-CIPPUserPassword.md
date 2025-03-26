# Reset-CIPPUserPassword
## SYNOPSIS
Resets the password for a user in a Microsoft 365 tenant.
## DESCRIPTION
The Reset-CIPPUserPassword function resets the password for a specified user in a Microsoft 365 tenant.
The function uses the CIPP API to perform the password reset operation.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The tenant ID of the Microsoft 365 tenant where the user resides.

  ## **-UserID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The ID of the user whose password will be reset.

  ## **-MustChange**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-true-Blue?color=5547a8)\
Specifies whether the user must change their password at next logon. Valid values are 'true' or 'false'. Default is 'true'.

  ## **-DisplayName**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-$UserID-Blue?color=5547a8)\
The display name of the user. If not specified, the UserID will be used as the display name.

 #### EXAMPLE 1
```powershell
PS > Reset-CIPPUserPassword -CustomerTenantID '12345678-1234-1234-1234-1234567890ab' -UserID 'user@example.com'
```
 #### EXAMPLE 2
```powershell
PS > Reset-CIPPUserPassword -CustomerTenantID '12345678-1234-1234-1234-1234567890ab' -UserID 'user@example.com' -MustChange 'false'
```

