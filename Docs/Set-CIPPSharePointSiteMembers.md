# Set-CIPPSharePointSiteMembers
## SYNOPSIS
Sets SharePoint site members with specified permissions.
## DESCRIPTION
The Set-CIPPSharePointSiteMembers function is used to set SharePoint site members with specified permissions. It sends a request to the CIPP API to execute the operation.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the ID of the customer's tenant.

  ## **-SharePointType**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the type of SharePoint site.

  ## **-SiteUrl**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the URL of the SharePoint site.

  ## **-AddPermission**
> ![Foo](https://img.shields.io/badge/Type-Boolean-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) ![Foo](https://img.shields.io/badge/DefaultValue-False-Blue?color=5547a8)\
Specifies whether to add or remove permissions for the user.

  ## **-GroupUPN**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the UPN (User Principal Name) of the site group.

  ## **-UserToGiveAccessUPN**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the UPN of the user to give access to.

 #### EXAMPLE 1
```powershell
PS > Set-CIPPSharePointSiteMembers -CustomerTenantID "contoso.onmicrosoft.com" -SharePointType "Group" -SiteUrl "https://contoso.sharepoint.com/sites/TeamSite" -AddPermission $true -GroupUPN "group@contoso.com" -UserToGiveAccessUPN "user@contoso.com"
```

