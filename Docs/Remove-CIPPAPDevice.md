# Remove-CIPPAPDevice
## SYNOPSIS
Removes an Autopilot device.
## DESCRIPTION
The Remove-CIPPAPDevice function removes an Autopilot device from Intune.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the ID of the customer tenant. This parameter is mandatory.

  ## **-DeviceID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the ID of the Autopilot device to remove. This parameter is mandatory.

 #### EXAMPLE 1
```powershell
PS > Remove-CIPPAPDevice -CustomerTenantID "12345678-1234-1234-1234-1234567890AB" -DeviceID "98765432-4321-4321-4321-0987654321BA"
```

