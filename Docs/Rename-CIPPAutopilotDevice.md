# Rename-CIPPAutopilotDevice
## SYNOPSIS
Renames an Autopilot device.
## DESCRIPTION
The Rename-CIPPAutopilotDevice function renames a Windows Autopilot device in the customer's tenant. The display name must meet specific requirements: maximum 15 characters, contain only letters (a-z, A-Z), numbers (0-9), and hyphens (-), and cannot consist solely of numbers.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the customer tenant ID. This parameter is mandatory.

  ## **-DeviceId**
> ![Foo](https://img.shields.io/badge/Type-Guid-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the unique identifier (GUID) of the Autopilot device. This parameter is mandatory.

  ## **-SerialNumber**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the serial number of the device. This parameter is used for logging and identification purposes. This parameter is mandatory.

  ## **-DisplayName**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the new display name for the Autopilot device. Maximum 15 characters, can only contain letters (a-z, A-Z), numbers (0-9), and hyphens (-), and cannot consist solely of numbers. This parameter is mandatory.

 #### EXAMPLE 1
```powershell
PS > Rename-CIPPAutopilotDevice -CustomerTenantID "contoso.onmicrosoft.com" -DeviceId "12345678-1234-1234-1234-123456789abc" -SerialNumber "5CD123ABCD" -DisplayName "LAPTOP-001"

Renames the Autopilot device with the specified DeviceId and serial number to "LAPTOP-001".
```
 #### EXAMPLE 2
```powershell
PS > Rename-CIPPAutopilotDevice -CustomerTenantID "contoso.onmicrosoft.com" -DeviceId "87654321-4321-4321-4321-cba987654321" -SerialNumber "5CD987WXYZ" -DisplayName "WKS-HR-01"

Renames the Autopilot device to "WKS-HR-01".
```

