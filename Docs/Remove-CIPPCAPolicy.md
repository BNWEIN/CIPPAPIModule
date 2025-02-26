# Remove-CIPPCAPolicy
## SYNOPSIS
Removes a Conditional Access Policy from a tenant.
## DESCRIPTION
The Remove-CIPPCAPolicy function removes a specified Conditional Access Policy from a tenant in CIPP.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the ID of the customer tenant where the Conditional Access Policy will be removed.

  ## **-PolicyId**
> ![Foo](https://img.shields.io/badge/Type-Guid-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the ID of the Conditional Access Policy to remove.

 #### EXAMPLE 1
```powershell
PS > Remove-CIPPCAPolicy -CustomerTenantID "12345678-1234-1234-1234-1234567890AB" -PolicyId "98765432-4321-4321-4321-BA0987654321"
```

