# Get-CIPPAppConsentReqs
## SYNOPSIS
Retrieves app consent requests for a specific customer tenant.
## DESCRIPTION
The Get-CIPPAppConsentReqs function retrieves app consent requests for a specific customer tenant by making a REST API call to the "/api/listappconsentrequests" endpoint.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The ID of the customer tenant for which to retrieve app consent requests. This parameter is mandatory.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPAppConsentReqs -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778"
```

