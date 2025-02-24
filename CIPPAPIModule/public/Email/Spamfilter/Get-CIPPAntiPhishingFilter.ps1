<#
.SYNOPSIS
Gets anti-phishing filters.

.DESCRIPTION
The Get-CIPPAntiPhishingFilter function retrieves anti-phishing policies and rules configured in Exchange Online for a tenant.
The output combines policy settings with their associated rules.

.PARAMETER CustomerTenantID
Specifies the ID of the customer tenant where the operation will be performed. This parameter is mandatory for proper data isolation and multi-tenancy compliance.

.EXAMPLE
Get-CIPPAntiPhishingFilter -CustomerTenantID "12345678-1234-1234-1234-1234567890AB"
Returns all anti-phishing policies and their associated rules for the specified tenant.

.NOTES
Requires Exchange.SpamFilter.Read permissions.
Each policy entry includes:
- All policy settings
- Associated rule name
- Rule priority
- Rule recipient domains
- Rule state
#>

function Get-CIPPAntiPhishingFilter {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID
    )

    Write-Verbose "Getting anti-phishing filters for tenant $CustomerTenantID"

    $endpoint = '/api/ListAntiPhishingFilters'
    $params = @{
        tenantFilter = $CustomerTenantID
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params -Method GET
}