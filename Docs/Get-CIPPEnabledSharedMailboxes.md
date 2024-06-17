# Get-CIPPEnabledSharedMailboxes
## SYNOPSIS
Retrieves shared mailboxes with account enabled for a specific customer tenant ID.
## DESCRIPTION
The Get-CIPPEnabledSharedMailboxes function retrieves shared mailboxes with account enabled for a specific customer tenant ID. It makes use of the Invoke-CIPPRestMethod function to send a request to the CIPP API and retrieve the shared mailboxes.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the customer tenant ID for which to retrieve the shared mailboxes.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPEnabledSharedMailboxes -CustomerTenantID "contoso.onmicrosoft.com"
```

