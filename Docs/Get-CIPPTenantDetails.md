# Get-CIPPTenantDetails
## SYNOPSIS
Retrieves the details of a specific CIPP tenant.
## DESCRIPTION
The Get-CIPPTenantDetails function retrieves the details of a specific CIPP (Customer Information Protection Platform) tenant using the provided CustomerTenantID.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The unique identifier of the CIPP tenant.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPTenantDetails -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778"
```
 #### EXAMPLE 2
```powershell
PS > Get-CIPPTenantDetails -CustomerTenantID "contoso.onmicrosoft.com"
```

