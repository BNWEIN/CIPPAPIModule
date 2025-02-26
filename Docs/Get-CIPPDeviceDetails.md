# Get-CIPPDeviceDetails
## SYNOPSIS
Gets detailed device information.
## DESCRIPTION
The Get-CIPPDeviceDetails function retrieves detailed information about managed devices in Intune, including group membership, compliance policies, and installed applications.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the ID of the customer tenant where the operation will be performed. This parameter is mandatory for proper data isolation and multi-tenancy compliance.

  ## **-DeviceID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Optional. Specifies the device ID to retrieve details for.

  ## **-DeviceName**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Optional. Specifies the device name to search for.

  ## **-DeviceSerial**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
Optional. Specifies the device serial number to search for.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPDeviceDetails -CustomerTenantID "12345678-1234-1234-1234-1234567890AB" -DeviceID "device123"
```
 #### EXAMPLE 2
```powershell
PS > Get-CIPPDeviceDetails -CustomerTenantID "12345678-1234-1234-1234-1234567890AB" -DeviceName "LAPTOP-XYZ" -DeviceSerial "ABC123"
```

