# Set-CIPPLitigationHold
## SYNOPSIS
Sets the litigation hold status for a mailbox.
## DESCRIPTION
The Set-CIPPLitigationHold function enables or disables litigation hold for a specified mailbox in the customer's tenant. Litigation hold preserves all mailbox content, including deleted items and original versions of modified items. Optionally, you can specify a duration for the hold in days.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the customer tenant ID. This parameter is mandatory.

  ## **-Identity**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the identity of the mailbox (typically the GUID or primary SMTP address). This parameter is mandatory.

  ## **-UserPrincipalName**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the User Principal Name of the mailbox owner. This parameter is used for logging and display purposes. This parameter is mandatory.

  ## **-Disable**
> ![Foo](https://img.shields.io/badge/Type-SwitchParameter-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-False-Blue?color=5547a8)\
Specifies whether to disable litigation hold. If this switch is present, litigation hold will be disabled. If not present, litigation hold will be enabled. This parameter is optional.

  ## **-Days**
> ![Foo](https://img.shields.io/badge/Type-Int32-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-0-Blue?color=5547a8)\
Specifies the duration of the litigation hold in days. This parameter is only applicable when enabling litigation hold (Disable switch not present). If set to 0 or not specified, the hold will be indefinite. This parameter is optional.

 #### EXAMPLE 1
```powershell
PS > Set-CIPPLitigationHold -CustomerTenantID "contoso.onmicrosoft.com" -Identity "john.doe@contoso.com" -UserPrincipalName "john.doe@contoso.com"

Enables indefinite litigation hold for john.doe@contoso.com's mailbox.
```
 #### EXAMPLE 2
```powershell
PS > Set-CIPPLitigationHold -CustomerTenantID "contoso.onmicrosoft.com" -Identity "jane.smith@contoso.com" -UserPrincipalName "jane.smith@contoso.com" -Days 365

Enables litigation hold for jane.smith@contoso.com's mailbox for 365 days.
```
 #### EXAMPLE 3
```powershell
PS > Set-CIPPLitigationHold -CustomerTenantID "contoso.onmicrosoft.com" -Identity "bob.jones@contoso.com" -UserPrincipalName "bob.jones@contoso.com" -Disable

Disables litigation hold for bob.jones@contoso.com's mailbox.
```

