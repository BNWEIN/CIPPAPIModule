# Get-CIPPExternalTenantInfo
## SYNOPSIS
Retrieves external tenant information for a specified tenant.
## DESCRIPTION
The Get-CIPPExternalTenantInfo function retrieves external tenant information for a specified tenant by making a REST API call to the "/api/ListExternalTenantInfo" endpoint.
# PARAMETERS

## **-Tenant**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the name of the tenant for which to retrieve the external tenant information.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPExternalTenantInfo -Tenant "Contoso.com"
```

