# Get-CIPPNamedLocations
## SYNOPSIS
Retrieves named locations for a specific customer tenant.
## DESCRIPTION
The Get-CIPPNamedLocations function retrieves named locations for a specific customer tenant by making a REST API call to the "/api/listnamedlocations" endpoint.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The ID of the customer tenant for which to retrieve named locations.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPNamedLocations -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778"
```
 #### EXAMPLE 2
```powershell
PS > Get-CIPPNamedLocations -CustomerTenantID "contoso.onmicrosoft.com"
```

