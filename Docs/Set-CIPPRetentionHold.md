# Set-CIPPRetentionHold
## SYNOPSIS
Sets the retention hold status for a mailbox.
## DESCRIPTION
The Set-CIPPRetentionHold function enables or disables retention hold for a specified mailbox in the customer's tenant. Retention hold prevents the Managed Folder Assistant from processing the mailbox, preserving retention policies during mailbox migrations or investigations. This is useful when you need to temporarily suspend retention policy processing.
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
Specifies whether to disable retention hold. If this switch is present, retention hold will be disabled. If not present, retention hold will be enabled. This parameter is optional.

 #### EXAMPLE 1
```powershell
PS > Set-CIPPRetentionHold -CustomerTenantID "contoso.onmicrosoft.com" -Identity "john.doe@contoso.com" -UserPrincipalName "john.doe@contoso.com"

Enables retention hold for john.doe@contoso.com's mailbox.
```
 #### EXAMPLE 2
```powershell
PS > Set-CIPPRetentionHold -CustomerTenantID "contoso.onmicrosoft.com" -Identity "jane.smith@contoso.com" -UserPrincipalName "jane.smith@contoso.com" -Disable

Disables retention hold for jane.smith@contoso.com's mailbox, allowing retention policies to be processed again.
```

