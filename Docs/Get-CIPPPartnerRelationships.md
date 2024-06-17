# Get-CIPPPartnerRelationships
## SYNOPSIS
Retrieves partner relationships for a specified customer tenant.
## DESCRIPTION
The Get-CIPPPartnerRelationships function retrieves partner relationships for a specified customer tenant by making a REST API call to the "/api/listpartnerrelationships" endpoint.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The ID of the customer tenant for which to retrieve partner relationships.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPPartnerRelationships -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778"
```
 #### EXAMPLE 2
```powershell
PS > Get-CIPPPartnerRelationships -CustomerTenantID "contoso.onmicrosoft.com"
```

