# Add-CIPPSharedMailbox
## SYNOPSIS
Adds a shared mailbox to a specified tenant.
## DESCRIPTION
This function adds a shared mailbox to a specified tenant using the provided tenant ID, display name, domain, and username. Optionally, additional aliases can be added.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The ID of the customer tenant where the shared mailbox will be added. This parameter is mandatory. Either TenantID or Default domain can be used to identify the tenant.

  ## **-DisplayName**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The display name for the shared mailbox. This parameter is mandatory.

  ## **-Domain**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The domain for the shared mailbox. This parameter is mandatory.

  ## **-Username**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The username for the shared mailbox. This parameter is mandatory.

  ## **-AddedAliases**
> ![Foo](https://img.shields.io/badge/Type-Array-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
An array of additional aliases to be added to the shared mailbox. This parameter is optional.

 #### EXAMPLE 1
```powershell
PS > Add-CIPPSharedMailbox -CustomerTenantID "d6766bb9-44e0-4a4b-b8d0-3d9c4d1d15cc" -DisplayName "Support" -Domain "example.com" -Username "support"
```
 #### EXAMPLE 2
```powershell
PS > Add-CIPPSharedMailbox -CustomerTenantID "example.com" -DisplayName "Support" -Domain "example.com" -Username "support" -AddedAliases "itsupport@example.com"
```
 #### EXAMPLE 3
```powershell
PS > Add-CIPPSharedMailbox -CustomerTenantID "example.com" -DisplayName "Support" -Domain "example.com" -Username "support" -AddedAliases 'itsupport@example.com','helpdesk@example.com','sos@example.com'
```

