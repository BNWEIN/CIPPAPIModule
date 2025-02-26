# Get-CIPPAppStatus
## SYNOPSIS
Gets application deployment status.
## DESCRIPTION
The Get-CIPPAppStatus function retrieves the status of application deployments in CIPP.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the ID of the customer tenant where the operation will be performed. This parameter is mandatory for proper data isolation and multi-tenancy compliance.

  ## **-AppFilter**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \


 #### EXAMPLE 1
```powershell
PS > Get-CIPPAppStatus -CustomerTenantID "12345678-1234-1234-1234-1234567890AB"
```

