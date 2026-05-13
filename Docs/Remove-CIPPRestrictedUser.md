# Remove-CIPPRestrictedUser
## SYNOPSIS
Removes a user from the restricted senders list in Exchange Online.
## DESCRIPTION
The Remove-CIPPRestrictedUser function removes a specified sender address from the restricted users list in Exchange Online. When users are added to the restricted list (typically due to suspected compromise or spam), they cannot send email. This function removes that restriction, allowing the user to send email again.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the customer tenant ID. This parameter is mandatory.

  ## **-SenderAddress**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the email address of the restricted sender to remove from the restricted list. This parameter is mandatory.

 #### EXAMPLE 1
```powershell
PS > Remove-CIPPRestrictedUser -CustomerTenantID "contoso.onmicrosoft.com" -SenderAddress "john.doe@contoso.com"

Removes john.doe@contoso.com from the restricted senders list, allowing them to send email again.
```
 #### EXAMPLE 2
```powershell
PS > Remove-CIPPRestrictedUser -CustomerTenantID "7a90b7e8-5f9a-4c3d-8b2e-1a3f5c7d9e2b" -SenderAddress "compromised.user@contoso.com"

Removes compromised.user@contoso.com from the restricted senders list after remediation.
```

