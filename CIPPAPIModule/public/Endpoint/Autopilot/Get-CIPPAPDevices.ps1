<#
.SYNOPSIS
Retrieves AutoPilot devices for a specific customer tenant.

.DESCRIPTION
The Get-CIPPAPDevices function retrieves AutoPilot devices for a specific customer tenant by making a REST API call to the "/api/listapdevices" endpoint.

.PARAMETER CustomerTenantID
Specifies the ID of the customer tenant for which to retrieve AutoPilot devices.

.EXAMPLE
Get-CIPPAPDevices -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778"
Retrieves AutoPilot devices for the customer tenant with the ID "7ced1621-b8f7-4231-868c-bc6b1a2f1778".

#>
function Get-CIPPAPDevices {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID
    )

    Write-Verbose "Getting AutoPilot Devices for $CustomerTenantID"
    $Endpoint = '/api/listapdevices'
    $Params = @{
        tenantFilter = $CustomerTenantID
    }
    
    Invoke-CIPPRestMethod -Endpoint $Endpoint -Params $Params

}