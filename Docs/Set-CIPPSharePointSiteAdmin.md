# Set-CIPPSharePointSiteAdmin
## SYNOPSIS
Sets the SharePoint site admin for a given site.
## DESCRIPTION
The Set-CIPPSharePointSiteAdmin function sets the SharePoint site admin for a specified site by making a REST API call to the CIPP API.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The ID of the customer's tenant.

  ## **-CurrentAdminUPN**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The UPN (User Principal Name) of the current site admin.

  ## **-SiteUrl**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The URL of the SharePoint site.

  ## **-RemovePermission**
> ![Foo](https://img.shields.io/badge/Type-Boolean-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) ![Foo](https://img.shields.io/badge/DefaultValue-False-Blue?color=5547a8)\
Specifies whether to remove the admin permission for the current admin UPN.

  ## **-AdditionalAdminUPN**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The UPN of the additional admin to be added.

 #### EXAMPLE 1
```powershell
PS > Set-CIPPSharePointSiteAdmin -CustomerTenantID "contoso.onmicrosoft.com" -CurrentAdminUPN "admin@contoso.com" -SiteUrl "https://contoso.sharepoint.com/sites/site1" -RemovePermission $true -AdditionalAdminUPN "admin2@contoso.com"
```

