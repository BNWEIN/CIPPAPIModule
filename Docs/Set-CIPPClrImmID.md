# Set-CIPPClrImmID
## SYNOPSIS
Clears the Immutable ID for a user.
## DESCRIPTION
The Set-CIPPClrImmID function clears the Immutable ID for a user by invoking a REST API endpoint.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The ID of the customer tenant.

  ## **-UserID**
> ![Foo](https://img.shields.io/badge/Type-Guid-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The ID of the user.

 #### EXAMPLE 1
```powershell
PS > Set-CIPPClrImmID -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" -UserID "281ceb6e-3d12-4a7f-b571-3c4f35ad85bc"

This example clears the Immutable ID for the user with the specified CustomerTenantID and UserID.
```

