# Get-CIPPDeletedItems
## SYNOPSIS
Retrieves the deleted items for a specific customer tenant.
## DESCRIPTION
The Get-CIPPDeletedItems function retrieves the deleted items for a specific customer tenant by making a REST API call to the "/api/listdeleteditems" endpoint.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The ID of the customer tenant for which to retrieve the deleted items.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPDeletedItems -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778"
```

