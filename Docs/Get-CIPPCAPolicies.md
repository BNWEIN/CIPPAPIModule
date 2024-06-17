# Get-CIPPCAPolicies
## SYNOPSIS
Retrieves Conditional Access Policies for a specific customer tenant.
## DESCRIPTION
The Get-CIPPCAPolicies function retrieves the Conditional Access Policies for a specific customer tenant by making a REST API call to the "/api/listconditionalaccesspolicies" endpoint.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The ID of the customer tenant for which to retrieve the Conditional Access Policies.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPCAPolicies -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778"
```
 #### EXAMPLE 2
```powershell
PS > Get-CIPPCAPolicies -CustomerTenantID "contoso.onmicrosoft.com"
```

