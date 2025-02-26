# Get-CIPPTenantAllowBlockList
## SYNOPSIS
Gets tenant allow/block list items.
## DESCRIPTION
The Get-CIPPTenantAllowBlockList function retrieves all allow/block list items for a tenant, including senders, URLs, and file hashes.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the ID of the customer tenant where the operation will be performed. This parameter is mandatory for proper data isolation and multi-tenancy compliance.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPTenantAllowBlockList -CustomerTenantID "12345678-1234-1234-1234-1234567890AB"
```

