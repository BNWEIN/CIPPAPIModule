# Get-CIPPMailboxRules
## SYNOPSIS
Retrieves mailbox rules for a specified customer tenant ID.
## DESCRIPTION
The Get-CIPPMailboxRules function retrieves mailbox rules for a specified customer tenant ID by making a REST API call to the "/api/listmailboxrules" endpoint.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The customer tenant ID for which to retrieve mailbox rules.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPMailboxRules -CustomerTenantID "contoso.onmicrosoft.com"

This example retrieves mailbox rules for the customer tenant with the ID "contoso.onmicrosoft.com".
```

