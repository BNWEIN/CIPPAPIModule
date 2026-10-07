# Get-CIPPCustomVariableUsage
## SYNOPSIS
Lists every definition of every custom variable name across all tenants in CIPP.
## DESCRIPTION
The Get-CIPPCustomVariableUsage function answers "where else does this variable name exist".
Custom variables are stored one row per tenant, but a variable name is the unit an operator
thinks in (the same %wallpaperpath% deployed to many tenants), so the result is grouped by
name with every tenant and global definition nested underneath. It needs no tenant.
# PARAMETERS

## **-VariableName**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
Optional. Only return the entry for this variable name. The filter is applied client-side and is case-insensitive.

 #### EXAMPLE 1
```powershell
PS>Get-CIPPCustomVariableUsage
```
 #### EXAMPLE 2
```powershell
PS>Get-CIPPCustomVariableUsage -VariableName 'wallpaperpath'
```
 #### EXAMPLE 3
```powershell
PS>Get-CIPPCustomVariableUsage | Where-Object { -not $_.TypesConsistent }
```
