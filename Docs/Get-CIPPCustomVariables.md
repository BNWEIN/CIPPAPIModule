# Get-CIPPCustomVariables
## SYNOPSIS
Retrieves custom variables for a specified tenant from the CIPP system.
## DESCRIPTION
The Get-CIPPCustomVariables function retrieves all custom variables associated with a specific
tenant in CIPP
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The tenant ID for which to retrieve custom variables, or 'AllTenants' for global variables.

  ## **-IncludeGlobal**
> ![Foo](https://img.shields.io/badge/Type-SwitchParameter-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-False-Blue?color=5547a8)\
Also return the global (AllTenants) variables alongside the tenant's own. Global rows are marked Scope = 'Global'; a tenant variable that shadows a global one is marked Scope = 'Overridden' and the shadowed global row is left out.

 #### EXAMPLE 1
```powershell
PS>Get-CIPPCustomVariables -CustomerTenantID "12345678-1234-1234-1234-1234567890ab"
```
 #### EXAMPLE 2
```powershell
PS>Get-CIPPCustomVariables -CustomerTenantID "AllTenants"
```
 #### EXAMPLE 3
```powershell
PS>Get-CIPPCustomVariables -CustomerTenantID "12345678-1234-1234-1234-1234567890ab" -IncludeGlobal
```
