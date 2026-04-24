<#
.SYNOPSIS
Retrieves AutoPilot devices for a specific customer tenant.

.DESCRIPTION
The Get-CIPPAutoPilotDevices function retrieves AutoPilot devices for a specific customer tenant by making a REST API call to the generic Graph request endpoint.
Get-CIPPAPDevices is available as a backwards-compatible alias.

.PARAMETER CustomerTenantID
Specifies the ID of the customer tenant for which to retrieve AutoPilot devices.

.EXAMPLE
Get-CIPPAutoPilotDevices -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778"
Retrieves AutoPilot devices for the customer tenant with the ID "7ced1621-b8f7-4231-868c-bc6b1a2f1778".

#>
function Get-CIPPAutoPilotDevices {
    [CmdletBinding()]
    [Alias('Set-CIPPPAPDevices')]
    param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID
    )

    Write-Verbose "Getting AutoPilot Devices for $CustomerTenantID"
    $Endpoint = '/api/ListGraphRequest'
    $Params = @{
        tenantFilter = $CustomerTenantID
        endpoint     = 'deviceManagement/windowsAutopilotDeviceIdentities'
        '$top'       = 999
    }
    
    (Invoke-CIPPRestMethod -Endpoint $Endpoint -Params $Params).Results

}
