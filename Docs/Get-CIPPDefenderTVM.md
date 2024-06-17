# Get-CIPPDefenderTVM
## SYNOPSIS
Retrieves Defender TVM for a specific customer.
## DESCRIPTION
The Get-CIPPDefenderTVM function retrieves the Defender TVM (Threat and Vulnerability Management) for a specific customer based on the provided CustomerTenantID.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the unique identifier of the customer's tenant.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPDefenderTVM -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778"
```

