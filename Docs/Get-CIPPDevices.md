# Get-CIPPDevices
## SYNOPSIS
Retrieves a list of devices for a specific customer.
## DESCRIPTION
The Get-CIPPDevices function retrieves a list of devices associated with a specific customer in the CIPP system.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The unique identifier of the customer's tenant.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPDevices -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778"
```

