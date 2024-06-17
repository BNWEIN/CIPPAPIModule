# Get-CIPPUserMailboxRules
## SYNOPSIS
Retrieves the mailbox rules for a specific user in the CIPP system.
## DESCRIPTION
The Get-CIPPUserMailboxRules function retrieves the mailbox rules for a specific user in the CIPP system. It makes an API call to the "/api/listusermailboxrules" endpoint, passing the customer tenant ID and user ID as parameters.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The ID of the customer tenant.

  ## **-UserID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The ID of the user.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPUserMailboxRules -CustomerTenantID "contoso.onmicrosoft.com" -UserID "user@domain.com"
```

