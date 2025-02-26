<#
.SYNOPSIS
Gets tenant onboarding information.

.DESCRIPTION
The Get-CIPPTenantOnboarding function retrieves onboarding information for tenants in CIPP, including onboarding steps, relationships, and logs.

.EXAMPLE
Get-CIPPTenantOnboarding
Returns onboarding information for all tenants, sorted by timestamp in descending order.

.NOTES
Requires Tenant.Administration.Read permissions.
The results include:
- Onboarding steps and their status
- Relationship information
- Onboarding logs
#>

function Get-CIPPTenantOnboarding {
    [CmdletBinding()]
    param ()

    Write-Verbose 'Getting tenant onboarding information'

    $endpoint = '/api/ListTenantOnboarding'

    Invoke-CIPPRestMethod -Endpoint $endpoint -Method GET
}