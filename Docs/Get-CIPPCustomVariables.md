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

 #### EXAMPLE 1
```powershell
PS>Get-CIPPCustomVariables -CustomerTenantID "12345678-1234-1234-1234-1234567890ab"
```
 #### EXAMPLE 2
```powershell
PS>Get-CIPPCustomVariables -CustomerTenantID "AllTenants"
```

