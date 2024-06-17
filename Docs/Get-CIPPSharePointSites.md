# Get-CIPPSharePointSites
## SYNOPSIS
Retrieves SharePoint sites for a specified customer tenant.
## DESCRIPTION
The Get-CIPPSharePointSites function retrieves SharePoint sites for a specified customer tenant. It uses the Invoke-CIPPRestMethod function to make a REST API call to retrieve the sites.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The ID of the customer tenant for which to retrieve SharePoint sites. This parameter is mandatory.

  ## **-urlonly**
> ![Foo](https://img.shields.io/badge/Type-SwitchParameter-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-False-Blue?color=5547a8)\
Specifies whether to retrieve only the URLs of the SharePoint sites. By default, this parameter is not specified.

  ## **-UserUPN**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
The user's UPN (User Principal Name) for which to retrieve SharePoint sites. This parameter is optional.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPSharePointSites -CustomerTenantID "contoso.onmicrosoft.com"
```
 #### EXAMPLE 2
```powershell
PS > Get-CIPPSharePointSites -CustomerTenantID "contoso.onmicrosoft.com" -urlonly
```
 #### EXAMPLE 3
```powershell
PS > Get-CIPPSharePointSites -CustomerTenantID "contoso.onmicrosoft.com" -UserUPN "user@contoso.com"
```

