# Set-CIPPEnableArchive
## SYNOPSIS
Enables email archiving for a specified user in the CIPP system.
## DESCRIPTION
The Set-CIPPEnableArchive function enables email archiving for a specified user in the CIPP system. It sends a request to the CIPP API to enable email archiving for the user identified by the provided CustomerTenantID and UserID.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The unique identifier of the customer tenant.

  ## **-UserID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The unique identifier of the user.

 #### EXAMPLE 1
```powershell
PS > Set-CIPPEnableArchive -CustomerTenantID "contoso.onmicrosoft.com" -UserID "user@domain.com"
```

