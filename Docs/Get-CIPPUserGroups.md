# Get-CIPPUserGroups
## SYNOPSIS
Retrieves the groups that a user belongs to.
## DESCRIPTION
The Get-CIPPUserGroups function retrieves the groups that a user belongs to based on the provided CustomerTenantID and UserID.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The ID of the customer tenant.

  ## **-UserID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The ID of the user.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPUserGroups -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" -UserID "user@domain.com"
```

