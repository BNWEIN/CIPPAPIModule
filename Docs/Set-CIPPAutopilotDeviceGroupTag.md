# Set-CIPPAutopilotDeviceGroupTag
## SYNOPSIS
Sets the group tag for an Autopilot device.
## DESCRIPTION
The Set-CIPPAutopilotDeviceGroupTag function updates the group tag property for a Windows Autopilot device in the customer's tenant. Group tags are used to organize and categorize Autopilot devices, which can be used in dynamic Azure AD groups or for targeting deployment profiles. The group tag can be up to 128 characters or can be empty to remove the tag.
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

  ## **-GroupTag**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the group tag to assign to the Autopilot device. Maximum 128 characters. Can be empty string to remove the tag. This parameter is mandatory.

 #### EXAMPLE 1
```powershell
PS > Set-CIPPAutopilotDeviceGroupTag -CustomerTenantID "contoso.onmicrosoft.com" -DeviceId "12345678-1234-1234-1234-123456789abc" -SerialNumber "5CD123ABCD" -GroupTag "Sales-Department"

Sets the group tag "Sales-Department" on the Autopilot device with the specified DeviceId and serial number.
```
 #### EXAMPLE 2
```powershell
PS > Set-CIPPAutopilotDeviceGroupTag -CustomerTenantID "contoso.onmicrosoft.com" -DeviceId "87654321-4321-4321-4321-cba987654321" -SerialNumber "5CD987WXYZ" -GroupTag ""

Removes the group tag from the Autopilot device by setting it to an empty string.
```

