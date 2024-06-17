# Set-CIPPSignInStatus
## SYNOPSIS
Sets the sign-in status for a user in the CIPP system.
## DESCRIPTION
The Set-CIPPSignInStatus function is used to enable or disable the sign-in status for a user in the CIPP system. 
When the $Enable parameter is set to "true", the function enables sign-in for the specified user. 
When the $Enable parameter is set to "false", the function disables sign-in for the specified user.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the ID of the customer tenant.

  ## **-UserID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the ID of the user.

  ## **-Enable**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies whether to enable or disable sign-in for the user.  Valid values are "true" (to enable sign-in) or "false" (to disable sign-in).

 #### EXAMPLE 1
```powershell
PS > Set-CIPPSignInStatus -CustomerTenantID "47b02ab5-376d-4c85-b82d-13996c023c93" -UserID "281ceb6e-3d12-4a7f-b571-3c4f35ad85bc" -Enable "true"
```
 #### EXAMPLE 2
```powershell
PS > Set-CIPPSignInStatus -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" -UserID "281ceb6e-3d12-4a7f-b571-3c4f35ad85bc" -Enable "false"
```

