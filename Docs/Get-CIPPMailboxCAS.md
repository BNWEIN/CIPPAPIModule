# Get-CIPPMailboxCAS
## SYNOPSIS
Retrieves the Mailbox Client Access Settings for a specific customer tenant.
## DESCRIPTION
The Get-CIPPMailboxCAS function retrieves the Mailbox Client Access Settings for a specified customer tenant ID. It makes use of the Invoke-CIPPRestMethod function to send a request to the '/api/listmailboxcas' endpoint and returns the results.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the ID of the customer tenant for which to retrieve the Mailbox Client Access Settings. This parameter is mandatory.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPMailboxCAS -CustomerTenantID "d25d58b0-7f7e-4b81-af6c-b5e6451dafcc"
```

