# Get-CIPPSharePointQuota
## SYNOPSIS
Retrieves the SharePoint quota for a specific customer tenant.
## DESCRIPTION
The Get-CIPPSharePointQuota function retrieves the SharePoint quota for a specific customer tenant by making a REST API call to the "/api/listsharepointquota" endpoint.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The ID of the customer tenant for which the SharePoint quota needs to be retrieved.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPSharePointQuota -CustomerTenantID "contoso.onmicrosoft.com"
```
 #### EXAMPLE 2
```powershell
PS > Get-CIPPSharePointQuota -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778"
```

