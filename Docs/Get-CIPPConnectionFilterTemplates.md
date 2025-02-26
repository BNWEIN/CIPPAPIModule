# Get-CIPPConnectionFilterTemplates
## SYNOPSIS
Retrieves connection filter templates for a specific customer.
## DESCRIPTION
The Get-CIPPConnectionFilterTemplates function retrieves connection filter templates for a specific customer identified by their tenant ID.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The tenant ID of the customer for whom to retrieve the connection filter templates.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPConnectionFilterTemplates -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778"
```

