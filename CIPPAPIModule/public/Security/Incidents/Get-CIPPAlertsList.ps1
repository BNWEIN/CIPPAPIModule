<#
.SYNOPSIS
Retrieves a list of alerts for a specific customer.

.DESCRIPTION
The Get-CIPPAlertsList function retrieves a list of alerts for a specific customer identified by their tenant ID.

.PARAMETER CustomerTenantID
The tenant ID of the customer for whom to retrieve the alerts.

.EXAMPLE
Get-CIPPAlertsList -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778"
Retrieves the alerts for the customer with the tenant ID "7ced1621-b8f7-4231-868c-bc6b1a2f1778".

#>
function Get-CIPPAlertsList {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID
    )
    
    Write-Verbose "Getting Alerts for customer: $CustomerTenantID"
    $endpoint = '/api/execalertslist'
    $params = @{
        tenantfilter = $CustomerTenantID
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}
