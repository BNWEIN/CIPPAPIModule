# Get-CIPPServiceHealth
## SYNOPSIS
Gets service health information.
## DESCRIPTION
The Get-CIPPServiceHealth function retrieves active service health issues from CIPP.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the ID of the customer tenant where the operation will be performed. Use 'AllTenants' to get health information for all tenants, or use the AllTenants switch parameter.

  ## **-AllTenants**
> ![Foo](https://img.shields.io/badge/Type-SwitchParameter-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-False-Blue?color=5547a8)\
When specified, retrieves service health information for all tenants.

  ## **-DisplayName**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
When querying a specific tenant, specifies the display name of the tenant. Required when CustomerTenantID is not 'AllTenants'.

  ## **-DefaultDomainName**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
When querying a specific tenant, specifies the default domain name of the tenant. Required when CustomerTenantID is not 'AllTenants'.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPServiceHealth -CustomerTenantID "AllTenants"
```
 #### EXAMPLE 2
```powershell
PS > Get-CIPPServiceHealth -CustomerTenantID "12345678-1234-1234-1234-1234567890AB" -DisplayName "Contoso" -DefaultDomainName "contoso.onmicrosoft.com"
```

