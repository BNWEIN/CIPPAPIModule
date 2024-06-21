# Set-CIPPRevokeSessions
## SYNOPSIS
Revokes sessions for a specified user in the CIPP system.
## DESCRIPTION
The Set-CIPPRevokeSessions function revokes sessions for a specified user in the CIPP system. It sends a request to the CIPP API to revoke all active sessions for the specified user.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The ID of the customer tenant for which the sessions need to be revoked.

  ## **-UserID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The ID of the user for whom the sessions need to be revoked.

  ## **-UserName**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \


 #### EXAMPLE 1
```powershell
PS > Set-CIPPRevokeSessions -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" -UserID "281ceb6e-3d12-4a7f-b571-3c4f35ad85bc"
```

