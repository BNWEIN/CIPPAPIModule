# Start-CIPPManagedFolderAssistant
## SYNOPSIS
Starts the Managed Folder Assistant for a mailbox.
## DESCRIPTION
The Start-CIPPManagedFolderAssistant function starts a Managed Folder Assistant process for a specified mailbox 
in Exchange Online. This can be used to process retention policies and tags.
# PARAMETERS

## **-Identity**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The identity of the mailbox for which to start the Managed Folder Assistant. This can be the primary SMTP address  or any other Exchange identity format.

  ## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The tenant ID where the mailbox resides. This is required to identify the correct Exchange Online environment.

 #### EXAMPLE 1
```powershell
PS > Start-CIPPManagedFolderAssistant -Identity "user@contoso.com" -CustomerTenantID "tenant-id"
```

