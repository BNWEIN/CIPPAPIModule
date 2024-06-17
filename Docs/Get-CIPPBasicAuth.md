# Get-CIPPBasicAuth
## SYNOPSIS
Retrieves Basic Authentication information for a specific customer.
## DESCRIPTION
The Get-CIPPBasicAuth function retrieves Basic Authentication information for a specific customer by making a REST API call to the "/api/listbasicauth" endpoint.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The unique identifier of the customer's tenant.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPBasicAuth -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778"
```

