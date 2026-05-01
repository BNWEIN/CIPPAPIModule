# Set-CIPPCustomVariable
## SYNOPSIS
Sets a custom variable for a tenant in the CIPP system.
## DESCRIPTION
The Set-CIPPCustomVariable function creates or updates a custom variable for a specific tenant,
or for all tenants when using 'AllTenants'.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The tenant ID to scope the custom variable to, or 'AllTenants' for a global variable.

  ## **-VariableName**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The custom variable name to create or update.

  ## **-Value**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The value to assign to the custom variable.

  ## **-Description**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
An optional description for the custom variable.

 #### EXAMPLE 1
```powershell
PS > Set-CIPPCustomVariable -CustomerTenantID "12345678-1234-1234-1234-1234567890ab" -VariableName "WallpaperPath" -Value "C:\Wallpapers"
```
 #### EXAMPLE 2
```powershell
PS > Set-CIPPCustomVariable -CustomerTenantID "AllTenants" -VariableName "CompanyName" -Value "Contoso" -Description "Global branding variable"
```

