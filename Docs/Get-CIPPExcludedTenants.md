# Get-CIPPExcludedTenants
## SYNOPSIS
Retrieves a list of excluded tenants.
## DESCRIPTION
The Get-CIPPExcludedTenants function retrieves a list of excluded tenants from CIPP. It can retrieve all tenants or only the ones that are currently excluded.
# PARAMETERS

## **-ListAll**
> ![Foo](https://img.shields.io/badge/Type-SwitchParameter-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-False-Blue?color=5547a8)\
Specifies whether to retrieve all tenants or only the ones that are currently excluded. By default, it retrieves only the excluded tenants.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPExcludedTenants
```
 #### EXAMPLE 2
```powershell
PS > Get-CIPPExcludedTenants -ListAll
```

