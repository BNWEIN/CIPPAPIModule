# Set-CIPPMailboxLocale
## SYNOPSIS
Sets the language and regional settings (locale) for a mailbox.
## DESCRIPTION
The Set-CIPPMailboxLocale function configures the language and regional settings (locale) for a specified mailbox in the customer's tenant. This affects the language used in Outlook Web App, date and time formats, and other regional settings for the mailbox.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the customer tenant ID. This parameter is mandatory.

  ## **-UserPrincipalName**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the User Principal Name of the mailbox owner. This parameter is mandatory.

  ## **-Locale**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the locale/language code to set (e.g., "en-US" for English (United States), "fr-FR" for French (France), "de-DE" for German (Germany)). This parameter is mandatory.

 #### EXAMPLE 1
```powershell
PS > Set-CIPPMailboxLocale -CustomerTenantID "contoso.onmicrosoft.com" -UserPrincipalName "john.doe@contoso.com" -Locale "en-US"

Sets the mailbox locale to English (United States) for john.doe@contoso.com.
```
 #### EXAMPLE 2
```powershell
PS > Set-CIPPMailboxLocale -CustomerTenantID "contoso.onmicrosoft.com" -UserPrincipalName "jean.dupont@contoso.com" -Locale "fr-FR"

Sets the mailbox locale to French (France) for jean.dupont@contoso.com.
```

