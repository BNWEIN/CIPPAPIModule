# Get-CIPPTransportRule
## SYNOPSIS
Gets Exchange transport rules.
## DESCRIPTION
The Get-CIPPTransportRule function retrieves all transport rules configured in Exchange Online for a tenant.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the ID of the customer tenant where the operation will be performed. This parameter is mandatory for proper data isolation and multi-tenancy compliance.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPTransportRule -CustomerTenantID "12345678-1234-1234-1234-1234567890AB"
```

