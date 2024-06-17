# Set-CIPPConvertMailbox
## SYNOPSIS
Converts a mailbox to a shared mailbox or user mailbox in the CIPP system.
## DESCRIPTION
The Set-CIPPConvertMailbox function is used to convert a mailbox in the CIPP system to either a shared mailbox or a user mailbox. It sends a request to the CIPP API to perform the conversion.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The ID of the customer tenant where the mailbox belongs.

  ## **-UserID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The ID of the user whose mailbox needs to be converted.

  ## **-ConvertToUserMailbox**
> ![Foo](https://img.shields.io/badge/Type-SwitchParameter-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-False-Blue?color=5547a8)\
Specifies whether the mailbox should be converted to a user mailbox. If this switch is provided, the mailbox will be converted to a user mailbox. If not provided, the mailbox will be converted to a shared mailbox.

 #### EXAMPLE 1
```powershell
PS > Set-CIPPConvertMailbox -CustomerTenantID "contoso.onmicrosoft.com" -UserID "user@domain.com" -ConvertToUserMailbox
```
 #### EXAMPLE 2
```powershell
PS > Set-CIPPConvertMailbox -CustomerTenantID "contoso.onmicrosoft.com" -UserID "user@domain.com"
```

