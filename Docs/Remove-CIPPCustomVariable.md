# Remove-CIPPCustomVariable
## SYNOPSIS
Removes a custom variable for a tenant in the CIPP system.
## DESCRIPTION
The Remove-CIPPCustomVariable function deletes a custom variable for a specific tenant,
or from global variables when using 'AllTenants'.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The tenant ID to remove the custom variable from, or 'AllTenants' for a global variable.

  ## **-VariableName**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The custom variable name to remove.

 #### EXAMPLE 1
```powershell
PS > Remove-CIPPCustomVariable -CustomerTenantID "12345678-1234-1234-1234-1234567890ab" -VariableName "WallpaperPath"
```
 #### EXAMPLE 2
```powershell
PS > Remove-CIPPCustomVariable -CustomerTenantID "AllTenants" -VariableName "CompanyName"
```

