# Set-CIPPDeviceAction
## SYNOPSIS
Executes a device action in the CIPP API.
## DESCRIPTION
The Set-CIPPDeviceAction function is used to execute various actions on a device in the CIPP API. The function supports actions such as syncing the device, rebooting the device, locating the device, rotating the local admin password, performing Windows Defender scans, updating Windows Defender signatures, generating logs and shipping them to MEM, renaming the device, performing a fresh start with or without removing user data, wiping the device with or without removing enrollment data, performing an Autopilot reset, and retiring the device.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The ID of the customer tenant.

  ## **-DeviceID**
> ![Foo](https://img.shields.io/badge/Type-Guid-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The ID of the device.

  ## **-Action**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The action to be performed on the device. Valid values are: - syncDevice - rebootNow - locateDevice - RotateLocalAdminPassword - WindowsDefenderFullScan - WindowsDefenderQuickScan - UpdateWindowsDefender - GenerateLogsAndShipToMEM - RenameDevice - FreshStartRemoveUserData - FreshStartDoNotRemoveUserData - WipeDeviceKeepEnrollmentData - WipeDeviceRemoveEnrollmentData - WipeDeviceKeepEnrollmentDataContinueAtPowerloss - WipeDeviceRemoveEnrollmentDataContinueAtPowerloss - AutopilotReset - RetireDevice

  ## **-NewDeviceName**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
The new name to assign to the device when the action is "RenameDevice".

 #### EXAMPLE 1
```powershell
PS > Set-CIPPDeviceAction -CustomerTenantID "contoso.onmicrosoft.com" -DeviceID "98765432-4321-4321-4321-0987654321BA" -Action "syncDevice"

This example executes the "syncDevice" action on the specified device.
```

