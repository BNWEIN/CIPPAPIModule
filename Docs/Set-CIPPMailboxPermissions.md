# Set-CIPPMailboxPermissions
## SYNOPSIS
Sets mailbox permissions for a user in the CIPP system.
## DESCRIPTION
The Set-CIPPMailboxPermissions function is used to edit mailbox permissions for a specified user in the CIPP system. It allows you to add or remove full access, send as, and send on behalf permissions for the user's mailbox.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The ID of the customer's tenant in the CIPP system.

  ## **-Userid**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The ID of the user whose mailbox permissions need to be edited.

  ## **-RemoveFullAccess**
> ![Foo](https://img.shields.io/badge/Type-Array-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-@()-Blue?color=5547a8)\
An optional array of mailboxes from which to remove full access permissions for the user.

  ## **-AddFullAccessAutoMap**
> ![Foo](https://img.shields.io/badge/Type-Array-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-@()-Blue?color=5547a8)\
An optional array of mailboxes to which to add full access permissions with automapping enabled for the user.

  ## **-AddFullAccessNoAutoMap**
> ![Foo](https://img.shields.io/badge/Type-Array-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-@()-Blue?color=5547a8)\
An optional array of mailboxes to which to add full access permissions with automapping disabled for the user.

  ## **-AddSendAs**
> ![Foo](https://img.shields.io/badge/Type-Array-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-@()-Blue?color=5547a8)\
An optional array of mailboxes to which to add send as permissions for the user.

  ## **-RemoveSendAs**
> ![Foo](https://img.shields.io/badge/Type-Array-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-@()-Blue?color=5547a8)\
An optional array of mailboxes from which to remove send as permissions for the user.

  ## **-AddSendOnBehalf**
> ![Foo](https://img.shields.io/badge/Type-Array-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-@()-Blue?color=5547a8)\
An optional array of mailboxes to which to add send on behalf permissions for the user.

  ## **-RemoveSendOnBehalf**
> ![Foo](https://img.shields.io/badge/Type-Array-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-@()-Blue?color=5547a8)\
An optional array of mailboxes from which to remove send on behalf permissions for the user.

 #### EXAMPLE 1
```powershell
PS > Set-CIPPMailboxPermissions -CustomerTenantID "contoso.onmicrosoft.com" -Userid "john.doe@example.com" -AddFullAccessAutoMap "mailbox1@example.com", "mailbox2@example.com" -AddSendAs "mailbox3@example.com"

This example sets mailbox permissions for the user "john.doe@example.com" in the CIPP system. It adds full access permissions with automapping enabled to "mailbox1@example.com" and "mailbox2@example.com", and adds send as permissions to "mailbox3@example.com".
```

