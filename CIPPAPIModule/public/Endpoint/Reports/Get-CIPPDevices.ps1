<#
.SYNOPSIS
Retrieves a list of devices for a specific customer.

.DESCRIPTION
The Get-CIPPDevices function retrieves a list of devices associated with a specific customer in the CIPP system.

.PARAMETER CustomerTenantID
The unique identifier of the customer's tenant.

.EXAMPLE
Get-CIPPDevices -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778"
Retrieves a list of devices for the customer with the tenant ID "7ced1621-b8f7-4231-868c-bc6b1a2f1778".

.INPUTS
None.

.OUTPUTS
System.Object.

.NOTES
Author: [Your Name]
Date: [Current Date]
#>

function Get-CIPPDevices {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID
    )
    
    Write-Verbose "Getting Devices for customer: $CustomerTenantID"
    $endpoint = '/api/listdevices'
    $params = @{
        tenantfilter = $CustomerTenantID
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}
