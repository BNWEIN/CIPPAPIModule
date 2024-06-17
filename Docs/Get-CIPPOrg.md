# Get-CIPPOrg
## SYNOPSIS
Retrieves information about a specific organization in the CIPP system.
## DESCRIPTION
The Get-CIPPOrg function retrieves information about a specific organization in the CIPP system based on the provided CustomerTenantID.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the unique identifier of the customer tenant.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPOrg -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778"
```
 #### EXAMPLE 2
```powershell
PS > Get-CIPPOrg -CustomerTenantID "contoso.onmicrosoft.com"
```

