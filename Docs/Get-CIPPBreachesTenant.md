# Get-CIPPBreachesTenant
## SYNOPSIS
Gets tenant-wide breach information.
## DESCRIPTION
The Get-CIPPBreachesTenant function retrieves information about potential security breaches across the entire tenant in CIPP.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the ID of the customer tenant where the operation will be performed. This parameter is mandatory for proper data isolation and multi-tenancy compliance.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPBreachesTenant -CustomerTenantID "12345678-1234-1234-1234-1234567890AB"
```

