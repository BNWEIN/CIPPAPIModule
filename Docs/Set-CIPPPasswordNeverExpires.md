# Set-CIPPPasswordNeverExpires
## SYNOPSIS
Sets the password expiration policy for a specified user.
## DESCRIPTION
The Set-CIPPPasswordNeverExpires function configures the password policy for a specified user in the customer's tenant. This function allows you to set whether the user's password expires or never expires by modifying the user's password policies in Azure Active Directory.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the customer tenant ID. This parameter is mandatory.

  ## **-UserId**
> ![Foo](https://img.shields.io/badge/Type-Guid-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the unique identifier (GUID) of the user. This parameter is mandatory.

  ## **-UserPrincipalName**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
Specifies the User Principal Name of the user. This parameter is used for logging and display purposes.

  ## **-PasswordPolicy**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the password policy to apply. Valid values are 'DisablePasswordExpiration' (password never expires), 'None' (password expires according to tenant policy). This parameter is mandatory.

 #### EXAMPLE 1
```powershell
PS > Set-CIPPPasswordNeverExpires -CustomerTenantID "contoso.onmicrosoft.com" -UserId "12345678-1234-1234-1234-123456789abc" -UserPrincipalName "john.doe@contoso.com" -PasswordPolicy "DisablePasswordExpiration"

Sets the password policy for john.doe@contoso.com to never expire.
```
 #### EXAMPLE 2
```powershell
PS > Set-CIPPPasswordNeverExpires -CustomerTenantID "contoso.onmicrosoft.com" -UserId "12345678-1234-1234-1234-123456789abc" -UserPrincipalName "jane.smith@contoso.com" -PasswordPolicy "None"

Sets the password policy for jane.smith@contoso.com to expire according to the tenant's default policy.
```

