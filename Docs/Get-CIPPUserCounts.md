# Get-CIPPUserCounts
## SYNOPSIS
Retrieves user counts for a specific customer tenant ID.
## DESCRIPTION
The Get-CIPPUserCounts function retrieves user counts for a specific customer tenant ID by making a REST API call to the "/api/listusercounts" endpoint.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The customer tenant ID for which to retrieve user counts.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPUserCounts -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778"
```

