# Convert-CIPPMailbox
## SYNOPSIS
Converts a mailbox to a different type in the CIPP system.
## DESCRIPTION
The Convert-CIPPMailbox function converts a mailbox to one of the following types:
- Shared mailbox
- Regular user mailbox
- Room mailbox
- Equipment mailbox
It sends a request to the CIPP API to perform the conversion.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The ID of the customer tenant where the mailbox belongs.

  ## **-UserID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The ID of the user whose mailbox needs to be converted.

  ## **-Username**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
Optional. The username associated with the mailbox.

  ## **-MailboxType**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The type to convert the mailbox to. Valid values are: - Shared: Convert to shared mailbox - Regular: Convert to regular user mailbox - Room: Convert to room mailbox - Equipment: Convert to equipment mailbox

 #### EXAMPLE 1
```powershell
PS > Convert-CIPPMailbox -CustomerTenantID "contoso.onmicrosoft.com" -UserID "user@domain.com" -MailboxType "Shared"
```
 #### EXAMPLE 2
```powershell
PS > Convert-CIPPMailbox -CustomerTenantID "contoso.onmicrosoft.com" -UserID "user@domain.com" -MailboxType "Regular"
```
 #### EXAMPLE 3
```powershell
PS > Convert-CIPPMailbox -CustomerTenantID "contoso.onmicrosoft.com" -UserID "room@domain.com" -MailboxType "Room"
```

