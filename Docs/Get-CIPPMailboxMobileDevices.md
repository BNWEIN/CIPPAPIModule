# Get-CIPPMailboxMobileDevices
## SYNOPSIS
Retrieves the mobile devices associated with a mailbox.
## DESCRIPTION
The Get-CIPPMailboxMobileDevices function retrieves the mobile devices associated with a mailbox in the CIPP system. It makes use of the Invoke-CIPPRestMethod function to send a request to the CIPP API and retrieve the mobile devices.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the ID of the customer tenant.

  ## **-Mailbox**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the mailbox for which to retrieve the mobile devices.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPMailboxMobileDevices -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" -Mailbox "user@example.com"
```

