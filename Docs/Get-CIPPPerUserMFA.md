# Get-CIPPPerUserMFA
## SYNOPSIS
Retrieves the per-user Multi-Factor Authentication (MFA) status for a specified user or all users in a given customer tenant.
## DESCRIPTION

# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The ID of the customer tenant for which to retrieve the per-user MFA status. This parameter is mandatory.

  ## **-UserId**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
The ID of the user for whom to retrieve the per-user MFA status. This parameter is optional and is ignored if the AllUsers switch is specified. Can be either the user's email address or the user's ID.

  ## **-AllUsers**
> ![Foo](https://img.shields.io/badge/Type-SwitchParameter-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-False-Blue?color=5547a8)\
A switch parameter that, when specified, retrieves the per-user MFA status for all users in the specified customer tenant. If this switch is specified, the UserId parameter is ignored.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPPerUserMFA -CustomerTenantID "12345" -UserId "user@example.com"
```
 #### EXAMPLE 2
```powershell
PS > Get-CIPPPerUserMFA -CustomerTenantID "12345" -AllUsers
```

