# Remove-CIPPTenantAllowBlockList
## SYNOPSIS
Removes entries from a tenant's allow/block list.
## DESCRIPTION
The Remove-CIPPTenantAllowBlockList function removes specified entries from a tenant's allow/block list in CIPP.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the ID of the customer tenant where the operation will be performed. This parameter is mandatory for proper data isolation and multi-tenancy compliance.

  ## **-Entries**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \


  ## **-ListType**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \


 #### EXAMPLE 1
```powershell
PS > Remove-CIPPTenantAllowBlockList -CustomerTenantID "12345678-1234-1234-1234-1234567890AB" -EntryId "98765432-4321-4321-4321-BA0987654321"
```

