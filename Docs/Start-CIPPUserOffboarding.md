# Start-CIPPUserOffboarding
## SYNOPSIS
Starts an offboarding job for a user in the specified tenant.
## DESCRIPTION
The Start-CIPPOffboardingJob function initiates the offboarding process for a user, handling various cleanup tasks like removing licenses and revoking sessions.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The ID of the customer tenant. If not provided, the default tenant is used.

  ## **-UserID**
> ![Foo](https://img.shields.io/badge/Type-Guid-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The ID of the user to be offboarded.

  ## **-ConvertToSharedMailbox**
> ![Foo](https://img.shields.io/badge/Type-SwitchParameter-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-False-Blue?color=5547a8)\


  ## **-HideFromGAL**
> ![Foo](https://img.shields.io/badge/Type-SwitchParameter-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-False-Blue?color=5547a8)\
Hide the user from the Global Address List.

  ## **-RemoveCalendarInvites**
> ![Foo](https://img.shields.io/badge/Type-SwitchParameter-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-False-Blue?color=5547a8)\
Remove all calendar invites for the user.

  ## **-RemovePermissions**
> ![Foo](https://img.shields.io/badge/Type-SwitchParameter-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-False-Blue?color=5547a8)\
Remove all mailbox permissions.

  ## **-RemoveRules**
> ![Foo](https://img.shields.io/badge/Type-SwitchParameter-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-False-Blue?color=5547a8)\
Remove all mailbox rules.

  ## **-RemoveMobileDevices**
> ![Foo](https://img.shields.io/badge/Type-SwitchParameter-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-False-Blue?color=5547a8)\


  ## **-RemoveGroups**
> ![Foo](https://img.shields.io/badge/Type-SwitchParameter-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-False-Blue?color=5547a8)\
Remove the user from all groups.

  ## **-RemoveLicenses**
> ![Foo](https://img.shields.io/badge/Type-SwitchParameter-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-False-Blue?color=5547a8)\
Remove all licenses assigned to the user.

  ## **-RevokeSessions**
> ![Foo](https://img.shields.io/badge/Type-SwitchParameter-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-False-Blue?color=5547a8)\
Revoke all active sessions for the user.

  ## **-DisableSignIn**
> ![Foo](https://img.shields.io/badge/Type-SwitchParameter-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-False-Blue?color=5547a8)\
Disable the user's sign-in capability.

  ## **-ClearImmutableId**
> ![Foo](https://img.shields.io/badge/Type-SwitchParameter-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-False-Blue?color=5547a8)\
Clear the immutable ID for the user.

  ## **-ResetPass**
> ![Foo](https://img.shields.io/badge/Type-SwitchParameter-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-False-Blue?color=5547a8)\
Reset the user's password.

  ## **-RemoveMFADevices**
> ![Foo](https://img.shields.io/badge/Type-SwitchParameter-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-False-Blue?color=5547a8)\
Remove all MFA devices associated with the user.

  ## **-DeleteUser**
> ![Foo](https://img.shields.io/badge/Type-SwitchParameter-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-False-Blue?color=5547a8)\
Delete the user account.

  ## **-OnedriveAccess**
> ![Foo](https://img.shields.io/badge/Type-String[]-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
Grant OneDrive access to specified users.

  ## **-FullAccessNoAutomap**
> ![Foo](https://img.shields.io/badge/Type-String[]-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \


  ## **-FullAccessAutomap**
> ![Foo](https://img.shields.io/badge/Type-String[]-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \


  ## **-OutOfOffice**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \


  ## **-ForwardTo**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \


  ## **-KeepCopy**
> ![Foo](https://img.shields.io/badge/Type-SwitchParameter-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-False-Blue?color=5547a8)\


 #### EXAMPLE 1
```powershell
PS > Start-CIPPOffboardingJob -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" -UserID "98765432-1234-5678-9012-34567890ABCD" -RevokeSessions -RemoveGroups -DeleteUser
```

