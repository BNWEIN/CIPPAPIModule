# Get-CIPPDefenderState
## SYNOPSIS
Retrieves the Defender state for a specific customer.
## DESCRIPTION
The Get-CIPPDefenderState function retrieves the Defender state for a specific customer identified by their tenant ID.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-Guid-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the tenant ID of the customer for whom the Defender state needs to be retrieved.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPDefenderState -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778"
```

