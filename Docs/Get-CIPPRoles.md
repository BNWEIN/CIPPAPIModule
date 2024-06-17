# Get-CIPPRoles
## SYNOPSIS
Retrieves the roles for a specific customer tenant ID.
## DESCRIPTION
The Get-CIPPRoles function retrieves the roles associated with a specific customer tenant ID by making a REST API call to the "/api/listroles" endpoint.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The customer tenant ID for which to retrieve the roles.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPRoles -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778"
```

