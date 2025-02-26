# Set-CIPPHideFromGAL
## SYNOPSIS
Sets the "hide from Global Address List (GAL)" property for a user in a customer's tenant.
## DESCRIPTION
The Set-CIPPHideFromGAL function is used to set the "hide from GAL" property for a specified user in a customer's tenant. This property determines whether the user's email address is visible in the Global Address List (GAL) or not.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the ID of the customer's tenant.

  ## **-UserID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the ID of the user for whom the "hide from GAL" property needs to be set.

  ## **-HideFromGAL**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies whether the user's email address should be hidden from the GAL or not. Valid values are 'true' and 'false'.

 #### EXAMPLE 1
```powershell
PS > Set-CIPPHideFromGAL -CustomerTenantID "contoso.onmicrosoft.com" -UserID "user1@example.com" -hidefromgal "true"
```
 #### EXAMPLE 2
```powershell
PS > Set-CIPPHideFromGAL -CustomerTenantID "contoso.onmicrosoft.com" -UserID "user2@example.com" -hidefromgal "false"
```

