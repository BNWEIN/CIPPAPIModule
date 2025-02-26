# Get-CIPPTeamsLisLocation
## SYNOPSIS
Gets Teams LIS locations.
## DESCRIPTION
The Get-CIPPTeamsLisLocation function retrieves Location Information Service (LIS) locations for Teams emergency services from CIPP.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the ID of the customer tenant where the operation will be performed. This parameter is mandatory for proper data isolation and multi-tenancy compliance.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPTeamsLisLocation -CustomerTenantID "12345678-1234-1234-1234-1234567890AB"
```

