# Get-CIPPMailboxRestores
## SYNOPSIS
Retrieves mailbox restores for a specified customer tenant.
## DESCRIPTION
The Get-CIPPMailboxRestores function retrieves mailbox restores for a specified customer tenant in the CIPP project. It uses the Invoke-CIPPRestMethod function to make a REST API call to the "/api/listmailboxrestores" endpoint.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the ID of the customer tenant for which mailbox restores should be retrieved. This parameter is mandatory.

  ## **-Identity**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
Specifies the identity of the mailbox for which restores should be retrieved. This parameter is optional.

  ## **-Includereport**
> ![Foo](https://img.shields.io/badge/Type-SwitchParameter-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-False-Blue?color=5547a8)\
Indicates whether to include the restore report in the results. This parameter is optional.

  ## **-Statistics**
> ![Foo](https://img.shields.io/badge/Type-SwitchParameter-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-False-Blue?color=5547a8)\
Indicates whether to include statistics about the restores in the results. This parameter is optional.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPMailboxRestores -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" -Identity "281ceb6e-3d12-4a7f-b571-3c4f35ad85bc" -Includereport -Statistics
```

