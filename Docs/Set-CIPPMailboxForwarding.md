# Set-CIPPMailboxForwarding
## SYNOPSIS
Sets mailbox forwarding for a user.
## DESCRIPTION
The Set-CIPPMailboxForwarding function sets mailbox forwarding for a user. It allows you to specify the customer tenant ID, user ID, and various forwarding options such as external and internal email addresses, disabling forwarding, and keeping a copy of forwarded emails.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The ID of the customer tenant.

  ## **-UserID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The ID of the user whose mailbox forwarding needs to be set.

  ## **-DisableForwarding**
> ![Foo](https://img.shields.io/badge/Type-Boolean-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-False-Blue?color=5547a8)\
Specifies whether to disable mailbox forwarding. By default, it is set to $false.

  ## **-ForwardExternalEmailAddress**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
The external email address to forward emails to.

  ## **-ForwardInternalEmailAddress**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
The internal email address to forward emails to. This parameter accepts an array of email addresses.

  ## **-KeepCopy**
> ![Foo](https://img.shields.io/badge/Type-Boolean-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-False-Blue?color=5547a8)\
Specifies whether to keep a copy of forwarded emails. By default, it is set to $false.

 #### EXAMPLE 1
```powershell
PS > Set-CIPPMailboxForwarding -CustomerTenantID "contoso.onmicrosoft.com" -UserID "john.doe@contoso.onmicrosoft.com" -ForwardExternalEmailAddress "john.doe@example.com" -KeepCopy $true
```

