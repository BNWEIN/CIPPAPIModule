# Get-CIPPBreachesAccount
## SYNOPSIS
Gets account breach information.
## DESCRIPTION
The Get-CIPPBreachesAccount function retrieves information about potential security breaches associated with accounts in CIPP.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the ID of the customer tenant where the operation will be performed. This parameter is mandatory for proper data isolation and multi-tenancy compliance.

  ## **-AccountOrDomain**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the account or domain to check for breaches.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPBreachesAccount -CustomerTenantID "12345678-1234-1234-1234-1234567890AB" -AccountOrDomain "user@contoso.com"
```
 #### EXAMPLE 2
```powershell
PS > Get-CIPPBreachesAccount -CustomerTenantID "12345678-1234-1234-1234-1234567890AB" -AccountOrDomain "contoso.com"
```

