# Set-CIPPCAPolicy
## SYNOPSIS
Sets the Conditional Access (CA) Policy for a specific customer tenant.
## DESCRIPTION
The Set-CIPPCAPolicy function is used to set the Conditional Access (CA) Policy for a specific customer tenant. It allows you to enable or disable the CA Policy for the tenant.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the ID of the customer tenant for which the CA Policy needs to be set.

  ## **-State**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
Specifies the state of the CA Policy. Valid values are "Enabled" and "Disabled".

  ## **-Guid**
> ![Foo](https://img.shields.io/badge/Type-Guid-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the GUID of the CA Policy.

 #### EXAMPLE 1
```powershell
PS > Set-CIPPCAPolicy -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" -State "Enabled" -Guid "a1b2c3d4-e5f6-g7h8-i9j0-k1l2m3n4o5p6"
```
 #### EXAMPLE 2
```powershell
PS > Set-CIPPCAPolicy -CustomerTenantID "contoso.onmicrosoft.com" -State "Enabled" -Guid "a1b2c3d4-e5f6-g7h8-i9j0-k1l2m3n4o5p6"
```

