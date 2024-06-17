# Get-CIPPUserSignIns
## SYNOPSIS
Retrieves sign-in logs for a specific user in the CIPP system.
## DESCRIPTION
The Get-CIPPUserSignIns function retrieves the sign-in logs for a specific user in the CIPP system. It requires the customer tenant ID and the user ID as mandatory parameters.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The customer tenant ID associated with the user.

  ## **-UserID**
> ![Foo](https://img.shields.io/badge/Type-Guid-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The unique identifier of the user.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPUserSignIns -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" -UserID "281ceb6e-3d12-4a7f-b571-3c4f35ad85bc"
```

