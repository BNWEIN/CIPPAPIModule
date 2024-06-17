# Get-CIPPDeviceCompliance
## SYNOPSIS
Retrieves device compliance information for a specific customer tenant.
## DESCRIPTION
The Get-CIPPDeviceCompliance function retrieves device compliance information for a specified customer tenant. It makes use of the Invoke-CIPPRestMethod function to send a request to the CIPP API and retrieve the device compliance data.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The unique identifier of the customer tenant for which to retrieve device compliance information.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPDeviceCompliance -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778"
```

