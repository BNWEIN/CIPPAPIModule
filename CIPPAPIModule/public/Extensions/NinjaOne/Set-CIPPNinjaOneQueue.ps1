<#
.SYNOPSIS
Manages the NinjaOne extension queue.

.DESCRIPTION
The Set-CIPPNinjaOneQueue function manages the queue of NinjaOne extension operations in the CIPP system.

.PARAMETER CustomerTenantID
Specifies the ID of the customer tenant where the operation will be performed. This parameter is mandatory for proper data isolation and multi-tenancy compliance.

.PARAMETER Operation
Specifies the operation to perform with NinjaOne integration.

.EXAMPLE
Set-CIPPNinjaOneQueue -CustomerTenantID "12345678-1234-1234-1234-1234567890AB" -Operation "Sync"
Queues a sync operation for NinjaOne integration for the specified tenant.

.NOTES
Requires appropriate permissions to manage NinjaOne integration.
#>

function Set-CIPPNinjaOneQueue {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [ValidateSet('StartAutoMapping', 'AutoMapTenant', 'SyncTenant')]
        [string]$NinjaAction
    )

    Write-Verbose "Managing NinjaOne queue operation '$NinjaAction'"

    $endpoint = '/api/ExecExtensionNinjaOneQueue'
    $body = @{
        operation = $NinjaAction
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Body $body -Method Post
}