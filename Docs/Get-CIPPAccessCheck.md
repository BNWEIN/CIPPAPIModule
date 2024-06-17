# Get-CIPPAccessCheck
## SYNOPSIS
Performs a tenant access check for the specified customer tenant ID.
## DESCRIPTION
The Get-CIPPAccessCheck function performs a tenant access check for the specified customer tenant ID. It sends a POST request to the "/api/execaccesschecks" endpoint with the provided tenant ID.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String[]-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the customer tenant ID for which the access check needs to be performed.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPAccessCheck -CustomerTenantID "87654321-4321-4321-4321-0987654321BA"
```

