# Get-CIPPMailboxes
## SYNOPSIS
Retrieves a list of mailboxes for a specific customer tenant.
## DESCRIPTION
The Get-CIPPMailboxes function retrieves a list of mailboxes for a specific customer tenant by making a REST API call to the "/api/ListMailboxes" endpoint.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The ID of the customer tenant for which to retrieve the mailbox list.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPMailboxes -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778"
```

