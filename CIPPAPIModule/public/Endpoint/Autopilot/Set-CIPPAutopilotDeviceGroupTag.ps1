<#
.SYNOPSIS
Sets the group tag for an Autopilot device.

.DESCRIPTION
The Set-CIPPAutopilotDeviceGroupTag function updates the group tag property for a Windows Autopilot device in the customer's tenant. Group tags are used to organize and categorize Autopilot devices, which can be used in dynamic Azure AD groups or for targeting deployment profiles. The group tag can be up to 128 characters or can be empty to remove the tag.

.PARAMETER CustomerTenantID
Specifies the customer tenant ID. This parameter is mandatory.

.PARAMETER DeviceId
Specifies the unique identifier (GUID) of the Autopilot device. This parameter is mandatory.

.PARAMETER SerialNumber
Specifies the serial number of the device. This parameter is used for logging and identification purposes. This parameter is mandatory.

.PARAMETER GroupTag
Specifies the group tag to assign to the Autopilot device. Maximum 128 characters. Can be empty string to remove the tag. This parameter is mandatory.

.EXAMPLE
Set-CIPPAutopilotDeviceGroupTag -CustomerTenantID "contoso.onmicrosoft.com" -DeviceId "12345678-1234-1234-1234-123456789abc" -SerialNumber "5CD123ABCD" -GroupTag "Sales-Department"

Sets the group tag "Sales-Department" on the Autopilot device with the specified DeviceId and serial number.

.EXAMPLE
Set-CIPPAutopilotDeviceGroupTag -CustomerTenantID "contoso.onmicrosoft.com" -DeviceId "87654321-4321-4321-4321-cba987654321" -SerialNumber "5CD987WXYZ" -GroupTag ""

Removes the group tag from the Autopilot device by setting it to an empty string.

.NOTES
This function requires appropriate permissions to manage Autopilot devices. Group tags can be used to create dynamic groups or target deployment profiles.
#>

function Set-CIPPAutopilotDeviceGroupTag {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $true)]
        [guid]$DeviceId,
        [Parameter(Mandatory = $true)]
        [string]$SerialNumber,
        [Parameter(Mandatory = $true)]
        [ValidateLength(0, 128)]
        [string]$GroupTag
    )

    Write-Verbose "Setting group tag for Autopilot device $DeviceId to '$GroupTag'"

    $endpoint = '/api/ExecSetAPDeviceGroupTag'
    $body = @{
        tenantFilter = $CustomerTenantID
        deviceId     = $DeviceId
        serialNumber = $SerialNumber
        groupTag     = $GroupTag
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Body $body -Method POST
}
