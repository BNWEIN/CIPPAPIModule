# Set-CIPPResetPassword
## SYNOPSIS
Resets the password for a user in the CIPP system.
## DESCRIPTION
The Set-CIPPResetPassword function is used to reset the password for a user in the CIPP system. It sends a request to the CIPP API to reset the password for the specified user.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The ID of the customer tenant in the CIPP system.

  ## **-UserID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The ID of the user whose password needs to be reset.

  ## **-MustChange**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-true-Blue?color=5547a8)\
Specifies whether the user must change their password upon next login. The default value is "true".

 #### EXAMPLE 1
```powershell
PS > Set-CIPPResetPassword -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" -UserID "user@domain.com" -MustChange "false"
```

