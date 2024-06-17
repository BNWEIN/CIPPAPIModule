# Get-CIPPAPDevices
## SYNOPSIS
Retrieves AutoPilot devices for a specific customer tenant.
## DESCRIPTION
The Get-CIPPAPDevices function retrieves AutoPilot devices for a specific customer tenant by making a REST API call to the "/api/listapdevices" endpoint.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the ID of the customer tenant for which to retrieve AutoPilot devices.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPAPDevices -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778"
```

