<#
.SYNOPSIS
Retrieves app registrations for a tenant.

.DESCRIPTION
Calls the CIPP ListGraphRequest API to return application registrations for a specified tenant. Defaults mirror the App Registrations UI (includes counts and returns up to 999 results).

.PARAMETER CustomerTenantID
The ID of the customer tenant to query.

.EXAMPLE
Get-CIPPAppRegistrations -CustomerTenantID "contoso.onmicrosoft.com"
#>
function Get-CIPPAppRegistrations {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID
    )

    Write-Verbose "Getting app registrations for tenant: $CustomerTenantID"

    $endpoint = '/api/ListGraphRequest'
    $params = @{
        tenantFilter   = $CustomerTenantID
        endpoint       = 'applications'
        '$select'      = 'id,appId,displayName,createdDateTime,signInAudience,web,publisherDomain,disabledByMicrosoftStatus,applicationTemplateId,passwordCredentials,keyCredentials'
        '$top'         = 999
        '$count'       = 'true'
        'NoPagination' = 'false'
    }

    (Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params).Results
}
