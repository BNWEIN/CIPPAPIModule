# Get-CIPPMailboxStatistics
## SYNOPSIS
Retrieves mailbox statistics for a specified customer tenant ID.
## DESCRIPTION
The Get-CIPPMailboxStatistics function retrieves mailbox statistics for a specified customer tenant ID by making a REST API call to the "/api/listmailboxstatistics" endpoint.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the customer tenant ID for which mailbox statistics need to be retrieved.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPMailboxStatistics -CustomerTenantID "contoso.onmicrosoft.com"
```

