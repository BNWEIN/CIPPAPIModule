# Get-CIPPCustomVariables
## SYNOPSIS
Retrieves custom variables for a specified tenant from the CIPP system.
## DESCRIPTION
The Get-CIPPCustomVariables function retrieves all custom variables associated with a specific
tenant in CIPP
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-Guid-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The GUID of the tenant for which to retrieve custom variables. This parameter is mandatory.

 #### EXAMPLE 1
```powershell
PS>Get-CIPPCustomVariables -CustomerTenantID "12345678-1234-1234-1234-1234567890ab"
```

