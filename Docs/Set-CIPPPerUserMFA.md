# Set-CIPPPerUserMFA
## SYNOPSIS
Sets the per-user MFA state for a specified user.
## DESCRIPTION
The Set-CIPPPerUserMFA function configures the per-user Multi-Factor Authentication (MFA) state for a specified user in the customer's tenant. This function allows you to enable, disable, or enforce MFA for individual users using the legacy per-user MFA settings.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the customer tenant ID. This parameter is mandatory.

  ## **-UserId**
> ![Foo](https://img.shields.io/badge/Type-Guid-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the unique identifier (GUID) of the user. Either UserPrincipalName or UserId must be specified.

  ## **-UserPrincipalName**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the User Principal Name of the user. Either UserPrincipalName or UserId must be specified.

  ## **-State**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the MFA state to set. Valid values are 'Enabled', 'Disabled', and 'Enforced'. This parameter is mandatory.

 #### EXAMPLE 1
```powershell
PS > Set-CIPPPerUserMFA -CustomerTenantID "contoso.onmicrosoft.com" -UserPrincipalName "john.doe@contoso.com" -State "Enabled"

Enables per-user MFA for john.doe@contoso.com.
```
 #### EXAMPLE 2
```powershell
PS > Set-CIPPPerUserMFA -CustomerTenantID "contoso.onmicrosoft.com" -UserPrincipalName "jane.smith@contoso.com" -State "Enforced"

Enforces per-user MFA for jane.smith@contoso.com, requiring MFA on every sign-in.
```
 #### EXAMPLE 3
```powershell
PS > Set-CIPPPerUserMFA -CustomerTenantID "contoso.onmicrosoft.com" -UserId "12345678-1234-1234-1234-123456789abc" -State "Enabled"

Enables per-user MFA using the UserId instead of UserPrincipalName.
```
 #### EXAMPLE 4
```powershell
PS > Set-CIPPPerUserMFA -CustomerTenantID "contoso.onmicrosoft.com" -UserPrincipalName "bob.jones@contoso.com" -State "Disabled"

Disables per-user MFA for bob.jones@contoso.com.
```

