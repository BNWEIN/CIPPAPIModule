<#
.SYNOPSIS
Executes a device action in the CIPP API.

.DESCRIPTION
The Set-CIPPDeviceAction function is used to execute various actions on a device in the CIPP API. The function supports actions such as syncing the device, rebooting the device, locating the device, rotating the local admin password, performing Windows Defender scans, updating Windows Defender signatures, generating logs and shipping them to MEM, renaming the device, performing a fresh start with or without removing user data, wiping the device with or without removing enrollment data, performing an Autopilot reset, and retiring the device.

.PARAMETER CustomerTenantID
The ID of the customer tenant.

.PARAMETER DeviceID
The ID of the device.

.PARAMETER Action
The action to be performed on the device. Valid values are:
- syncDevice
- rebootNow
- locateDevice
- RotateLocalAdminPassword
- WindowsDefenderFullScan
- WindowsDefenderQuickScan
- UpdateWindowsDefender
- GenerateLogsAndShipToMEM
- RenameDevice
- FreshStartRemoveUserData
- FreshStartDoNotRemoveUserData
- WipeDeviceKeepEnrollmentData
- WipeDeviceRemoveEnrollmentData
- WipeDeviceKeepEnrollmentDataContinueAtPowerloss
- WipeDeviceRemoveEnrollmentDataContinueAtPowerloss
- AutopilotReset
- RetireDevice

.PARAMETER NewDeviceName
The new name to assign to the device when the action is "RenameDevice".

.EXAMPLE
Set-CIPPDeviceAction -CustomerTenantID "contoso.onmicrosoft.com" -DeviceID "98765432-4321-4321-4321-0987654321BA" -Action "syncDevice"

This example executes the "syncDevice" action on the specified device.

#>

Function Set-CIPPDeviceAction {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $true)]
        [guid]$DeviceID,
        [Parameter(Mandatory = $true)]
        [ValidateSet(
            "syncDevice",
            "rebootNow",
            "locateDevice",
            "RotateLocalAdminPassword",
            "WindowsDefenderFullScan",
            "WindowsDefenderQuickScan",
            "UpdateWindowsDefender",
            "GenerateLogsAndShipToMEM",
            "RenameDevice",
            "FreshStartRemoveUserData",
            "FreshStartDoNotRemoveUserData", 
            "WipeDeviceKeepEnrollmentData",
            "WipeDeviceRemoveEnrollmentData",
            "WipeDeviceKeepEnrollmentDataContinueAtPowerloss", 
            "WipeDeviceRemoveEnrollmentDataContinueAtPowerloss",
            "AutopilotReset",
            "RetireDevice")]
        [string]$Action,
        [Parameter(Mandatory = $false)]
        [string]$NewDeviceName
    )

    Write-Verbose "Executing $Action on Device $DeviceID"

    # Determine the HTTP method and construct the body if needed
    $method = "GET"
    $body = @{}
    $actionQuery = $Action

    switch ($Action) {
        "WindowsDefenderFullScan" {
            $method = "POST"
            $actionQuery = "WindowsDefenderScan"
            $body.quickScan = $false
        }
        "WindowsDefenderQuickScan" {
            $method = "POST"
            $actionQuery = "WindowsDefenderScan"
            $body.quickScan = $true
        }
        "UpdateWindowsDefender" {
            $method = "POST"
            $actionQuery = "windowsDefenderUpdateSignatures"
        }
        "RenameDevice" {
            $method = "POST"
            $body.newDeviceName = $NewDeviceName
        }
        "FreshStartRemoveUserData" {
            $method = "POST"
            $body.keepUserData = $false
            $actionQuery = "cleanWindowsDevice"
        }
        "FreshStartDoNotRemoveUserData" {
            $method = "POST"
            $body.keepUserData = $true
            $actionQuery = "cleanWindowsDevice"
        }
        "WipeDeviceKeepEnrollmentData" {
            $method = "POST"
            $body.keepUserData = $true
            $body.keepEnrollmentData = $true
            $actionQuery = "cleanWindowsDevice"
        }
        "WipeDeviceRemoveEnrollmentData" {
            $method = "POST"
            $body.keepUserData = $false
            $body.keepEnrollmentData = $false
            $actionQuery = "cleanWindowsDevice"
        }
        "WipeDeviceKeepEnrollmentDataContinueAtPowerloss" {
            $method = "POST"
            $body.keepUserData = $false
            $body.keepEnrollmentData = $true
            $body.useProtectedWipe = $true
            $actionQuery = "cleanWindowsDevice"
        }
        "WipeDeviceRemoveEnrollmentDataContinueAtPowerloss" {
            $method = "POST"
            $body.keepUserData = $false
            $body.keepEnrollmentData = $false
            $body.useProtectedWipe = $true
            $actionQuery = "cleanWindowsDevice"
        }
        default {
            if ($Action -in @("RotateLocalAdminPassword", "AutopilotReset")) {
                $method = "POST"
            }
        }
    }

    # Define the endpoint and parameters
    $endpoint = "/api/ExecDeviceAction"
    $params = @{
        TenantFilter = $CustomerTenantID
        GUID         = $DeviceID
        Action       = $actionQuery
    }
    
    if ($method -eq "GET") {
        Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params -Method $method
    } else {
        Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params -Method $method -Body $body
    }
}