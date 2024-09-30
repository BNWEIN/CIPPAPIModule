# Add-CIPPSharePointSite
## SYNOPSIS
Adds a new SharePoint site to the specified customer tenant.
## DESCRIPTION
The Add-CIPPSharePointSite function creates a new SharePoint site with the specified parameters. 
It supports different site designs and templates.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The ID of the customer tenant where the SharePoint site will be added. This parameter is mandatory.

  ## **-DisplayName**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The display name of the SharePoint site. This parameter is mandatory.

  ## **-Description**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The description of the SharePoint site. This parameter is mandatory.

  ## **-Owner**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The owner of the SharePoint site. Should be a valid user principal name (UPN). This parameter is mandatory.

  ## **-SiteDesign**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-Showcase-Blue?color=5547a8)\
The design of the SharePoint site. Valid values are 'Topic', 'Showcase', 'Blank', and 'Custom'.  The default value is 'Showcase'. This parameter is optional.

  ## **-TemplateName**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-Communication-Blue?color=5547a8)\
The template of the SharePoint site. Valid values are 'Communication' and 'Team'.  The default value is 'Communication'. This parameter is optional.

 #### EXAMPLE 1
```powershell
PS > Add-CIPPSharePointSite -CustomerTenantID "166cc908-10b2-405f-a00b-03006c430c9c" -DisplayName "Project Site" -Description "Site for project collaboration" -Owner "owner@domain.com"
```
 #### EXAMPLE 2
```powershell
PS > Add-CIPPSharePointSite -CustomerTenantID "domain.com" -DisplayName "Project Site" -Description "Site for project collaboration" -Owner "owner@domain.com"
```

