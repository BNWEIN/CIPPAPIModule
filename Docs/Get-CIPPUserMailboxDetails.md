# Get-CIPPUserMailboxDetails
## SYNOPSIS
Retrieves the mailbox details for a specific user in the CIPP system.
## DESCRIPTION
The Get-CIPPUserMailboxDetails function retrieves the mailbox details for a specific user in the CIPP system. It makes an API call to the "/api/listusermailboxdetails" endpoint, passing the customer tenant ID and user ID as parameters.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The ID of the customer tenant for which to retrieve the mailbox details.

  ## **-UserID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The ID of the user for which to retrieve the mailbox details.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPUserMailboxDetails -CustomerTenantID "contoso.onmicrosoft.com" -UserID "user@domain.com"
```

