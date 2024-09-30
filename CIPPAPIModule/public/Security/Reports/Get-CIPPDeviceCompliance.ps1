<#
.SYNOPSIS
Retrieves device compliance information for a specific customer tenant.

.DESCRIPTION
The Get-CIPPDeviceCompliance function retrieves device compliance information for a specified customer tenant. It makes use of the Invoke-CIPPRestMethod function to send a request to the CIPP API and retrieve the device compliance data.

.PARAMETER CustomerTenantID
The unique identifier of the customer tenant for which to retrieve device compliance information.

.EXAMPLE
Get-CIPPDeviceCompliance -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778"
Retrieves device compliance information for the customer tenant with the ID "7ced1621-b8f7-4231-868c-bc6b1a2f1778".

#>
function Get-CIPPDeviceCompliance {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID
    )
    
    Write-Verbose "Getting Device Compliance for $CustomerTenantID"
    $endpoint = '/api/listalltenantdevicecompliance'
    $params = @{
        tenantfilter = $CustomerTenantID
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}