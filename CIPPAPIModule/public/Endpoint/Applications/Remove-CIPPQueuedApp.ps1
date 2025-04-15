<#
.SYNOPSIS
Removes an application from the CIPP application queue.

.DESCRIPTION
The Remove-CIPPQueuedApp function removes a specified application from the CIPP application queue. This is typically used to remove pending application deployments or installations.

.PARAMETER CustomerTenantID
Specifies the ID of the customer tenant where the operation will be performed. This parameter is mandatory for proper data isolation and multi-tenancy compliance.

.PARAMETER ApplicationId
Specifies the ID of the application to remove from the queue.

.EXAMPLE
Remove-CIPPQueuedApp -CustomerTenantID "12345678-1234-1234-1234-1234567890AB" -ApplicationId "98765432-4321-4321-4321-BA0987654321"
Removes the specified application from the CIPP application queue for the specified tenant.

.NOTES
Requires appropriate permissions to manage application deployments.
#>

function Remove-CIPPQueuedApp {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,

        [Parameter(Mandatory = $true)]
        [string]$ApplicationId
    )

    Write-Verbose "Removing application $ApplicationId from the queue for tenant $CustomerTenantID"

    $endpoint = '/api/RemoveQueuedApp'
    $body = @{
        tenantFilter = $CustomerTenantID
        id           = $ApplicationId
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Body $body -Method POST
}