<#
.SYNOPSIS
Renames an Autopilot device.

.DESCRIPTION
The Rename-CIPPAutopilotDevice function renames a Windows Autopilot device in the customer's tenant. The display name must meet specific requirements: maximum 15 characters, contain only letters (a-z, A-Z), numbers (0-9), and hyphens (-), and cannot consist solely of numbers.

.PARAMETER CustomerTenantID
Specifies the customer tenant ID. This parameter is mandatory.

.PARAMETER DeviceId
Specifies the unique identifier (GUID) of the Autopilot device. This parameter is mandatory.

.PARAMETER SerialNumber
Specifies the serial number of the device. This parameter is used for logging and identification purposes. This parameter is mandatory.

.PARAMETER DisplayName
Specifies the new display name for the Autopilot device. Maximum 15 characters, can only contain letters (a-z, A-Z), numbers (0-9), and hyphens (-), and cannot consist solely of numbers. This parameter is mandatory.

.EXAMPLE
Rename-CIPPAutopilotDevice -CustomerTenantID "contoso.onmicrosoft.com" -DeviceId "12345678-1234-1234-1234-123456789abc" -SerialNumber "5CD123ABCD" -DisplayName "LAPTOP-001"

Renames the Autopilot device with the specified DeviceId and serial number to "LAPTOP-001".

.EXAMPLE
Rename-CIPPAutopilotDevice -CustomerTenantID "contoso.onmicrosoft.com" -DeviceId "87654321-4321-4321-4321-cba987654321" -SerialNumber "5CD987WXYZ" -DisplayName "WKS-HR-01"

Renames the Autopilot device to "WKS-HR-01".

.NOTES
This function requires appropriate permissions to manage Autopilot devices. The display name validation is enforced by both the API and this function.
#>

function Rename-CIPPAutopilotDevice {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $true)]
        [guid]$DeviceId,
        [Parameter(Mandatory = $true)]
        [string]$SerialNumber,
        [Parameter(Mandatory = $true)]
        [ValidateLength(1, 15)]
        [ValidatePattern('^[a-zA-Z0-9-]+$')]
        [ValidateScript({
            if ($_ -match '^\d+$') {
                throw "Display name cannot consist solely of numbers."
            }
            $true
        })]
        [string]$DisplayName
    )

    Write-Verbose "Renaming Autopilot device $DeviceId to $DisplayName"

    $endpoint = '/api/ExecRenameAPDevice'
    $body = @{
        tenantFilter = $CustomerTenantID
        deviceId     = $DeviceId
        serialNumber = $SerialNumber
        displayName  = $DisplayName
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Body $body -Method POST
}
