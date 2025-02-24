<#
.SYNOPSIS
Gets Exchange transport rules.

.DESCRIPTION
The Get-CIPPTransportRule function retrieves all transport rules configured in Exchange Online for a tenant.

.PARAMETER CustomerTenantID
Specifies the ID of the customer tenant where the operation will be performed. This parameter is mandatory for proper data isolation and multi-tenancy compliance.

.EXAMPLE
Get-CIPPTransportRule -CustomerTenantID "12345678-1234-1234-1234-1234567890AB"
Returns all transport rules configured for the specified tenant.

.NOTES
Requires Exchange.TransportRule.Read permissions.
Transport rules define conditions and actions for email flow in the organization.
#>

function Get-CIPPTransportRule {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID
    )

    Write-Verbose "Getting transport rules for tenant $CustomerTenantID"

    $endpoint = '/api/ListTransportRules'
    $params = @{
        tenantFilter = $CustomerTenantID
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params -Method GET
}