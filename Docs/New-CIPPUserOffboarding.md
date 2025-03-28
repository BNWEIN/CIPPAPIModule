# New-CIPPUserOffboarding
## SYNOPSIS
Offboards a user from a specified customer tenant.
## DESCRIPTION
The New-CIPPUserOffboarding function automates the offboarding process for a user in a specified customer tenant. 
It provides various options to customize the offboarding process, including forwarding emails, converting the mailbox 
to a shared mailbox, disabling sign-in, removing licenses, and more. It is also possible to schedule the offboarding for a later date.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The ID of the customer tenant from which the user is being offboarded. This parameter is mandatory.

  ## **-User**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The username of the user being offboarded. UserPrincipalName(UPN) should be used. This parameter is mandatory.

  ## **-OutOfOffice**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
Sets an out-of-office message for the user. This parameter is optional.

  ## **-ForwardTo**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
Forwards the user's emails to another address. This parameter is optional.

  ## **-ForwardKeepCopyInMailbox**
> ![Foo](https://img.shields.io/badge/Type-SwitchParameter-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-False-Blue?color=5547a8)\
Keeps a copy of forwarded emails in the user's mailbox. This parameter is optional.

  ## **-OnedriveAccessTo**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
Grants access to the user's OneDrive to another user. UserPrincipalName(UPN) should be used. This parameter is optional.

  ## **-MailboxAccessNoAutomap**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
Grants access to the user's mailbox without automapping. UserPrincipalName(UPN) should be used. This parameter is optional.

  ## **-MailboxAccessAutomap**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
Grants access to the user's mailbox with automapping. UserPrincipalName(UPN) should be used. This parameter is optional.

  ## **-ConvertToSharedMailbox**
> ![Foo](https://img.shields.io/badge/Type-SwitchParameter-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-False-Blue?color=5547a8)\
Converts the user's mailbox to a shared mailbox. This parameter is optional.

  ## **-HideFromGAL**
> ![Foo](https://img.shields.io/badge/Type-SwitchParameter-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-False-Blue?color=5547a8)\
Hides the user from the Global Address List (GAL). This parameter is optional.

  ## **-DisableSignIn**
> ![Foo](https://img.shields.io/badge/Type-SwitchParameter-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-False-Blue?color=5547a8)\
Disables sign-in for the user. This parameter is optional.

  ## **-DeleteUser**
> ![Foo](https://img.shields.io/badge/Type-SwitchParameter-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-False-Blue?color=5547a8)\
Deletes the user account. This parameter is optional.

  ## **-RemoveFromAllGroups**
> ![Foo](https://img.shields.io/badge/Type-SwitchParameter-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-False-Blue?color=5547a8)\
Removes the user from all groups. This parameter is optional.

  ## **-CancelAllCalendarInvites**
> ![Foo](https://img.shields.io/badge/Type-SwitchParameter-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-False-Blue?color=5547a8)\
Cancels all calendar invites for the user. This parameter is optional.

  ## **-RemoveAllLicenses**
> ![Foo](https://img.shields.io/badge/Type-SwitchParameter-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-False-Blue?color=5547a8)\
Removes all licenses assigned to the user. This parameter is optional.

  ## **-ResetPassword**
> ![Foo](https://img.shields.io/badge/Type-SwitchParameter-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-False-Blue?color=5547a8)\
Resets the user's password. This parameter is optional.

  ## **-ClearImmutableId**
> ![Foo](https://img.shields.io/badge/Type-SwitchParameter-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-False-Blue?color=5547a8)\


  ## **-RemoveMFADevices**
> ![Foo](https://img.shields.io/badge/Type-SwitchParameter-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-False-Blue?color=5547a8)\


  ## **-RevokeAllSessions**
> ![Foo](https://img.shields.io/badge/Type-SwitchParameter-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-False-Blue?color=5547a8)\
Revokes all active sessions for the user. This parameter is optional.

  ## **-RemoveAllMailboxRules**
> ![Foo](https://img.shields.io/badge/Type-SwitchParameter-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-False-Blue?color=5547a8)\
Removes all mailbox rules for the user. This parameter is optional.

  ## **-RemoveAllMobileDevices**
> ![Foo](https://img.shields.io/badge/Type-SwitchParameter-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-False-Blue?color=5547a8)\
Removes all mobile devices associated with the user. This parameter is optional.

  ## **-RemoveAllMailboxPermissions**
> ![Foo](https://img.shields.io/badge/Type-SwitchParameter-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-False-Blue?color=5547a8)\
Removes all mailbox permissions for the user. This parameter is optional.

  ## **-ScheduledFor**
> ![Foo](https://img.shields.io/badge/Type-DateTime-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
Specifies the date and time when the user should be added. If not specified, the user will be offboarded immediately. Input should be a valid datetime object. Will be converted to Unix time. This parameter is optional.

  ## **-SendResultsToEmail**
> ![Foo](https://img.shields.io/badge/Type-SwitchParameter-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-False-Blue?color=5547a8)\
Specifies whether to send the results of the scheduled task to the email address specified in the notification settings of your CIPP instance. This parameter is optional.

  ## **-SendResultsToPSA**
> ![Foo](https://img.shields.io/badge/Type-SwitchParameter-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-False-Blue?color=5547a8)\
Specifies whether to send the results of the scheduled task to the PSA system specified in the notification settings of your CIPP instance. This parameter is optional.

  ## **-SendResultsToWebhook**
> ![Foo](https://img.shields.io/badge/Type-SwitchParameter-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-False-Blue?color=5547a8)\
Specifies whether to send the results of the scheduled task to the webhook specified in the notification settings of your CIPP instance. This parameter is optional.

 #### EXAMPLE 1
```powershell
PS > New-CIPPUserOffboarding -CustomerTenantID "8ad00f9e-1953-47d1-897b-8fec4138cde7" -User "jdoe@domain.com" -DisableSignIn -RemoveAllLicenses -ConvertToSharedMailbox

This example immediately offboards the user "jdoe@domain.com" from the customer tenant with ID "8ad00f9e-1953-47d1-897b-8fec4138cde7", disables sign-in, removes all licenses, and converts the user's mailbox to a shared mailbox.
```
 #### EXAMPLE 2
```powershell
PS > New-CIPPUserOffboarding -CustomerTenantID "8ad00f9e-1953-47d1-897b-8fec4138cde7" -User "jane.doe@domain.com" -DeleteUser -ScheduledFor ((Get-Date).AddDays(7)) -SendResultsToEmail

This example schedules the offboarding of the user "jane.doe@domain.com" from the customer tenant with ID "8ad00f9e-1953-47d1-897b-8fec4138cde7" for 7 days from the current date.
The results of the scheduled task will be sent to the email address specified in the notification settings of your CIPP instance.
```

