<#
.SYNOPSIS
Removes an Autopilot device.

.DESCRIPTION
The Remove-CIPPAPDevice function removes an Autopilot device from Intune.

.PARAMETER CustomerTenantID
Specifies the ID of the customer tenant. This parameter is mandatory.

.PARAMETER DeviceID
Specifies the ID of the Autopilot device to remove. This parameter is mandatory.

.EXAMPLE
Remove-CIPPAPDevice -CustomerTenantID "12345678-1234-1234-1234-1234567890AB" -DeviceID "98765432-4321-4321-4321-0987654321BA"
Removes the Autopilot device with ID "98765432-4321-4321-4321-0987654321BA" from the specified tenant.
#>
function Remove-CIPPAPDevice {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $true)]
        [string]$DeviceID
    )

    Write-Verbose "Removing Autopilot device $($DeviceID)"

    $endpoint = '/api/RemoveAPDevice' 
    $body = @{
        tenantFilter = $CustomerTenantID
        ID           = $DeviceID
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Body $body -Method POST
}