# Get-CIPPMailboxPermissions
## SYNOPSIS
Retrieves mailbox permissions for a specified customer tenant and user ID.
## DESCRIPTION
The Get-CIPPMailboxPermissions function retrieves mailbox permissions for a specified customer tenant and user ID. It makes an API call to the "/api/listmailboxpermissions" endpoint with the provided parameters.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The ID of the customer tenant for which mailbox permissions are to be retrieved. This parameter is mandatory.

  ## **-UserID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The ID of the user for which mailbox permissions are to be retrieved. This parameter is mandatory.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPMailboxPermissions -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" -UserID "user1@domain.com"

This example retrieves mailbox permissions for the customer tenant with ID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" and the user with ID "user1@domain.com".
```

