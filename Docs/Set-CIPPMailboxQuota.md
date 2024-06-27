# Set-CIPPMailboxQuota
## SYNOPSIS
Sets the mailbox quota for a user
## DESCRIPTION
The Set-CIPPMailboxQuota function is used to set the mailbox quota for a user. It allows you to specify the customer tenant ID, user ID, and the mailbox quota limits such as ProhibitSendQuota, IssueWarningQuota, and ProhibitSendReceiveQuota.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The ID of the customer tenant.

  ## **-UserID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The ID of the user.

  ## **-ProhibitSendQuota**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
The maximum mailbox size (in MB, GB or TB) at which sending messages is prohibited.

  ## **-IssueWarningQuota**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
The mailbox size (in MB, GB or TB) at which a warning is issued to the user.

  ## **-ProhibitSendReceiveQuota**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
The maximum mailbox size (in MB, GB or TB) at which sending and receiving messages is prohibited.

 #### EXAMPLE 1
```powershell
PS > Set-CIPPMailboxQuota -CustomerTenantID "contoso.onmicrosoft.com" -UserID "john.doe@contoso.com" -ProhibitSendQuota "1GB"
```
 #### EXAMPLE 2
```powershell
PS > Set-CIPPMailboxQuota -CustomerTenantID "contoso.onmicrosoft.com" -UserID "john.doe@contoso.com" -ProhibitSendReceiveQuota "5GB"
```

