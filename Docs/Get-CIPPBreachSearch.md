# Get-CIPPBreachSearch
## SYNOPSIS
Searches for security breaches.
## DESCRIPTION
The Get-CIPPBreachSearch function executes a search for security breaches in the CIPP system.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the ID of the customer tenant where the operation will be performed. This parameter is mandatory for proper data isolation and multi-tenancy compliance.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPBreachSearch -CustomerTenantID "12345678-1234-1234-1234-1234567890AB"
```

