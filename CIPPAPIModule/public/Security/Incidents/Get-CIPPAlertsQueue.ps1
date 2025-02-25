<#
.SYNOPSIS
Retrieves the alerts from the queue.

.DESCRIPTION
The Get-CIPPAlertsQueue function retrieves a list of alerts from the queue for a specific customer identified by their tenant ID.

.EXAMPLE
Get-CIPPAlertsQueue
Retrieves the alerts from the queue.

.NOTES
Requires appropriate permissions to access queue information.
#>

function Get-CIPPAlertsQueue {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID
    )

    Write-Verbose "Getting Alerts Queue for customer: $CustomerTenantID"
    $endpoint = '/api/ListAlertsQueue'
    $params = @{
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}