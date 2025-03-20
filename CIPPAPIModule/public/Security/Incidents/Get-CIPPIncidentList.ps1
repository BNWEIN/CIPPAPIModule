<#
.SYNOPSIS
Retrieves a list of incidents for a specific customer.

.DESCRIPTION
The Get-CIPPIncidentList function retrieves a list of incidents for a specific customer identified by their tenant ID.

.PARAMETER CustomerTenantID
The tenant ID of the customer for whom to retrieve the incidents.

.EXAMPLE
Get-CIPPIncidentList -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778"
Retrieves the incidents for the customer with the tenant ID "7ced1621-b8f7-4231-868c-bc6b1a2f1778".

#>
function Get-CIPPIncidentList {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID
    )
    
    Write-Verbose "Getting Incidents for customer: $CustomerTenantID"
    $endpoint = '/api/execincidentslist'
    $params = @{
        tenantFilter = $CustomerTenantID
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}
