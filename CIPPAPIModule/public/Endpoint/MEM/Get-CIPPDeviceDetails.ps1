<#
.SYNOPSIS
Gets detailed device information.

.DESCRIPTION
The Get-CIPPDeviceDetails function retrieves detailed information about managed devices in Intune, including group membership, compliance policies, and installed applications.

.PARAMETER CustomerTenantID
Specifies the ID of the customer tenant where the operation will be performed. This parameter is mandatory for proper data isolation and multi-tenancy compliance.

.PARAMETER DeviceID
Optional. Specifies the device ID to retrieve details for.

.PARAMETER DeviceName
Optional. Specifies the device name to search for.

.PARAMETER DeviceSerial
Optional. Specifies the device serial number to search for.

.EXAMPLE
Get-CIPPDeviceDetails -CustomerTenantID "12345678-1234-1234-1234-1234567890AB" -DeviceID "device123"
Returns detailed information for the specified device ID.

.EXAMPLE
Get-CIPPDeviceDetails -CustomerTenantID "12345678-1234-1234-1234-1234567890AB" -DeviceName "LAPTOP-XYZ" -DeviceSerial "ABC123"
Searches for a device by both name and serial number.

.NOTES
Requires Identity.Device.Read permissions.
At least one search parameter (DeviceID, DeviceName, or DeviceSerial) must be provided.
When both DeviceName and DeviceSerial are provided, the function attempts to find an exact match first.
The results include:
- Device properties
- Group memberships
- Compliance policies
- Detected applications
#>

function Get-CIPPDeviceDetails {
    [CmdletBinding(DefaultParameterSetName = 'ById')]
    param (
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,

        [Parameter(Mandatory = $true, ParameterSetName = 'ById')]
        [string]$DeviceID,

        [Parameter(Mandatory = $true, ParameterSetName = 'ByNameOrSerial', Position = 0)]
        [string]$DeviceName,

        [Parameter(Mandatory = $false, ParameterSetName = 'ByNameOrSerial')]
        [string]$DeviceSerial
    )

    if ($PSCmdlet.ParameterSetName -eq 'ByNameOrSerial' -and -not $DeviceName -and -not $DeviceSerial) {
        throw 'At least one of DeviceName or DeviceSerial must be provided'
    }

    Write-Verbose "Getting device details from tenant $CustomerTenantID"

    $endpoint = '/api/ListDeviceDetails'
    $params = @{
        tenantFilter = $CustomerTenantID
    }

    if ($DeviceID) {
        Write-Verbose "Searching by Device ID: $DeviceID"
        $params['DeviceID'] = $DeviceID
    } else {
        Write-Verbose "Searching by Name: $DeviceName and/or Serial: $DeviceSerial"
        if ($DeviceName) {
            $params['DeviceName'] = $DeviceName
        }
        if ($DeviceSerial) {
            $params['DeviceSerial'] = $DeviceSerial
        }
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params -Method GET
}