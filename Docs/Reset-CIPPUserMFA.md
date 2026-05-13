# Reset-CIPPUserMFA
## SYNOPSIS
Resets the Multi-Factor Authentication (MFA) for a specified user.
## DESCRIPTION
The Reset-CIPPUserMFA function resets the MFA authentication methods for a specified user in the customer's tenant. This forces the user to re-register their MFA methods on their next sign-in. This is useful when a user has lost access to their MFA device or needs to reconfigure their authentication methods.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the customer tenant ID. This parameter is mandatory.

  ## **-UserPrincipalName**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the User Principal Name of the user whose MFA will be reset. This parameter is mandatory.

 #### EXAMPLE 1
```powershell
PS > Reset-CIPPUserMFA -CustomerTenantID "contoso.onmicrosoft.com" -UserPrincipalName "john.doe@contoso.com"

Resets the MFA authentication methods for john.doe@contoso.com, requiring them to re-register MFA on their next sign-in.
```
 #### EXAMPLE 2
```powershell
PS > Reset-CIPPUserMFA -CustomerTenantID "7a90b7e8-5f9a-4c3d-8b2e-1a3f5c7d9e2b" -UserPrincipalName "jane.smith@contoso.com"

Resets the MFA authentication methods for jane.smith@contoso.com using the tenant GUID.
```

