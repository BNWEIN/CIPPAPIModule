# Start-CIPPManagedFolderAssistant
## SYNOPSIS
Starts the Managed Folder Assistant for a mailbox.
## DESCRIPTION
The Start-CIPPManagedFolderAssistant function starts a Managed Folder Assistant process for a specified mailbox
in Exchange Online. This can be used to process retention policies and tags. The function supports identifying
the mailbox either by its Exchange identity (like SMTP address) or by UserPrincipalName.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The tenant ID where the mailbox resides. This is required to identify the correct Exchange Online environment.

  ## **-Identity**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The identity of the mailbox for which to start the Managed Folder Assistant. This can be the primary SMTP address or any other Exchange identity format. This parameter is part of the Identity parameter set.

  ## **-UserPrincipalName**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The UserPrincipalName of the mailbox user. This parameter is part of the UPN parameter set.

 #### EXAMPLE 1
```powershell
PS > Start-CIPPManagedFolderAssistant -Identity "user@contoso.com" -CustomerTenantID "tenant-id"
```
 #### EXAMPLE 2
```powershell
PS > Start-CIPPManagedFolderAssistant -UserPrincipalName "user@contoso.com" -CustomerTenantID "tenant-id"
```

