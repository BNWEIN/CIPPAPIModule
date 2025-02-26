<#
.SYNOPSIS
Retrieves connection filter templates for a specific customer.

.DESCRIPTION
The Get-CIPPConnectionFilterTemplates function retrieves connection filter templates for a specific customer identified by their tenant ID.

.PARAMETER CustomerTenantID
The tenant ID of the customer for whom to retrieve the connection filter templates.

.EXAMPLE
Get-CIPPConnectionFilterTemplates -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778"
Retrieves the connection filter templates for the customer with the tenant ID "7ced1621-b8f7-4231-868c-bc6b1a2f1778".

.NOTES
Requires appropriate permissions to access connection filter templates.
#>

function Get-CIPPConnectionFilterTemplates {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID
    )

    Write-Verbose "Getting Connection Filter Templates for customer: $CustomerTenantID"
    $endpoint = '/api/ListConnectionFilterTemplates'
    $params = @{
        tenantFilter = $CustomerTenantID
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}