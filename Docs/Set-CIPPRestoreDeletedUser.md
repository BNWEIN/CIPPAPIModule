# Set-CIPPRestoreDeletedUser
## SYNOPSIS
Restores a deleted user in the CIPP system.
## DESCRIPTION
The Set-CIPPRestoreDeletedUser function restores a deleted user in the CIPP (Customer Identity and Privacy Platform) system. It sends a request to the CIPP API to restore the user with the specified ID.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The ID of the customer tenant in which the user is being restored.

  ## **-ID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The ID of the user to be restored.

 #### EXAMPLE 1
```powershell
PS > Set-CIPPRestoreDeletedUser -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" -ID "32a411a8-65ad-4358-ac14-5027d9abea9a"
```

