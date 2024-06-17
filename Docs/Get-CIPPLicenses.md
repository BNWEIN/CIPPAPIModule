# Get-CIPPLicenses
## SYNOPSIS
Retrieves licenses for a specific customer tenant.
## DESCRIPTION
The Get-CIPPLicenses function retrieves licenses for a specific customer tenant by making a REST API call to the "/api/ListLicenses" endpoint.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The ID of the customer tenant for which licenses need to be retrieved.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPLicenses -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778"
```
 #### EXAMPLE 2
```powershell
PS > Get-CIPPLicenses -CustomerTenantID "contoso.onmicrosoft.com"
```

