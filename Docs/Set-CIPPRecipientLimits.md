# Set-CIPPRecipientLimits
## SYNOPSIS
Sets the recipient limits for a mailbox.
## DESCRIPTION
The Set-CIPPRecipientLimits function configures the maximum number of recipients that can be addressed in a single email message for a specified mailbox in the customer's tenant. This helps prevent spam and accidental mass mailings by limiting the number of recipients per message.
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

  ## **-RecipientLimit**
> ![Foo](https://img.shields.io/badge/Type-Int32-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) ![Foo](https://img.shields.io/badge/DefaultValue-0-Blue?color=5547a8)\
Specifies the maximum number of recipients allowed per message. Valid range is typically 1 to 1000. This parameter is mandatory.

 #### EXAMPLE 1
```powershell
PS > Set-CIPPRecipientLimits -CustomerTenantID "contoso.onmicrosoft.com" -Identity "john.doe@contoso.com" -UserPrincipalName "john.doe@contoso.com" -RecipientLimit 500

Sets the recipient limit to 500 recipients per message for john.doe@contoso.com's mailbox.
```
 #### EXAMPLE 2
```powershell
PS > Set-CIPPRecipientLimits -CustomerTenantID "contoso.onmicrosoft.com" -Identity "jane.smith@contoso.com" -UserPrincipalName "jane.smith@contoso.com" -RecipientLimit 100

Sets the recipient limit to 100 recipients per message for jane.smith@contoso.com's mailbox.
```

