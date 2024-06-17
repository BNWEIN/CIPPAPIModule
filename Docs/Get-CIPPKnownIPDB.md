# Get-CIPPKnownIPDB
## SYNOPSIS
Retrieves the Known IP Database for a specific customer tenant.
## DESCRIPTION
The Get-CIPPKnownIPDB function retrieves the Known IP Database for a specific customer tenant by making a REST API call to the "/api/listknownipdb" endpoint.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
Specifies the ID of the customer tenant for which to retrieve the Known IP Database.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPKnownIPDB -CustomerTenantID "12345678"
```

