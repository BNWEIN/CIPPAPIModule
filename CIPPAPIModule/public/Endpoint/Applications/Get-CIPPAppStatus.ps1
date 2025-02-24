<#
.SYNOPSIS
Gets application deployment status.

.DESCRIPTION
The Get-CIPPAppStatus function retrieves the status of application deployments in CIPP.

.PARAMETER CustomerTenantID
Specifies the ID of the customer tenant where the operation will be performed. This parameter is mandatory for proper data isolation and multi-tenancy compliance.

.EXAMPLE
Get-CIPPAppStatus -CustomerTenantID "12345678-1234-1234-1234-1234567890AB"
Retrieves the status of application deployments for the specified tenant.

.NOTES
Requires appropriate permissions to view application status information.
#>

function Get-CIPPAppStatus {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,

        [Parameter(Mandatory = $false)]
        [string]$AppFilter
    )

    Write-Verbose "Getting application status for tenant $CustomerTenantID"

    $endpoint = '/api/ListAppStatus'
    $params = @{
        tenantFilter = $CustomerTenantID
        appFilter    = $AppFilter
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params -Method GET
}