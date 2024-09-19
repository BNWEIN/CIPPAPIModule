# Get-CIPPStandards
## SYNOPSIS
Retrieves the CIPP standards for a specific customer tenant.
## DESCRIPTION
The Get-CIPPStandards function retrieves the CIPP standards for a specific customer tenant by making a REST API call to the "/api/liststandards" endpoint.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
The ID of the customer tenant for which to retrieve the standards.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPStandards -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778"
```
 #### EXAMPLE 2
```powershell
PS > Get-CIPPStandards -CustomerTenantID "test.onmicrosoft.com"
```

